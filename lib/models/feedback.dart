import 'dart:convert';
import 'package:insoft_online_support/models/enums/feedback_enums.dart';

import 'customer.dart';

Feedback feedbackFromJson(String str) => Feedback.fromJson(json.decode(str));

String feedbackToJson(Feedback data) => json.encode(data.toJson());

class Feedback {

  Feedback({
    this.id,
    this.description='',
    required this.type,
    this.reviewAt='',
    required this.status,
    required this.customer,
  });

  String? id;
  String description;
  String type;
  dynamic reviewAt;
  String status;
  Customer customer;

  factory Feedback.fromJson(Map<String, dynamic> json) => Feedback(
    id: json["id"].toString(),
    description: json["description"]??'',
    type: json["type"]??"",
    reviewAt: json["review_at"],
    status: json["status"]??'',
    customer: Customer.firstFromJson(json["customer"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "description": description,
    "type": type,
    "review_at": reviewAt,
    "status": status,
    "customer": customer.toJson(),
  };
Map<String, dynamic> infoShowToJson() => {
"customer": customer.firstToJson(),
  "status": status,
  "type": type,
  "review_at": reviewAt,
  "description": description,
};
}

