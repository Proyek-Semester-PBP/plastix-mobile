import 'package:flutter/foundation.dart';
import '../model/UserData.dart';

class UserProvider with ChangeNotifier {
  UserProvider({this.userTemp});
  UserData userTemp;

  UserData get user => userTemp;
  set user(UserData u) {
    user = u;
    notifyListeners();
  }

  int get userID => userTemp.userId;
  set userID(int value) {
    userTemp.userId = value;
    notifyListeners();
  }

  String get username => userTemp.name;
  set username(String value) {
    userTemp.name = value;
    notifyListeners();
  }

  String get email => userTemp.email;
  set email(String value) {
    userTemp.email = value;
    notifyListeners();
  }

  String get github => userTemp.github;
  set github(String value) {
    userTemp.github = value;
    notifyListeners();
  }

  String get instagram => userTemp.instagram;
  set instagram(String value) {
    userTemp.instagram = value;
    notifyListeners();
  }

  String get twitter => userTemp.twitter;
  set twitter(String value) {
    userTemp.twitter = value;
    notifyListeners();
  }

  String get facebook => userTemp.facebook;
  set facebook(String value) {
    userTemp.email = value;
    notifyListeners();
  }

  int get weight => userTemp.weight;
  set weight(int value) {
    userTemp.weight = value;
    notifyListeners();
  }

  int get point => userTemp.point;
  set point(int value) {
    userTemp.point = value;
    notifyListeners();
  }

  String get profpic => userTemp.profpic;
  set profpic(String value) {
    userTemp.profpic = value;
    notifyListeners();
  }
}
