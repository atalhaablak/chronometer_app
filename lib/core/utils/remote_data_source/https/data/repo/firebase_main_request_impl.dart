import 'package:chronometer_app/core/error/failure.dart';
import 'package:chronometer_app/core/extensions/list_extension.dart';
import 'package:chronometer_app/core/utils/remote_data_source/https/domain/entities/collections.dart';
import 'package:chronometer_app/core/utils/remote_data_source/https/domain/entities/querys.dart';
import 'package:chronometer_app/core/utils/remote_data_source/https/domain/repo/base_model_repository.dart';
import 'package:chronometer_app/core/utils/remote_data_source/https/domain/repo/base_request_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class FirebaseMainRequestImpl implements BaseRequestRepository {
  FirebaseMainRequestImpl();

  @override
  Either<Failure, Stream<List<T>>> listen<T extends BaseModelRepo>({List<Querys>? querys, List<String>? innerDocIds}) {
    try {
      Collections fetchedCollection = CollectionExtension.converterClassToCollections<T>();
      CollectionReference<T> collectionReference = fetchedCollection.getConvertedReferance(innerDocIds: innerDocIds);

      if (querys != null) {
        Query<T> requestQuery = querys.first.getQuery(collectionReference);
        querys.removeAt(0);
        for (Querys singleQuery in querys) {
          requestQuery = singleQuery.getQuery(requestQuery);
        }

        return Right(_convertSnapshotStreamToTList<T>(requestQuery));
      } else {
        return Right(_convertSnapshotStreamToTList<T>(collectionReference));
      }
    } on Exception catch (e) {
      Failure returnedFailure = InternalFailure();
      returnedFailure.errorMessage = "$e";
      return Left(returnedFailure);
    }
  }

  @override
  Future<Either<Failure, List<T>>> fetch<T extends BaseModelRepo>({List<Querys>? querys, List<String>? innerDocIds}) async {
    try {
      List<T> fetchedData = [];

      Collections fetchedCollection = CollectionExtension.converterClassToCollections<T>();
      CollectionReference<T> collectionReference = fetchedCollection.getConvertedReferance(innerDocIds: innerDocIds);

      if (querys.getValueOrDefault.isNotEmpty) {
        var requestQuery = querys.getValueOrDefault.first.getQuery(collectionReference);
        querys.getValueOrDefault.removeAt(0);
        for (Querys singleQuery in querys.getValueOrDefault) {
          requestQuery = singleQuery.getQuery(requestQuery);
        }
        fetchedData = await _fetchData(requestQuery);
      } else {
        fetchedData = await _fetchData(collectionReference);
      }

      return Right(fetchedData);
    } on FirebaseException catch (e) {
      Failure returnedFailure = InternalFailure();
      returnedFailure.errorMessage = "$e";
      return Left(returnedFailure);
    }
  }

  @override
  Future<Either<Failure, void>> post({required BaseModelRepo updatedData}) async {
    try {
      await updatedData.collectionReference.doc(updatedData.documentID).set(updatedData);
      return const Right(null);
    } catch (e) {
      Failure returnedFailure = InternalFailure();
      returnedFailure.errorMessage = "$e";
      return Left(returnedFailure);
    }
  }

  @override
  Future<Either<Failure, void>> delete({required BaseModelRepo deletedData}) async {
    try {
      await deletedData.collectionReference.doc(deletedData.documentID).delete();
      return const Right(null);
    } catch (e) {
      return Left(NotFoundFailure());
    }
  }

  Future<List<T>> _fetchData<T>(Query query) async {
    List<T> fetchedData = [];
    QuerySnapshot querySnapshot = await query.get();
    for (QueryDocumentSnapshot singleSnapshot in querySnapshot.docs) {
      fetchedData.add((singleSnapshot.data() as T));
    }

    return fetchedData;
  }

  Stream<List<T>> _convertSnapshotStreamToTList<T>(Query quert) {
    var snapShotStream = quert.snapshots();
    return snapShotStream.map<List<T>>(
      (QuerySnapshot querySnapshot) {
        List<T> fetchedData = [];

        for (QueryDocumentSnapshot singleSnapshot in querySnapshot.docs) {
          fetchedData.add((singleSnapshot.data() as T));
        }

        return fetchedData;
      },
    );
  }
}
