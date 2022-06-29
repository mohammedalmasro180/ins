
class Address {
  Address({
    this.zipcode='',
    this.country='',
    this.street='',
    this.city='',
  });

  String zipcode;
  String country;
  String street;
  String city;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    zipcode: json["zipcode"],
    country: json["country"],
    street: json["street"],
    city: json["city"],
  );

  Map<String, dynamic> toJson() => {
    "zipcode": zipcode,
    "country": country,
    "street": street,
    "city": city,
  };
}