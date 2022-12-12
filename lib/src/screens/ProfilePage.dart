import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fryo/src/screens/HomePage.dart';

import '../shared/styles.dart';
import '../shared/colors.dart';
import '../shared/fryo_icons.dart';
// import 'package:page_transition/page_transition.dart';
import '../utils/user_prefrences.dart';
import '../widget/button_widget.dart';
import '../widget/profile_widget.dart';
import '../widget/number_widget.dart';
import '../model/user.dart';

class ProfilePage extends StatefulWidget {
  // final String pageTitle;

  ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPrefrences.myUser;

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
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage(pageTitle: '',)),);
              },
              iconSize: 21,
              icon: Icon(Fryo.power_swtich),
            ),
            // IconButton(
            //   padding: EdgeInsets.all(0),
            //   onPressed: () {},
            //   iconSize: 21,
            //   icon: Icon(Fryo.alarm),
            // )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              ProfileWidget(
                imagePath: user.imagePath,
                onClicked: () async {},
              ),
              const SizedBox(height: 24),
              buildName(user),
              const SizedBox(height: 24),
              Center(child: buildButton()),
              const SizedBox(height: 24),
              NumbersWidget(),
              const SizedBox(height: 24),
              buildAbout(user),
            ],
          ),
        )
      );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: TextStyle(color: Colors.grey),
          )
        ],
      );

  Widget buildButton() => ButtonWidget(
        text: 'Edit Profile',
        onClicked: () {},
      );

  Widget buildAbout(User user) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 45),
            child: buildIcon(FontAwesomeIcons.github),
          ),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: EdgeInsets.only(left: 45),
            child: buildIcon(FontAwesomeIcons.instagram),
          ),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: EdgeInsets.only(left: 45),
            child: buildIcon(FontAwesomeIcons.twitter),
          ),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: EdgeInsets.only(left: 45),
            child: buildIcon(FontAwesomeIcons.facebook),
          ),
          const SizedBox(
            height: 24,
          ),
        ],
      );

  Widget buildIcon(IconData icon) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            radius: 25,
            child: Center(
                child: Icon(
              icon,
              size: 32,
            )),
          ),
          Text(
            'AlvaroLuqmanW',
            style: TextStyle(fontStyle: FontStyle.italic, fontSize: 24),
          ),
        ],
      );
}
