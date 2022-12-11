import 'package:flutter/material.dart';
import '../shared/styles.dart';
import '../shared/colors.dart';
import '../shared/fryo_icons.dart';
import 'package:page_transition/page_transition.dart';
import 'package:fryo/src/screens/RecyclePage.dart';
import 'package:fryo/src/screens/HomePage.dart';

class FormPickup extends StatefulWidget {
  final String pageTitle;

  FormPickup({Key key, this.pageTitle}) : super(key: key);

  @override
  _FormPickupState createState() => _FormPickupState();
}

class _FormPickupState extends State<FormPickup> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _weight = 0;
  String _region = "";
  String _city = "";
  String _subdistrict = "";
  int _zipcode = 0;
  String _details = "";
  String _description = "";
  String _location = "";
  DateTime _date;
  bool _is_pickup = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: primaryColor,
          title: Text('Pick Up Form',
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
                                  top: 7, right: 30, left: 30, bottom: 7),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: "Region (ex: Jawa Barat)",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                                onChanged: (String value) {
                                  setState(() {
                                    _region = value;
                                  });
                                },
                                onSaved: (String value) {
                                  setState(() {
                                    _region = value;
                                  });
                                },
                                validator: (String value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Region is required!';
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
                                  hintText: "City (ex: Bogor)",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                                onChanged: (String value) {
                                  setState(() {
                                    _city = value;
                                  });
                                },
                                onSaved: (String value) {
                                  setState(() {
                                    _city = value;
                                  });
                                },
                                validator: (String value) {
                                  if (value == null || value.isEmpty) {
                                    return 'City is required!';
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
                                  hintText: "Subdistrict (ex: Cileungsi)",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                                onChanged: (String value) {
                                  setState(() {
                                    _subdistrict = value;
                                  });
                                },
                                onSaved: (String value) {
                                  setState(() {
                                    _subdistrict = value;
                                  });
                                },
                                validator: (String value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Subdistrict is required!';
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
                                  hintText: "ZIP Code (ex: 12345)",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                                onChanged: (String value) {
                                  setState(() {
                                    _zipcode = int.parse(value);
                                  });
                                },
                                onSaved: (String value) {
                                  setState(() {
                                    _zipcode = int.parse(value);
                                  });
                                },
                                validator: (String value) {
                                  if (value == null || value.isEmpty) {
                                    return 'ZIP Code is required!';
                                  } else if (int.tryParse(value) == null) {
                                    return 'ZIP Code should be numeric!';
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
                                  hintText:
                                      "Details (Street Name, Building Number)",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                                onChanged: (String value) {
                                  setState(() {
                                    _details = value;
                                  });
                                },
                                onSaved: (String value) {
                                  setState(() {
                                    _details = value;
                                  });
                                },
                                validator: (String value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Details is required!';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 7, right: 30, left: 30, bottom: 30),
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
                                      _location = _details +
                                          ", " +
                                          _subdistrict +
                                          ", " +
                                          _city +
                                          ", " +
                                          _region +
                                          " - " +
                                          _zipcode.toString();
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
                                                    Text(_location +
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
                                                      _region = "";
                                                      _city = "";
                                                      _subdistrict = "";
                                                      _zipcode = 0;
                                                      _details = "";
                                                      _description = "";
                                                      _location = "";
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
