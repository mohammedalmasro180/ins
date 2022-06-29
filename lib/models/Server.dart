
class Server {
  Server({
     this.name='',
     this.host='',
     this.domain='',
     this.password='',
     this.username='',
    this.port='',
  });

  String name;
  String host;
  String domain;
  String password;
  String username;
  String port;

  factory Server.fromJson(Map<String, dynamic> json) => Server(
    name: json["name"],
    host: json["host"],
    domain: json["domain"],
    password: json["password"],
    username: json["username"],
    port: json["port"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "host": host,
    "domain": domain,
    "password": password,
    "username": username,
    "port": port,
  };
}