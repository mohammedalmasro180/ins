import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../components/rounded_button.dart';
import '../../../components/rounded_input.dart';
import '../../../components/rounded_password_input.dart';

class LoginForm extends StatefulWidget {
  LoginForm({
    Key? key,
    required this.isLogin,
    required this.animationDuration,
    required this.size,
    required this.defaultLoginSize,
    this.onTap,
  }) : super(key: key);
  final void Function(String,String)?  onTap;
  final bool isLogin;
  final Duration animationDuration;
  final Size size;
  final double defaultLoginSize;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String password='',email='';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedOpacity(
        opacity: widget.isLogin ? 1.0 : 0.0,
        duration:  widget.animationDuration * 4,
        child: Align(
          alignment: AlignmentDirectional.topStart,
          child: SizedBox(
            width:  widget.size.width,
            height:  widget.defaultLoginSize,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  /*const Text(
                    'Insoft Online support',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24
                    ),
                  ),*/

                  const SizedBox(height: 20),

                  SvgPicture.asset('assets/images/login.svg',),

                  const SizedBox(height: 40),

                  RoundedInput(icon: Icons.mail, hint: 'Username',onChanged: (email){
                    this.email=email;
                    setState(() {

                    });
                  }),

                  RoundedPasswordInput(hint: 'Password',onChanged: (password){
                    this.password=password;
                    setState(() {

                    });
                  }),

                  const SizedBox(height: 10),

                  RoundedButton(title: 'LOGIN',onTap: (){
                    if( widget.onTap!=null){
                      widget.onTap!( email, password);
                    }
                  }),

                  const SizedBox(height: 10),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
