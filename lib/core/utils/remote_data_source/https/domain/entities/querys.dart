// ignore_for_file: constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

class Querys {
  final QueryEnum queryEnum;
  final String filteringField;
  dynamic filterValue;
  final DocumentSnapshot? lastIndex;
  final WhereType? filterType;

  Querys._({
    required this.queryEnum,
    required this.filteringField,
    this.filterValue,
    this.lastIndex,
    this.filterType,
  });

  factory Querys.where({
    required String filteringField,
    required dynamic filterValue,
    required WhereType filterType,
  }) {
    return Querys._(
      queryEnum: QueryEnum.WHERE,
      filteringField: filteringField,
      filterValue: filterValue,
      filterType: filterType,
    );
  }

  factory Querys.limit({
    required String filteringField,
    int filterValue = 10,
    DocumentSnapshot? lastIndex,
  }) {
    return Querys._(
      queryEnum: QueryEnum.LIMIT,
      filteringField: filteringField,
      filterValue: filterValue,
      lastIndex: lastIndex,
    );
  }

  factory Querys.orderBy({
    required String filteringField,
    required bool filterValue,
  }) {
    return Querys._(
      queryEnum: QueryEnum.ORDER_BY,
      filteringField: filteringField,
      filterValue: filterValue,
    );
  }

  getQuery(Query ref) {
    switch (queryEnum) {
      case QueryEnum.WHERE:
        switch (filterType) {
          case WhereType.IS_NULL:
            return ref.where(filteringField, isNull: filterValue);

          case WhereType.IS_EQUAL:
            return ref.where(filteringField, isEqualTo: filterValue);

          case WhereType.IS_NOT_EQUAL:
            return ref.where(filteringField, isNotEqualTo: filterValue);

          case WhereType.IS_GREATER:
            return ref.where(filteringField, isGreaterThan: filterValue);

          case WhereType.IS_GREATER_OR_EQUAL:
            return ref.where(filteringField, isGreaterThanOrEqualTo: filterValue);

          case WhereType.IS_LESS:
            return ref.where(filteringField, isLessThan: filterValue);

          case WhereType.IS_LESS_OR_EQUAL:
            return ref.where(filteringField, isLessThanOrEqualTo: filterValue);

          case WhereType.WHERE_IN:
            return ref.where(filteringField, whereIn: filterValue);

          case WhereType.WHERE_NOT_IN:
            return ref.where(filteringField, whereNotIn: filterValue);

          case WhereType.ARRAY_CONTAINS:
            return ref.where(filteringField, arrayContains: filterValue);

          case WhereType.ARRAY_CONTAINS_ANY:
            return ref.where(filteringField, arrayContainsAny: filterValue);

          default:
            return ref;
        }

      case QueryEnum.LIMIT:
        if (lastIndex != null) {
          return ref
              .orderBy(filteringField, descending: true)
              .startAfterDocument(lastIndex!)
              .limit(filterValue);
        } else {
          return ref
              .orderBy(filteringField, descending: true)
              .limit(filterValue);
        }

      case QueryEnum.ORDER_BY:
        return ref.orderBy(filteringField, descending: filterValue);
    }
  }
}

enum QueryEnum {
  WHERE,
  LIMIT,
  ORDER_BY,
}

enum WhereType {
  IS_NULL,
  IS_EQUAL,
  IS_NOT_EQUAL,
  IS_GREATER,
  IS_GREATER_OR_EQUAL,
  IS_LESS,
  IS_LESS_OR_EQUAL,
  WHERE_IN,
  WHERE_NOT_IN,
  ARRAY_CONTAINS,
  ARRAY_CONTAINS_ANY,
}
