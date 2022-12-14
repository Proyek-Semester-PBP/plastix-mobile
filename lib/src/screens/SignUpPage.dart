import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import '../../profile/utils/userProvider.dart';
import '../shared/styles.dart';
import '../shared/colors.dart';
import '../shared/inputFields.dart';
// import 'package:page_transition/page_transition.dart';
import './SignInPage.dart';
import './Dashboard.dart';

class SignUpPage extends StatefulWidget {
  // final String pageTitle;

  SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String username = '';
  String email = '';
  String password1 = '';
  String password2 = '';

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    final userProvider = context.watch<UserProvider>();
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: white,
          title: const Text('Sign Up',
              style: TextStyle(
                  color: Colors.grey, fontFamily: 'Poppins', fontSize: 15)),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Navigator.of(context).pushReplacementNamed('/signin');
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SignInPage()),
                );
              },
              child: Text('Sign In', style: contrastText),
            )
          ],
        ),
        body: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 18, right: 18),
              height: 360,
              width: double.infinity,
              decoration: authPlateDecoration,
              child: Stack(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Welcome to Plastx!', style: h3),
                      Text('Let\'s get started', style: taglineText),
                      TextField(
                        style: inputFieldTextStyle,
                        decoration: const InputDecoration(
                            hintText: "Username",
                            hintStyle: inputFieldHintTextStyle,
                            focusedBorder: inputFieldFocusedBorderStyle,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            border: inputFieldDefaultBorderStyle),
                        // controller: myController,
                        onChanged: (String? _username) {
                          setState(() {
                            username = _username!;
                          });
                        },
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        style: inputFieldTextStyle,
                        decoration: const InputDecoration(
                            hintText: "Email",
                            hintStyle: inputFieldHintTextStyle,
                            focusedBorder: inputFieldFocusedBorderStyle,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            border: inputFieldDefaultBorderStyle),
                        // controller: myController,
                        onChanged: (String? _email) {
                          setState(() {
                            email = _email!;
                          });
                        },
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        obscureText: true,
                        style: inputFieldHintPaswordTextStyle,
                        decoration: const InputDecoration(
                            hintText: "Password",
                            hintStyle: inputFieldHintPaswordTextStyle,
                            focusedBorder: inputFieldFocusedBorderStyle,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            border: inputFieldDefaultBorderStyle),
                        // controller: myController,
                        onChanged: (String? _password1) {
                          setState(() {
                            password1 = _password1!;
                          });
                        },
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        obscureText: true,
                        style: inputFieldHintPaswordTextStyle,
                        decoration: const InputDecoration(
                            hintText: "Password",
                            hintStyle: inputFieldHintPaswordTextStyle,
                            focusedBorder: inputFieldFocusedBorderStyle,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            border: inputFieldDefaultBorderStyle),
                        // controller: myController,
                        onChanged: (String? _password2) {
                          setState(() {
                            password2 = _password2!;
                          });
                        },
                      ),
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
                        debugPrint(email);
                        debugPrint(password2);
                        debugPrint(password1);
                        var response = {};
                        try {
                          response = await request.post(
                            'https://proyek-semester-pbp.up.railway.app/auth/register/',
                            {
                              'username': username.toString(),
                              'email': email.toString(),
                              'password1': password1.toString(),
                              'password2': password2.toString(),
                            },
                          );
                        } catch (e) {
                          debugPrint(e.toString());
                        }
                        debugPrint(response['message']);
                        if (response['success'] == true) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignInPage()),
                          );
                        } else {
                          _showDialog(context, response['message']);
                        }
                      },
                      child: Icon(Icons.arrow_forward, color: white),
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}

void _showDialog(BuildContext context, String description) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Registration Failed"),
        content: Text(description),
        actions: <Widget>[
          TextButton(
            child: const Text("OK"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
