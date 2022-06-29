import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:insoft_online_support/utils/clients/client.dart';
import '../../constants.dart';
import 'components/cancel_button.dart';
import 'components/login_form.dart';
import 'components/register_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  bool isLogin = true;
  bool isLoading = false;
  late Animation<double> containerSize;
  late double bottomHeight = 0.0;
  AnimationController? animationController;
  late AnimationController animationTransController;
  late Size size;
  Duration animationDuration = const Duration(milliseconds: 270);

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: animationDuration);
    animationTransController =
        AnimationController(vsync: this, duration: animationDuration);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      bottomHeight = size.height * .1;
      setState(() {});
    });
  }

  @override
  void dispose() {
    animationController!.dispose();
    animationTransController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    double viewInset = MediaQuery.of(context)
        .viewInsets
        .bottom; // we are using this to determine Keyboard is opened or not
    double defaultLoginSize = size.height * .9;
    double defaultRegisterSize = size.height - (size.height * 0.1);

    containerSize =
        Tween<double>(begin: size.height * 0.1, end: defaultRegisterSize)
            .animate(CurvedAnimation(
                parent: animationController!, curve: Curves.linear));

    return Scaffold(
      body: Stack(
        children: [
          //some decorations
          Positioned(
              top: 100,
              right: -50,
              child: ScaleTransition(
                scale: Tween<double>(begin: 1.0, end: 0.0)
                    .animate(animationTransController),
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: kPrimaryColor),
                ),
              )),

          AnimatedBuilder(
            animation: animationController!,
            builder: (context, child) {
              if (viewInset == 0 && isLogin) {
                return buildRegisterContainer();
              } else if (!isLogin) {
                return buildRegisterContainer();
              }
              // Returning empty container to hide the widget
              return Container();
            },
          ),

          Positioned(
              top: -50,
              left: -50,
              child: ScaleTransition(
                scale: Tween<double>(begin: 1.0, end: 0.0)
                    .animate(animationTransController),
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: kPrimaryColor),
                ),
              )),

          // Cancel Button
          CancelButton(
            isLogin: isLogin,
            animationDuration: animationDuration,
            size: size,
            animationController: animationController,
            tapEvent: isLogin
                ? null
                : () {
                    // returning null to disable the button
                    animationController!.reverse();
                    setState(() {
                      isLogin = !isLogin;
                    });
                  },
          ),

          // Login Form
          ScaleTransition(
            scale: Tween<double>(begin: 1.0, end: 0.0)
                .animate(animationTransController),
            child: LoginForm(
                onTap: (String email, String password) async {
                  isLoading == true;
                  setState(() {});
                  var result = await Client.login(email, password);
                  if (result is bool) {
                    if (result) {
                      animationTransController.forward().then((value) async {
                        bottomHeight = 0.0;
                        isLoading = false;
                        setState(() {});
                        Future.delayed(const Duration(milliseconds: 325), () {
                          context.go('/');
                        });
                      });
                    } else {
                      isLoading = false;
                      setState(() {});
                    }
                  } else {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Error'),
                            content: Text(result),
                            actions: [
                              ElevatedButton(
                                child: const Text('Ok'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              )
                            ],
                          );
                        });
                  }
                },
                isLogin: isLogin,
                animationDuration: animationDuration,
                size: size,
                defaultLoginSize: defaultLoginSize),
          ),

          // Register Container

          // Register Form
          RegisterForm(
              isLogin: isLogin,
              animationDuration: animationDuration,
              size: size,
              defaultLoginSize: defaultRegisterSize),
          Visibility(
            visible: isLoading,
            child: Container(
              height: size.height,
              width: size.width,
              color: kPrimaryColor.withOpacity(0.2),
              child: const Center(
                child: CircularProgressIndicator.adaptive(
                  valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildRegisterContainer() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: size.width,
        height: bottomHeight,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(100),
              topRight: Radius.circular(100),
            ),
            color: kBackgroundColor),
        alignment: Alignment.center,
        child: ScaleTransition(
          scale: Tween<double>(begin: 1.0, end: 0.0)
              .animate(animationTransController),
          child: GestureDetector(
            onTap: () {},
            child: isLogin
                ? const Text(
                    'Insoft online support',
                    style: TextStyle(
                        color: Colors.white,
                        shadows: [
                          BoxShadow(
                            color: Colors.white,
                            blurRadius: 10,
                            spreadRadius: 5,
                            offset: Offset(0, 0),
                          )
                        ],
                        fontSize: 18),
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
