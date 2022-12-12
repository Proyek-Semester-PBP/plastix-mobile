import 'package:flutter/material.dart';
import './src/screens/SignInPage.dart';
import './src/screens/SignUpPage.dart';
import './src/screens/HomePage.dart';
import './src/screens/Dashboard.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
        create: (_) {
          CookieRequest request = CookieRequest();
          return request;
        },
        child: MaterialApp(
          title: 'Fryo',
          theme: ThemeData(
            primarySwatch: Colors.green,
            dividerColor: Colors.black,
          ),
          home: HomePage(pageTitle: '',),
          routes: <String, WidgetBuilder>{
            '/signup': (BuildContext context) => SignUpPage(),
            '/signin': (BuildContext context) => SignInPage(),
            '/dashboard': (BuildContext context) => Dashboard(),
          },
        ));
  }
}
