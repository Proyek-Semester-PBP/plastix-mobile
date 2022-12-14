import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import '../../profile/model/UserData.dart';
import '../../profile/utils/userProvider.dart';
import '../shared/styles.dart';
import '../shared/colors.dart';
import '../shared/inputFields.dart';
// import 'package:page_transition/page_transition.dart';
import './SignUpPage.dart';
import './Dashboard.dart';

class SignInPage extends StatefulWidget {
  // final String pageTitle;

  const SignInPage({Key? key}) : super(key: key);

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
          title: const Text('Sign In',
              style: TextStyle(
                  color: Colors.grey, fontFamily: 'Poppins', fontSize: 15)),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Navigator.of(context).pushReplacementNamed('/signup');
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpPage()),
                );
              },
              child: const Text('Sign Up', style: contrastText),
            )
          ],
        ),
        body: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(left: 18, right: 18),
              height: 245,
              width: double.infinity,
              decoration: authPlateDecoration,
              child: Stack(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text('Welcome Back!', style: h3),
                      const Text('Howdy, let\'s authenticate',
                          style: taglineText),
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
                      TextButton(
                        onPressed: () {},
                        child: const Text('Forgot Password?',
                            style: contrastTextBold),
                      )
                    ],
                  ),
                  Positioned(
                    bottom: 15,
                    right: -5,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: primaryColor,
                        padding: const EdgeInsets.all(13),
                        shape: const CircleBorder(),
                      ),
                      onPressed: () async {
                        debugPrint(username);
                        debugPrint(password1);
                        var response = {};
                        try {
                          response = await request.login(
                            'https://proyek-semester-pbp.up.railway.app/auth/login/',
                            {
                              'username': username.toString(),
                              'password': password1.toString()
                            },
                          );
                        } catch (e) {
                          debugPrint(e.toString());
                        }
                        // debugPrint(response['message'].toString());

                        if (request.loggedIn) {
                          // Code here will run if the login succeeded.
                          debugPrint("Sucess");
                          debugPrint(response['data'].toString());
                          userProvider.userTemp =
                              UserData.fromJson(response['data']);
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
                          _showDialog(
                              context, "Username or password is incorrect!");
                          // debugPrint(response["message"]);
                        }
                      },
                      child: Icon(Icons.arrow_forward, color: darkText),
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
        title: const Text("Login Failed"),
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
