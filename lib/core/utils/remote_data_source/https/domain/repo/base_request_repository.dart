import 'package:chronometer_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';

import '../../../_remote_data_source_exports.dart';

abstract class BaseRequestRepository {
  ///
  /// Gönderilen querys'e göre [T]'nin collection'ına göre verileri liste formatında döner.
  /// [T] [BaseModelRepo] türünde olmak zorundadır aksi halde assert'e takılır.
  /// ```dart
  /// Şeklinde kullanılır -> sl<BaseRequestRepository>().fetch<Test>();
  /// ```
  ///
  /// querys:
  ///
  /// * [QueryEnum.WHERE] -> İçerisine [filterValue], [filterType] alanlarını almak zorundadır
  /// [lastIndex] geçilmemesi gerekmektedir. [lastIndex] geçilmemelidir.
  ///
  /// ```dart
  ///   Querys(queryEnum: QueryEnum.WHERE, filteringField: "filtrelenecek alan",
  ///   filterType: WhereType.IS_EQUAL, filterValue: "filtrelenecek değer",),
  /// ```
  ///
  /// * [QueryEnum.LIMIT] -> [filterValue] geçilmez ise değeri 10 olarak atanır. [lastIndex]
  /// parametresi geçilir ise kalınan son indexten getirir. Ekstradan [QueryEnum.ORDER_BY]
  /// filtresinin geçilmesine gerek kalmaz kendi içerisinde order by işlemini gerçekleşirir.
  /// [filterType] alanı geçilmemesi gerekmektedir.
  ///
  /// ```dart
  ///   Querys(queryEnum: QueryEnum.LIMIT, filteringField: "sıralanacak field", filterValue: 10,),
  /// ```
  ///
  /// * [QueryEnum.ORDER_BY] -> [filterValue] parametresi azalan/artan değerini simgeler, [bool] değer almalıdır.
  /// [filterType] alanı geçilmemesi gerekmektedir.
  ///
  /// ```dart
  ///   Querys(queryEnum: QueryEnum.ORDER_BY,filteringField:"sıralanacak field",filterValue: true,),
  /// ```
  ///
  /// * [innerDocIds] -> Eğer [T] bir sub collection ise geçilmesi gerekmektedir. İçerisindeki değerler
  /// Collection path'indeki document ID'lerini belirtir. Sub collection'ın derinliği ile eşit sayıda
  /// liste elemanı barındırması gerekmektedir.
  ///
  Future<Either<Failure, List<T>>> fetch<T extends BaseModelRepo>({List<Querys>? querys, List<String>? innerDocIds});

  ///
  /// Gönderilen querys'e göre T'nin collection'ına göre verileri Stream<List> formatında döner
  /// [T] [BaseModelRepo] türünde olmak zorundadır aksi halde assert'e takılır.
  ///
  /// querys:
  ///
  /// * [QueryEnum.WHERE] -> İçerisine [filterValue], [filterType] alanlarını almak zorundadır
  /// [lastIndex] geçilmemesi gerekmektedir. [lastIndex] geçilmemelidir.
  ///
  /// ```dart
  ///   Querys(queryEnum: QueryEnum.WHERE, filteringField: "filtrelenecek alan",
  ///   filterType: WhereType.IS_EQUAL, filterValue: "filtrelenecek değer",),
  /// ```
  ///
  /// * [QueryEnum.LIMIT] -> [filterValue] geçilmez ise değeri 10 olarak atanır. [lastIndex]
  /// parametresi geçilir ise kalınan son indexten getirir. Ekstradan [QueryEnum.ORDER_BY]
  /// filtresinin geçilmesine gerek kalmaz kendi içerisinde order by işlemini gerçekleşirir.
  /// [filterType] alanı geçilmemesi gerekmektedir.
  ///
  /// ```dart
  ///   Querys(queryEnum: QueryEnum.LIMIT, filteringField: "sıralanacak field", filterValue: 10,),
  /// ```
  ///
  /// * [QueryEnum.ORDER_BY] -> [filterValue] parametresi azalan/artan değerini simgeler, [bool] değer almalıdır.
  /// [filterType] alanı geçilmemesi gerekmektedir.
  ///
  /// ```dart
  ///   Querys(queryEnum: QueryEnum.ORDER_BY,filteringField:"sıralanacak field",filterValue: true,),
  /// ```
  ///
  /// * [innerDocIds] -> Eğer [T] bir sub collection ise geçilmesi gerekmektedir. İçerisindeki değerler
  /// Collection path'indeki document ID'lerini belirtir. Sub collection'ın derinliği ile eşit sayıda
  /// liste elemanı barındırması gerekmektedir.
  ///
  Either<Failure, Stream<List<T>>> listen<T extends BaseModelRepo>({List<Querys>? querys, List<String>? innerDocIds});

  ///
  /// İçerisine geçilen class'ı gerekli collection'da oluşturur ya da update eder.
  ///
  /// İçeride gerçekleşen durumlara uygun olarak Failure türünde hata döner.
  ///
  Future<Either<Failure, void>> post({required BaseModelRepo updatedData});

  ///
  /// İçerisine geçilen veriyi siler.
  ///
  Future<Either<Failure, void>> delete({required BaseModelRepo deletedData});
}
