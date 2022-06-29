import 'package:flutter/material.dart';

import '../constants.dart';
import 'input_container.dart';
class RoundedInput extends StatelessWidget {
   RoundedInput({
    Key? key,
    required this.icon,
    required this.hint,
    this.onChanged
  }) : super(key: key);

   void Function(String)? onChanged;
  final IconData icon;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return InputContainer(
      child: TextField(
        onChanged: onChanged??(txt){},
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(icon, color: kPrimaryColor),
          hintText: hint,
          border: InputBorder.none
        ),
      ));
  }
}