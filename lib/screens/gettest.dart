import 'package:flutter/material.dart';
import 'package:insoft_online_support/utils/clients/client.dart';
class gettest extends StatefulWidget {
  const gettest({Key? key}) : super(key: key);

  @override
  _gettestState createState() => _gettestState();
}

class _gettestState extends State<gettest> {
  @override
  Widget build(BuildContext context) {
    Client.getCustomerById(1);

    return Scaffold();
  }
}
