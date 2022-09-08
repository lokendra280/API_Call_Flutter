import 'dart:convert';

class Company {
  final String name, catchPhrase, bs;

  Company({required this.name, required this.catchPhrase, required this.bs});

  static Company convertJsontoCompany(Map json) {
    return Company(
        name: json['name'], catchPhrase: json['catchPhrase'], bs: json['bs']);
  }
}
