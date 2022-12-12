import 'package:flutter/material.dart';
import 'package:fryo/src/shared/Product.dart';
import 'package:fryo/src/utils/userProvider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import './src/screens/SignInPage.dart';
import './src/screens/SignUpPage.dart';
import './src/screens/HomePage.dart';
import './src/screens/Dashboard.dart';
import './src/screens/ProductPage.dart';
import './src/model/UserData.dart';
import './src/utils/userProvider.dart';
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
                  name: "Guest",
                  email: "-",
                  mobile: "",
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
          '/signup': (BuildContext context) => SignUpPage(
                pageTitle: "Plastix",
              ),
          '/signin': (BuildContext context) => SignInPage(
                pageTitle: "Plastix",
              ),
          '/dashboard': (BuildContext context) => Dashboard(
                pageTitle: "Plastix",
              ),
          '/productPage': (BuildContext context) => ProductPage(
                pageTitle: "Plastix",
                productData: new Product(
                    name: "",
                    price: "",
                    discount: 0.0,
                    image: "",
                    userLiked: false),
              ),
        },
      ),
    );
  }
}
