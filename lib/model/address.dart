class Address {
  final String street, suite, city, zipcode;
  final Geo geo;

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  static Address convertJsontoAddress(Map json) {
    return Address(
        street: json['street'],
        suite: json['suite'],
        city: json['city'],
        zipcode: json['zipcode'],
        geo: Geo.convertFromjson(json['geo']));
  }
}

class Geo {
  final String laltitude, longitude;

  Geo({required this.laltitude, required this.longitude});

  static Geo convertFromjson(Map json) {
    return Geo(laltitude: json['lat'], longitude: json['lng']);
  }
}
