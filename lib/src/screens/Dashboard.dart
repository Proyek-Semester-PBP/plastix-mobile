import 'package:flutter/material.dart';
import 'package:fryo/src/screens/HomePage.dart';
import 'package:fryo/recycle/screen/RecyclePage.dart';
import 'package:fryo/shopping/screens/shopping_page.dart';
import 'package:fryo/redeem/screens/RedeemPage.dart';
import 'package:fryo/news/screens/NewsPage.dart';

import 'package:fryo/profile/screens/ProfilePage.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

import '../shared/styles.dart';
import '../shared/colors.dart';
import '../shared/fryo_icons.dart';
// import 'package:page_transition/page_transition.dart';

class Dashboard extends StatefulWidget {
  // final String pageTitle;

  Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    final _tabs = [
      storeTab(context),
      Text('Tab2'),
      Text('Tab3'),
      Text('Tab5'),
      Text('Tab6'),
    ];

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
                  MaterialPageRoute(
                      builder: (context) => HomePage(
                            pageTitle: '',
                          )),
                );
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
            IconButton(
              padding: EdgeInsets.all(0),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
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
              label: 'Shopping',
            ),
            BottomNavigationBarItem(
              icon: Icon(Fryo.book),
              label: 'News',
            ),
            BottomNavigationBarItem(
              icon: Icon(Fryo.gift),
              label: 'Redeem',
            ),
            BottomNavigationBarItem(
              icon: Icon(Fryo.location),
              label: 'Recycle',
            ),
          ],
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.green[600],
          onTap: _onItemTapped,
        ));
  }

  void _onItemTapped(int index) {
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ShoppingPage()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NewsPage()),
      );
    } else if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RedeemPage()),
      );
    } else if (index == 4) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RecyclePage()),
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }
}

Widget storeTab(BuildContext context) {
  // will pick it up from here
  // am to start another template

  return ListView(children: <Widget>[
    headerTopCategories(context),
    deals('Change your plastic now!', onViewMore: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RecyclePage()),
      );
    }, items: <Widget>[
      Container(
        margin: const EdgeInsets.all(8.0),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              "images/11.png",
              fit: BoxFit.cover,
            )),
      )
    ]),
    deals('Shop now!', onViewMore: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ShoppingPage()),
      );
    }, items: <Widget>[
      Container(
        margin: const EdgeInsets.all(8.0),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              "images/12.png",
              fit: BoxFit.cover,
            )),
      )
    ]),
    deals('Redeem your point', onViewMore: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RedeemPage()),
      );
    }, items: <Widget>[
      Container(
        margin: const EdgeInsets.all(8.0),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              "images/10.png",
              fit: BoxFit.cover,
            )),
      )
    ]),
    deals('Our News', onViewMore: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NewsPage()),
      );
    }, items: <Widget>[
      Container(
        margin: const EdgeInsets.all(8.0),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              "images/13.png",
              fit: BoxFit.cover,
            )),
      )
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
          child: Text('View more ', style: contrastText),
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
            headerCategoryItem('Recycle', Fryo.location, onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RecyclePage()),
              );
            }),
            headerCategoryItem('Shopping', Fryo.cart, onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ShoppingPage()),
              );
            }),
            headerCategoryItem('Redeem', Fryo.gift, onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RedeemPage()),
              );
            }),
            headerCategoryItem('News', Fryo.book, onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewsPage()),
              );
            }),
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

Widget deals(String dealTitle, {onViewMore, List<Widget>? items}) {
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
