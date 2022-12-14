// @dart = 2.9

import 'package:flutter/material.dart';
import './src/screens/SignInPage.dart';
import './src/screens/SignUpPage.dart';
import './src/screens/HomePage.dart';
import './src/screens/Dashboard.dart';
import './profile/model/UserData.dart';
import './profile/utils/userProvider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<CookieRequest>(create: (_) {
          CookieRequest request = CookieRequest();
          return request;
        }),
        ListenableProvider<UserProvider>(create: (_) {
          UserProvider userProvider = UserProvider(
              userTemp: UserData(
                  user: "Guest",
                  name: "Guest",
                  email: "-",
                  mobile: "-",
                  github: "-",
                  instagram: "-",
                  twitter: "-",
                  facebook: "-",
                  point: 0,
                  userId: 0,
                  weight: 0,
                  profpic: "-"));
          return userProvider;
        })
      ],
      child: MaterialApp(
        title: 'Fryo',
        theme: ThemeData(
          primarySwatch: Colors.green,
          dividerColor: Colors.black,
        ),
        home: HomePage(pageTitle: 'Welcome'),
        routes: <String, WidgetBuilder>{
          '/signup': (BuildContext context) => SignUpPage(),
          '/signin': (BuildContext context) => SignInPage(),
          '/dashboard': (BuildContext context) => Dashboard(),
        },
      ),
    );
  }
}
