import 'package:flutter/material.dart';

class SamplePage extends StatefulWidget {
  final String pageTitle;

  SamplePage({Key? key, required this.pageTitle}) : super(key: key);

  @override
  _SamplePageState createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
