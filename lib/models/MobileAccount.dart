
import 'Subdomin.dart';

class MobileAccount {
  MobileAccount({
    this.email='',
    this.password='',
    required this.subdomain,
  });

  String email;
  String password;
  Subdomain subdomain;

  factory MobileAccount.fromJson(Map<String, dynamic> json) => MobileAccount(
    email: json["email"],
    password: json["password"],
    subdomain: Subdomain.fromJson(json["subdomain"]),
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
    "subdomain": subdomain.toJson(),
  };
}