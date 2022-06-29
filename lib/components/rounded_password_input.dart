import 'package:flutter/material.dart';

import '../constants.dart';
import 'input_container.dart';

class RoundedPasswordInput extends StatelessWidget {
   RoundedPasswordInput({
    Key? key,
    required this.hint,
    this.onChanged,
  }) : super(key: key);

  void Function(String)? onChanged;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return InputContainer(
      child: TextField(
        onChanged: onChanged??(txt){},
        cursorColor: kPrimaryColor,
        obscureText: true,
        decoration: InputDecoration(
          icon: const Icon(Icons.lock, color: kPrimaryColor),
          hintText: hint,
          border: InputBorder.none
        ),
      ));
  }
}