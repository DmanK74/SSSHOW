import 'dart:convert';

import 'package:dio/dio.dart';

class HelloModel {
  final String name;
  final String country;
  final String gender;

  HelloModel(this.name, this.country, this.gender);
}

class HelloApi {
  // ignore: missing_return
  Future<HelloModel> getHello(
      String name, String country, String gender) async {
    var dio = new Dio();

    try {
      var result = await dio.get(
          'http://public/api/hello.php?name=$name&country=$country&gender=$gender');

      await Future.delayed(Duration(milliseconds: 900));

      var data = jsonDecode(result.data);

      return HelloModel(data['S_Name'], data['S_Country'], data['S_Gender']);
    } catch (e) {
      print(e);
    }
  }

  // ignore: missing_return
  Future<List<dynamic>> getServ() async {
    var dio = new Dio();

    try {
      var result = await dio.get('http://public/api/get_servants.php');

      var data = jsonDecode(result.data);

      return data;
    } catch (e) {
      print(e);
    }
  }
}
