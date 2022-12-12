import 'package:flutter/material.dart';
import 'RedeemPage.dart';
import 'HomePage.dart';

import '../shared/styles.dart';
import '../shared/colors.dart';
import '../shared/fryo_icons.dart';
import '../shared/Product.dart';
import 'package:page_transition/page_transition.dart';

import '../shared/partials.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final _tabs = [
      storeTab(context),
      Text('Tab2'),
      Text('Tab3'),
      // RedeemPage(context).
      Text('Tab5'),
      Text('tab6'),
    ];

    return Scaffold(
        backgroundColor: bgColor,
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
                  Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.rightToLeft, child: HomePage()));
              },
              iconSize: 21,
              icon: Icon(Fryo.power_swtich),
            ),
            IconButton(
              padding: EdgeInsets.all(0),
              onPressed: () {},
              iconSize: 25,
              icon: Icon(Fryo.user_1),
            )
          ],
        ),
        body: _tabs[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Fryo.home),
                label: 'Home',

                ),
            BottomNavigationBarItem(
                icon: Icon(Fryo.cart),
                label:  'Shopping',
                ),
            BottomNavigationBarItem(
                icon: Icon(Fryo.book),
                label:
                  'News',
                ),
            BottomNavigationBarItem(
                icon: Icon(Fryo.gift),
                label:
                  'Redeem',
                ),
            BottomNavigationBarItem(
                icon: Icon(Fryo.location),
                label:
                  'Recycle',
                ),
          ],
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.green[600],
          onTap: _onItemTapped,
        ));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

Widget storeTab(BuildContext context) {


  return ListView(children: <Widget>[
    headerTopCategories(context),
    deals('Change your plastic now!', onViewMore: () {}, items: <Widget>[
    ]),

    deals('Shop now!', onViewMore: () {

    }, items: <Widget>[
    ]),

    deals('Redeem your point', onViewMore: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  RedeemPage()),
        );
    }, items: <Widget>[
    ]),
  ]);
}

Widget sectionHeader(String headerTitle, {onViewMore}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Container(
        margin: EdgeInsets.only(left: 15, top: 10),
        child: Text(headerTitle, style: h4),
      ),
      Container(
        margin: EdgeInsets.only(left: 15, top: 2),
        child: TextButton(
          onPressed: onViewMore,
          child: Text('View all ›', style: contrastText),
        ),
      )
    ],
  );
}

Widget secHeader(String headerTitle) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Container(
        margin: EdgeInsets.only(left: 15, top: 10),
        child: Text(headerTitle, style: h4),
      ),
      Container(
        margin: EdgeInsets.only(left: 15, top: 2),
      )
    ],
  );
}
// wrap the horizontal listview inside a sizedBox..
Widget headerTopCategories(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      secHeader('All Categories'),
      SizedBox(
        height: 130,
        child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: <Widget>[
            headerCategoryItem('Recycle', Fryo.location, onPressed: () {}),
            headerCategoryItem('Shopping', Fryo.cart, onPressed: () {}),
            headerCategoryItem('Redeem', Fryo.gift, onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  RedeemPage()),
              );
            }),
            headerCategoryItem('News', Fryo.book, onPressed: () {}),
          ],
        ),
      )
    ],
  );
}

Widget headerCategoryItem(String name, IconData icon, {onPressed}) {
  return Container(
    margin: EdgeInsets.only(left: 10, right: 10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(bottom: 10),
            width: 76,
            height: 76,
            child: FloatingActionButton(
              shape: CircleBorder(),
              heroTag: name,
              onPressed: onPressed,
              backgroundColor: white,
              child: Icon(icon, size: 35, color: Colors.green),
            )),
        Text(name, style: categoryText)
      ],
    ),
  );
}

Widget deals(String dealTitle, {onViewMore, required List<Widget> items}) {
  return Container(
    margin: EdgeInsets.only(top: 5),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        sectionHeader(dealTitle, onViewMore: onViewMore),
        SizedBox(
          height: 250,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: (items != null)
                ? items
                : <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text('No items available at this moment.',
                          style: taglineText),
                    )
                  ],
          ),
        )
      ],
    ),
  );
}
