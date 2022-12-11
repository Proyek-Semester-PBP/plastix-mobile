// import 'dart:html';

import 'package:flutter/material.dart';

class NumbersWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildbutton(context, '19000', 'Points'),
            buildDivider(),
            buildbutton(context, '93842g', 'Plastics Donated'),
          ],
        ),
      );

  Widget buildbutton(BuildContext context, String value, String text) =>
      MaterialButton(
        padding: EdgeInsets.symmetric(
          vertical: 4,
        ),
        onPressed: () {},
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              value,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 38),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
      );

  Widget buildDivider() => Container(
        height: 38,
        child: VerticalDivider(),
      );
}
