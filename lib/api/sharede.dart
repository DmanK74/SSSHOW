import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyPreference {
  Future<int> getId() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getInt('id');
  }

  // ignore: missing_return
  Future<int> setId(int id) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setInt('id', id);
  }

  Future<int> getPer() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getInt('Permision');
  }

  // ignore: missing_return
  Future<int> setPer(int per) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setInt('Permision', per);
  }
}
