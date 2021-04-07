import 'dart:convert';

import 'package:dio/dio.dart';

class ShowsApi {
  // ignore: missing_return
  Future<List<dynamic>> getServ() async {
    var dio = new Dio();

    try {
      var result = await dio.get('http://showconnect/api/get_shows.php');

      var data = jsonDecode(result.data);

      return data;
    } catch (e) {
      print(e);
    }
  }

  // ignore: missing_return
  Future<List<dynamic>> getGenre() async {
    var dio = new Dio();

    try {
      var result = await dio.get('http://showconnect/api/selectGenre.php');

      var data = jsonDecode(result.data);

      return data;
    } catch (e) {
      print(e);
    }
  }
}
