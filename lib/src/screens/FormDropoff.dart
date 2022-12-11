import 'package:flutter/material.dart';
import '../shared/styles.dart';
import '../shared/colors.dart';
import '../shared/fryo_icons.dart';
import 'package:page_transition/page_transition.dart';
import 'package:fryo/src/screens/RecyclePage.dart';
import 'package:fryo/src/screens/HomePage.dart';

class FormDropoff extends StatefulWidget {
  final String pageTitle;

  FormDropoff({Key key, this.pageTitle}) : super(key: key);

  @override
  _FormDropoffState createState() => _FormDropoffState();
}

class _FormDropoffState extends State<FormDropoff> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _weight = 0;
  String _location = "";
  String _description = "";
  DateTime _date;
  bool _is_pickup = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: primaryColor,
          title: Text('Drop Off Form',
              style: logoWhiteStyle, textAlign: TextAlign.center),
          actions: <Widget>[
            IconButton(
              padding: EdgeInsets.only(),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: HomePage()));
              },
              iconSize: 21,
              icon: Icon(Fryo.power_swtich),
            ),
          ],
        ),
        body: Form(
            key: _formKey,
            child: SingleChildScrollView(
                child: Center(
                    child: Card(
                        margin: EdgeInsets.all(50.0),
                        elevation: 20,
                        shape: (RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25))),
                        color: Color(0xFFE4DEAE),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 30, right: 30, left: 30, bottom: 7),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: "Enter your name",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                                onChanged: (String value) {
                                  setState(() {
                                    _name = value;
                                  });
                                },
                                onSaved: (String value) {
                                  setState(() {
                                    _name = value;
                                  });
                                },
                                validator: (String value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Name is required!';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 7, right: 30, left: 30, bottom: 7),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: "Enter the plastic weight",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                                onChanged: (String value) {
                                  setState(() {
                                    _weight = int.parse(value);
                                  });
                                },
                                onSaved: (String value) {
                                  setState(() {
                                    _weight = int.parse(value);
                                  });
                                },
                                validator: (String value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Weight is required!';
                                  } else if (int.tryParse(value) == null) {
                                    return 'Weight should be an integer!';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 7, right: 30, left: 30, bottom: 20),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText:
                                      "Tell us your experience with PlasTIX",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                                onChanged: (String value) {
                                  setState(() {
                                    _description = value;
                                  });
                                },
                                onSaved: (String value) {
                                  setState(() {
                                    _description = value;
                                  });
                                },
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: ListTile(
                                  title: const Text('AEON Serpong'),
                                  leading: Radio(
                                    value: "AEON Serpong",
                                    groupValue: _location,
                                    onChanged: (String value) {
                                      setState(() {
                                        _location = value;
                                      });
                                    },
                                  ),
                                )),
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: ListTile(
                                title: const Text('Botani Square'),
                                leading: Radio(
                                  value: "Botani Square",
                                  groupValue: _location,
                                  onChanged: (String value) {
                                    setState(() {
                                      _location = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: ListTile(
                                title: const Text('Kota Kasablanka'),
                                leading: Radio(
                                  value: "Kota Kasablanka",
                                  groupValue: _location,
                                  onChanged: (String value) {
                                    setState(() {
                                      _location = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: ListTile(
                                title: const Text('Margocity Depok'),
                                leading: Radio(
                                  value: "Margocity Depok",
                                  groupValue: _location,
                                  onChanged: (String value) {
                                    setState(() {
                                      _location = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: ListTile(
                                title: const Text('Paris Van Java'),
                                leading: Radio(
                                  value: "Paris Van Java",
                                  groupValue: _location,
                                  onChanged: (String value) {
                                    setState(() {
                                      _location = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: ListTile(
                                title: const Text('Plaza Indonesia'),
                                leading: Radio(
                                  value: "Plaza Indonesia",
                                  groupValue: _location,
                                  onChanged: (String value) {
                                    setState(() {
                                      _location = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: ListTile(
                                title: const Text('Senayan City'),
                                leading: Radio(
                                  value: "Senayan City",
                                  groupValue: _location,
                                  onChanged: (String value) {
                                    setState(() {
                                      _location = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: ListTile(
                                title: const Text('Summarecon Bekasi'),
                                leading: Radio(
                                  value: "Summarecon Bekasi",
                                  groupValue: _location,
                                  onChanged: (String value) {
                                    setState(() {
                                      _location = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 20),
                              alignment: Alignment.bottomCenter,
                              child: TextButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Color(0xFF198754)),
                                  padding: MaterialStateProperty.all(
                                    const EdgeInsets.all(20.0),
                                  ),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    _formKey.currentState.save();
                                    setState(() {
                                      _date = DateTime.now();
                                      // Budget newBudget = Budget(_judul, _nominal, _jenis, tanggal);
                                      // DataBudget.data.add(newBudget);
                                    });
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Dialog(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          elevation: 15,
                                          child: Container(
                                            child: ListView(
                                              padding: const EdgeInsets.only(
                                                  top: 20, bottom: 20),
                                              shrinkWrap: true,
                                              children: <Widget>[
                                                Center(
                                                    child: Column(
                                                  children: [
                                                    Text(
                                                      "Congratulations, you get ... points",
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(_name +
                                                        " " +
                                                        _weight.toString() +
                                                        " " +
                                                        _location +
                                                        " " +
                                                        _description +
                                                        " " +
                                                        _date.toString())
                                                  ],
                                                )),
                                                SizedBox(height: 20),
                                                TextButton(
                                                  child: Text('Ok'),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                    setState(() {
                                                      _name = "";
                                                      _weight = 0;
                                                      _location = "";
                                                      _description = "";
                                                    });
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  }
                                },
                                child: const Text(
                                  "Submit",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ))))));
  }
}
