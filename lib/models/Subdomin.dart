
class Subdomain {
  Subdomain({
    required this.id,
    required this.name,
    required this.url,
  });

  int id;
  String name;
  String url;

  factory Subdomain.fromJson(Map<String, dynamic> json) => Subdomain(
    id: json["id"],
    name: json["name"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "url": url,
  };
}