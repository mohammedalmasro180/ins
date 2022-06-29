// To parse this JSON data, do
//
//     final customer = customerFromJson(jsonString);

import 'dart:convert';

import 'Address.dart';
import 'MobileAccount.dart';
import 'OdooAccount.dart';

Customer customerFromJson(String str) => Customer.fromJson(json.decode(str));

String customerToJson(Customer data) => json.encode(data.toJson());

class Customer {
  Customer({
     this.id=-1,
     this.name='',
    required this.info,
    this.address,
    this.mobileAccount,
    this.odooAccount,
  });

  int id;
  String name;
  String info;
  Address? address;
  MobileAccount? mobileAccount;
  OdooAccount? odooAccount;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    id: int.tryParse(json["id"])??-1,
    name: json["name"],
    info: json["info"],
    address:jsonCheck(json,'address')?Address.fromJson(json["address"]):null,
    mobileAccount:jsonCheck(json,'address')? MobileAccount.fromJson(json["mobileAccount"]):null,
    odooAccount:jsonCheck(json,'address')? OdooAccount.fromJson(json["odooAccount"]):null,
  );
  factory Customer.firstFromJson(Map<String, dynamic> json) => Customer(
    name: json["name"],
    info: json["info"],
  );
  Map<String, String>  firstToJson() =>
      {
        "name": name,
        "info": info,
      };
  Map<String, String> toJson() => {
    "id": id.toString(),
    "name": name,
    "address":address==null?"":jsonEncode(address!.toJson()),
    "mobileAccount":mobileAccount==null?"":jsonEncode(mobileAccount!.toJson()),
    "odooAccount":odooAccount==null?"":jsonEncode(odooAccount!.toJson()),
  };
  Map<String, dynamic> showInfoToJson() => {
    "address":address==null?"":address!.toJson(),
    "mobileAccount":mobileAccount==null?"":mobileAccount!.toJson(),
    "odooAccount":odooAccount==null?"":odooAccount!.toJson(),
  };
}


jsonCheck(Map<String,dynamic> json,key){
  bool result= json.keys.contains(key)?json[key]!=null:false;
try{
  if(result){
    return json[key]!.isNotEmpty;
  }
}catch(e){
  return result;
}
}

/*class Customer {
  Customer({
    required this.name,
    required this.info,
  });

  String name;
  String info;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    name: json["name"],
    info: json["info"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "info": info,
  };
}*/