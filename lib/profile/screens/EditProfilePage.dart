import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fryo/src/screens/HomePage.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

import '../../profile/utils/userProvider.dart';
import '../../src/shared/styles.dart';
import '../../src/shared/colors.dart';
import '../../src/shared/fryo_icons.dart';
import 'package:page_transition/page_transition.dart';

import '../utils/user_prefrences.dart';
import '../widget/button_widget.dart';
import '../widget/profile_widget.dart';
import '../model/user.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  User user = UserPrefrences.myUser;
  // late String _name;
  // late String _email;
  // late String _mobile;
  // late String _github;
  // late String _instagram;
  // late String _twitter;
  // late String _facebook;
  // late int _point;
  // late int _userId;
  // late int _weight;
  late String _profpic;

  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = context.watch<UserProvider>();

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: primaryColor,
          title: Text('PlastiX',
              style: logoWhiteStyle, textAlign: TextAlign.center),
          actions: <Widget>[
            IconButton(
              padding: EdgeInsets.only(),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: HomePage(
                          pageTitle: "Plastix",
                        )));
              },
              iconSize: 21,
              icon: Icon(Fryo.power_swtich),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 32),
            physics: BouncingScrollPhysics(),
            children: [
              ProfileWidget(
                imagePath:
                    "https://fiverr-res.cloudinary.com/images/t_main1,q_auto,f_auto,q_auto,f_auto/gigs2/164316223/original/4c5c4626dc34d006e0497738ccfb80f5d189626e/do-minecraft-8-bit-profile-picture.png",
                onClicked: () async {},
              ),
              const SizedBox(height: 24),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  hintText: userProvider.name,
                ),
                onChanged: (String name) {
                  setState(() {
                    userProvider.name = name;
                  });
                },
              ),
              const SizedBox(height: 24),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: "example@email.com",
                ),
                // controller: myController,
                onChanged: (String email) {
                  setState(() {
                    userProvider.email = email;
                  });
                },
              ),
              const SizedBox(height: 24),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Mobile',
                  hintText: "+1234567890",
                ),
                // controller: myController,
                onChanged: (String mobile) {
                  setState(() {
                    userProvider.mobile = mobile;
                  });
                },
              ),
              const SizedBox(height: 24),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Github Account',
                  hintText: "Github",
                ),
                // controller: myController,
                onChanged: (String github) {
                  setState(() {
                    userProvider.github = github;
                  });
                },
              ),
              const SizedBox(height: 24),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Instagram Account',
                  hintText: "Instagram",
                ),
                // controller: myController,
                onChanged: (String instagram) {
                  setState(() {
                    userProvider.instagram = instagram;
                  });
                },
              ),
              const SizedBox(height: 24),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Twitter',
                  hintText: "Twitter",
                ),
                // controller: myController,
                onChanged: (String twitter) {
                  setState(() {
                    userProvider.twitter = twitter;
                  });
                },
              ),
              const SizedBox(height: 24),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Facebook',
                  hintText: "Facebook",
                ),
                // controller: myController,
                onChanged: (String facebook) {
                  setState(() {
                    userProvider.facebook = facebook;
                  });
                },
              ),
              const SizedBox(height: 24),
              Center(child: buildSaveButton()),
            ],
          ),
        ));
  }

  Widget buildSaveButton() {
    final userProvider = context.watch<UserProvider>();
    final request = context.watch<CookieRequest>();

    return ButtonWidget(
      text: 'Save',
      onClicked: () async {
        // debugPrint(_name);
        // user.name = _name;
        final response = await request.post(
          'https://proyek-semester-pbp.up.railway.app/auth/update/',
          {
            "name": userProvider.name.toString(),
            "email": userProvider.email.toString(),
            "mobile": userProvider.mobile.toString(),
            "github:": userProvider.github.toString(),
            "instagram": userProvider.instagram.toString(),
            "twitter": userProvider.twitter.toString(),
            "facebook": userProvider.facebook.toString()
          },
        );
        debugPrint(response["message"]);
        Navigator.pop(context);
      },
    );
  }
}
