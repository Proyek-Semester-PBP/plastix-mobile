import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fryo/src/model/user.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import '../shared/styles.dart';
import '../shared/colors.dart';
import '../shared/inputFields.dart';
import 'package:page_transition/page_transition.dart';
import './SignUpPage.dart';
import './Dashboard.dart';
import '../model/UserData.dart';
import '../utils/userProvider.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class SignInPage extends StatefulWidget {
  final String pageTitle;

  SignInPage({Key key, this.pageTitle}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String username = '';
  String password1 = '';

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    final userProvider = context.watch<UserProvider>();

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: white,
          title: Text('Sign In',
              style: TextStyle(
                  color: Colors.grey, fontFamily: 'Poppins', fontSize: 15)),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Navigator.of(context).pushReplacementNamed('/signup');
                Navigator.pushReplacement(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: SignUpPage()));
              },
              child: Text('Sign Up', style: contrastText),
            )
          ],
        ),
        body: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 18, right: 18),
              child: Stack(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Welcome Back!', style: h3),
                      Text('Howdy, let\'s authenticate', style: taglineText),
                      TextField(
                        style: inputFieldTextStyle,
                        decoration: InputDecoration(
                            hintText: "Username",
                            hintStyle: inputFieldHintTextStyle,
                            focusedBorder: inputFieldFocusedBorderStyle,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            border: inputFieldDefaultBorderStyle),
                        // controller: myController,
                        onChanged: (String _username) {
                          setState(() {
                            username = _username;
                          });
                        },
                      ),
                      TextField(
                        obscureText: true,
                        style: inputFieldHintPaswordTextStyle,
                        decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: inputFieldHintPaswordTextStyle,
                            focusedBorder: inputFieldFocusedBorderStyle,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            border: inputFieldDefaultBorderStyle),
                        // controller: myController,
                        onChanged: (String _password1) {
                          setState(() {
                            password1 = _password1;
                          });
                        },
                      ),
                      TextButton(
                        onPressed: () {},
                        child:
                            Text('Forgot Password?', style: contrastTextBold),
                      )
                    ],
                  ),
                  Positioned(
                    bottom: 15,
                    right: -5,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: primaryColor,
                        padding: EdgeInsets.all(13),
                        shape: CircleBorder(),
                      ),
                      onPressed: () async {
                        debugPrint(username);
                        debugPrint(password1);
                        var response = {};
                        try {
                          response = await request.login(
                            'https://proyek-semester-pbp.up.railway.app/auth',
                            {
                              'username': username,
                              'password': password1,
                            },
                          );
                        } catch (e) {
                          debugPrint(e.toString());
                        }
                        // debugPrint(response['message'].toString());
                        if (request.loggedIn) {
                          // Code here will run if the login succeeded.
                          debugPrint("Sucess");
                          userProvider.user =
                              UserData.fromJson(response['user']);
                          debugPrint(username);
                          debugPrint(password1);
                          Navigator.pushReplacement(
                              context,
                              PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  child: Dashboard()));
                        } else {
                          // Code here will run if the login failed (wrong username/password).
                          debugPrint("Username or password is incorrect!");
                          debugPrint(response["message"]);
                        }
                      },
                      child: Icon(Icons.arrow_forward, color: darkText),
                    ),
                  )
                ],
              ),
              height: 245,
              width: double.infinity,
              decoration: authPlateDecoration,
            ),
          ],
        ));
  }
}
