import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../profile/model/UserData.dart';
import '../../profile/utils/userProvider.dart';

class NumbersWidget extends StatelessWidget {
  final int points;
  final int weights;
  final String kg = "kg";

  const NumbersWidget({Key? key, required this.points, required this.weights})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String w = weights.toString() + kg;
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildbutton(context, points.toString(), 'Points'),
          buildDivider(),
          buildbutton(context, w, 'Plastics Donated'),
        ],
      ),
    );
  }

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
