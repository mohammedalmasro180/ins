
import 'Server.dart';

class OdooAccount {
  OdooAccount({
    required this.dbName,
    required this.dbUsername,
    required this.dbPassword,
    required this.anydeskId,
    required this.anydeskPassword,
    required this.server,
    required this.category,
  });

  String dbName;
  String dbUsername;
  String dbPassword;
  String anydeskId;
  String anydeskPassword;
  Server server;
  String category;

  factory OdooAccount.fromJson(Map<String, dynamic> json) => OdooAccount(
    dbName: json["db_name"],
    dbUsername: json["db_username"],
    dbPassword: json["db_password"],
    anydeskId: json["anydesk_id"],
    anydeskPassword: json["anydesk_password"],
    server: Server.fromJson(json["server"]),
    category: json["category"],
  );

  Map<String, dynamic> toJson() => {
    "db_name": dbName,
    "db_username": dbUsername,
    "db_password": dbPassword,
    "anydesk_id": anydeskId,
    "anydesk_password": anydeskPassword,
    "server": server.toJson(),
    "category": category,
  };
}
