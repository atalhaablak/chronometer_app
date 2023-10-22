// ignore_for_file: constant_identifier_names, depend_on_referenced_packages

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../../../_remote_data_source_exports.dart';

abstract class BaseModelRepo<T> {
  late String documentID;
  static const String DOCUMENT_ID = "documentId";
  late final Collections collection;
  late CollectionReference<T> collectionReference;

  @mustCallSuper
  @UseResult("Collectionlarda document id oluşturabilmek için dönen result'ın kullanılması gerekmektedir")
  Map<String, dynamic> toMap() {
    try {
      return {
        DOCUMENT_ID: documentID,
      };
    } catch (e) {
      return {
        DOCUMENT_ID: "Yeni yaratılan nesne",
      };
    }
  }

  T fromMap(Map<String, dynamic> map, {List<String>? innerDocIds});

  ///
  /// extends edilen sınıfın API call yapıp çektiği named constructor'ında super ile çağırılması gerekmektedir.
  ///
  BaseModelRepo.initFromCollection({required Map<String, dynamic> incomingMap, List<String>? innerDocIds}) {
    _init(innerDocIds: innerDocIds);
    documentID = incomingMap[DOCUMENT_ID];
  }

  ///
  /// Lokalde oluşturulan entityler de kullanılması gereken super constructor'dır.
  ///
  BaseModelRepo.init({List<String>? innerDocIds}) {
    _init(innerDocIds: innerDocIds);
    documentID = collectionReference.doc().id;
  }

  void _init({List<String>? innerDocIds}) {
    collection = CollectionExtension.converterClassToCollections<T>();

    String collectionPath = collection.stateToCollection(innerDocIds: innerDocIds);
    collectionReference = FirebaseFirestore.instance.collection(collectionPath).withConverter<T>(
      fromFirestore: (
        DocumentSnapshot<Map<String, dynamic>> snapshot,
        SnapshotOptions? options,
      ) {
        return fromMap(snapshot.data()!, innerDocIds: innerDocIds);
      },
      toFirestore: (Object? object, SetOptions? options) {
        var incomingMap = (object as BaseModelRepo).toMap();
        return incomingMap;
      },
    );
  }
}
