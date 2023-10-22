import 'package:chronometer_app/core/utils/remote_data_source/https/domain/repo/base_model_repository.dart';

class Account extends BaseModelRepo<Account> {
  Account.init() : super.init();

  late String? email;
  late String? password;
  late String? name;
  late String? surname;
  late String? country;
  late String? phoneNumber;

  Account.createAccount({
    required String this.email,
    required String this.password,
    required String this.name,
    required String this.surname,
    required String this.country,
    required String this.phoneNumber,
  }) : super.init();

  Account.createAccountFromCollection(Map<String, dynamic> map) : super.initFromCollection(incomingMap: map) {
    email = map['email'];
    password = map['password'];
    name = map['name'];
    surname = map['surname'];
    country = map['country'];
    phoneNumber = map['phoneNumber'];
  }

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = super.toMap();
    map['email'] = email;
    map['password'] = password;
    map['name'] = name;
    map['surname'] = surname;
    map['country'] = country;
    map['phoneNumber'] = phoneNumber;
    return map;
  }

  @override
  Account fromMap(Map<String, dynamic> map, {List<String>? innerDocIds}) {
    return Account.createAccountFromCollection(map);
  }
}
