import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fryo/src/screens/HomePage.dart';

import '../shared/styles.dart';
import '../shared/colors.dart';
import '../shared/fryo_icons.dart';
import './ProfilePage.dart';
import 'package:page_transition/page_transition.dart';

import 'package:postgres/postgres.dart';

import '../utils/user_prefrences.dart';
import '../widget/button_widget.dart';
import '../widget/profile_widget.dart';
import '../widget/textfield_widget.dart';
import '../model/user.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  User user = UserPrefrences.myUser;
  String _name;
  String _email;
  String _mobile;
  String _github;
  String _instagram;
  String _twitter;
  String _facebook;
  int _point;
  int _userId;
  int _weight;
  String _profpic;

  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: primaryColor,
        title:
            Text('PlastiX', style: logoWhiteStyle, textAlign: TextAlign.center),
        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.only(),
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeft, child: HomePage()));
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
              imagePath: user.imagePath,
              onClicked: () async {},
            ),
            const SizedBox(height: 24),
            TextField(
              decoration: InputDecoration(
                labelText: 'Full Name',
                hintText: user.name,
              ),
              onChanged: (String name) {
                setState(() {
                  _name = name;
                });
              },
            ),
            const SizedBox(height: 24),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: user.email,
              ),
              // controller: myController,
              onChanged: (String email) {
                setState(() {
                  _email = email;
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
                  _github = github;
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
                  _instagram = instagram;
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
                  _twitter = twitter;
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
              onChanged: (facebook) {
                setState(() {
                  _facebook = facebook;
                });
              },
            ),
            const SizedBox(height: 24),
            Center(child: buildSaveButton()),
          ],
        ),
      ));

  Widget buildSaveButton() => ButtonWidget(
        text: 'Save',
        onClicked: () {
          debugPrint(_name);
          user.name = _name;
          Navigator.pop(context);
        },
      );
}
