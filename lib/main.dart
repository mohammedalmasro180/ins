import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:insoft_online_support/screens/Dashboard/Dashboard.dart';

import 'package:insoft_online_support/screens/Dashboard/FeedbackList.dart';
import 'package:insoft_online_support/screens/Task/Task.dart';
import 'package:insoft_online_support/screens/home%20page/home_page.dart';
import 'package:insoft_online_support/screens/login/login.dart';
import 'package:insoft_online_support/theme/theme_colors.dart';
import 'package:insoft_online_support/utils/clients/data.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:insoft_online_support/utils/providers/customers_provider.dart';
import 'package:insoft_online_support/utils/providers/feedback_provider.dart';
import 'theme/theme.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await initAppData();
  runApp(MultiProvider(

    builder: (context,child)=>EasyLocalization(
        supportedLocales: const [Locale('en')],
        path: 'assets/translations',
        saveLocale: true,
        fallbackLocale: const Locale('en'),
        child:   MyApp()
    ),
    providers: [
      ChangeNotifierProvider(create: (context)=>FeedbacksProvider()),
      ChangeNotifierProvider(create: (context)=>CustomersProvider()),
    ],
  )
  );
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

  @override
  ThemeData _darkTheme = ThemeData(
    accentColor: Colors.red,
    brightness: Brightness.dark,
    primaryColor: Colors.amber,

  );

   ThemeData _lightTheme = ThemeData(
       accentColor: Colors.pink,
       brightness: Brightness.light,
       primaryColor: bluLayerzero
   );
  Widget build(BuildContext context) => ThemeProvider(

    initTheme:  (themeMode.brightness ==MyThemes.darkTheme.brightness) ? MyThemes.darkTheme : MyThemes.lightTheme,
    builder:  (context,theme) => MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      title: 'Insoft Online Support',
      debugShowCheckedModeBanner: false,
      theme: _lightTheme,

      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    ),
  );

  /*return MaterialApp.router(

      home:Navigator(
          pages:  [
            const MaterialPage(child: HomePage()),

            if(!checkToken())
              const MaterialPage(child: LoginScreen()),
          ],
        onPopPage: (route,result){
            return route.didPop(result);
        },
      )
    );*/
  final GoRouter _router = GoRouter(
    redirect: (state){
      final loggedIn=checkToken();
      final isLoginPage=state.location=='/logIn';
      if(!loggedIn&&!isLoginPage) {
        return '/logIn';
      }
      else if(loggedIn&&isLoginPage){
        return '/';
      }
      return null;
    },
    urlPathStrategy: UrlPathStrategy.path,
    routes: [
      GoRoute(
        name: 'logIn',
        path: '/logIn',
        builder: (BuildContext context, GoRouterState state) =>
        const LoginScreen(),
      ),
      GoRoute(
        name: 'Home',
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
        const Dashboard(),
      ),
    ],
  );
}
class text extends StatefulWidget {
  const text({Key? key}) : super(key: key);

  @override
  _textState createState() => _textState();
}

class _textState extends State<text> {
  ThemeData _darkTheme = ThemeData(
    accentColor: Colors.red,
    brightness: Brightness.dark,
    primaryColor: Colors.amber,

  );

  ThemeData _lightTheme = ThemeData(
      accentColor: Colors.pink,
      brightness: Brightness.light,
      primaryColor: Colors.blue
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: Center(
        child:
        Switch(
            value: true,
            onChanged: (toggle){

            }),
      ),
    );
  }
}
