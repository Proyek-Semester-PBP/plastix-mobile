import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fryo/src/screens/HomePage.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

import '../../src/shared/styles.dart';
import '../../src/shared/colors.dart';
import '../../src/shared/fryo_icons.dart';

import './EditProfilePage.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '../../profile/model/UserData.dart';
import '../../profile/utils/userProvider.dart';

import '../utils/user_prefrences.dart';
import '../widget/button_widget.dart';
import '../widget/profile_widget.dart';
import '../widget/number_widget.dart';
import '../model/user.dart';
import '../model/UserData.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // late Future<List<UserData>> dataFuture;

  // @override
  // void initState() {
  //   super.initState();

  //   dataFuture = fetchUser();
  // }

  // Future<List<UserData>> fetchUser() async {
  //   var url = Uri.parse(
  //       'postgres://udluzxbfbzeywk:83bde16c0226a885e02102aee8d5dc33b859ec133b96d0308ec29310d9fbbcc8@ec2-54-163-34-107.compute-1.amazonaws.com:5432/d16aenjlnqbh7t');
  //   var response = await http.get(
  //     url,
  //     headers: {
  //       "Access-Control-Allow-Origin": "*",
  //       "Access-Control-Allow-Methods": "POST, OPTIONS",
  //       "Content-Type": "application/json",
  //     },
  //   );

  //   // melakukan decode response menjadi bentuk json
  //   var data = jsonDecode(utf8.decode(response.bodyBytes));

  //   // melakukan konversi data json menjadi object UserData
  //   List<UserData> listUserData = [];
  //   for (var d in data) {
  //     if (d != null) {
  //       listUserData.add(UserData.fromJson(d));
  //     }
  //   }

  //   return listUserData;
  // }

  @override
  Widget build(BuildContext context) {
    final userProvider = context.watch<UserProvider>();
    final request = context.watch<CookieRequest>();

    return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: primaryColor,
          title: Text('PlastiX',
              style: logoWhiteStyle, textAlign: TextAlign.center),
          actions: <Widget>[
            IconButton(
              padding: EdgeInsets.only(),
              onPressed: () async {
                final response = await request.logout(
                    'https://proyek-semester-pbp.up.railway.app/auth/logout/');
                debugPrint(response['message'].toString());
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
            physics: BouncingScrollPhysics(),
            children: [
              ProfileWidget(
                imagePath:
                    "https://fiverr-res.cloudinary.com/images/t_main1,q_auto,f_auto,q_auto,f_auto/gigs2/164316223/original/4c5c4626dc34d006e0497738ccfb80f5d189626e/do-minecraft-8-bit-profile-picture.png",
                onClicked: () async {},
              ),
              const SizedBox(height: 24),
              buildName(
                  userProvider.user, userProvider.email, userProvider.name),
              const SizedBox(height: 24),
              Center(child: buildButton()),
              const SizedBox(height: 24),
              NumbersWidget(
                points: userProvider.point,
                weights: userProvider.weight,
              ),
              const SizedBox(height: 24),
              buildAbout(userProvider),
            ],
          ),
        ));
  }

  Widget buildName(String user, String email, String name) {
    if (email.isEmpty) {
      email = "Add your Email here!";
    } else if (email == "-") {
      email = "Add your Email here!";
    }
    if (name == "-") {
      name = "Add your full name here!";
    }
    return Column(
      children: [
        Text(
          user,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        const SizedBox(height: 4),
        Text(
          name,
          style: TextStyle(color: Colors.grey),
        ),
        const SizedBox(height: 4),
        Text(
          email,
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }

  Widget buildButton() => ButtonWidget(
        text: 'Edit Profile',
        onClicked: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EditProfilePage()),
          );
        },
      );

  Widget buildAbout(UserProvider user) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 45),
            child: buildIcon(FontAwesomeIcons.whatsapp, user.mobile),
          ),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: EdgeInsets.only(left: 45),
            child: buildIcon(FontAwesomeIcons.github, user.github),
          ),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: EdgeInsets.only(left: 45),
            child: buildIcon(FontAwesomeIcons.instagram, user.instagram),
          ),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: EdgeInsets.only(left: 45),
            child: buildIcon(FontAwesomeIcons.twitter, user.twitter),
          ),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: EdgeInsets.only(left: 45),
            child: buildIcon(FontAwesomeIcons.facebook, user.facebook),
          ),
          const SizedBox(
            height: 24,
          ),
        ],
      );

  Widget buildIcon(IconData icon, String account) {
    if (account == null) {
      account = "Add your account here!";
    } else if (account == "-") {
      account = "Add your account here!";
    }
    return Row(
      children: [
        SizedBox(
          width: 60,
        ),
        CircleAvatar(
          radius: 25,
          child: Center(
              child: Icon(
            icon,
            size: 32,
          )),
        ),
        SizedBox(
          width: 20,
        ),
        Text(
          account,
          style: TextStyle(fontStyle: FontStyle.italic, fontSize: 24),
        ),
      ],
    );
  }
}
