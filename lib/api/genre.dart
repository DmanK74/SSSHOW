import 'dart:convert';

import 'package:dio/dio.dart';

class GenreModel {
  final int id;
  final String genre;

  GenreModel(this.id, this.genre);
}

class GenreApi {
  // ignore: missing_return
  Future<GenreModel> getHello(int id, String genre) async {
    var dio = new Dio();

    try {
      var result = await dio.get(
        'http://showconnect/api/hiGenre.php',
        queryParameters: {'genre': genre, 'id': id},
      );

      await Future.delayed(Duration(milliseconds: 900));

      var data = jsonDecode(result.data);

      return GenreModel(data['id'], data['genre']);
    } catch (e) {
      print(e);
    }
  }

  // ignore: missing_return
  Future<List<dynamic>> getServ() async {
    var dio = new Dio();

    try {
      var result = await dio.get('http://showconnect/api/getGenre.php');

      var data = jsonDecode(result.data);

      return data;
    } catch (e) {
      print(e);
    }
  }
}
