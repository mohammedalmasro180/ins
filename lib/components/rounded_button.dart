import 'package:flutter/material.dart';

import '../constants.dart';

class RoundedButton extends StatelessWidget {
   RoundedButton({
    Key? key,
    required this.title, this.onTap,
  }) : super(key: key);
   void Function()?  onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return InkWell(
      onTap: onTap??(){},
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: size.width * 0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: kPrimaryColor,
        ),

        padding: EdgeInsets.symmetric(vertical: 20),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18
          ),
        ),
      ),
    );
  }
}