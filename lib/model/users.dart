import 'address.dart';
import 'userinfo.dart';
import 'company.dart';

class User {
  final Address address;
  final Userinfo userinfo;
  final Company company;

  User({
    required this.address,
    required this.userinfo,
    required this.company,
  });

  static User convertToUser(Map json) {
    return User(
      address: Address.convertJsontoAddress(json['address']),
      userinfo: Userinfo.convertJsontoUserinfo(json),
      company: Company.convertJsontoCompany(json['company']),
    );
  }
}
