import 'dart:convert';

import 'package:dio/dio.dart';

class VisitorModel {
  final int id;
  final String nickName;
  final String pass;
  final int permision;

  VisitorModel(this.id, this.nickName, this.pass, this.permision);
}

class VisitorApi {
  // ignore: missing_return
  Future<VisitorModel> getHello(int id) async {
    var dio = new Dio();

    try {
      var result = await dio.get('http://showconnect/api/get_visitors.php',
          queryParameters: {'id': id});

      await Future.delayed(Duration(milliseconds: 600));

      var data = jsonDecode(result.data);

      return VisitorModel(
          data['id'], data['NickName'], data['Pass'], data['Permision']);
    } catch (e) {
      print(e);
    }
  }

  // ignore: missing_return
  Future<List<dynamic>> getServ() async {
    var dio = new Dio();

    try {
      var result = await dio.get('http://showconnect/hiVisitor.php');

      var data = jsonDecode(result.data);

      return data;
    } catch (e) {
      print(e);
    }
  }

  // // ignore: missing_return
  // Future<List<dynamic>> getGenre() async {
  //   var dio = new Dio();

  //   try {
  //     var result = await dio.get('http://showconnect/api/selectGenre.php');

  //     var data = jsonDecode(result.data);

  //     return data;
  //   } catch (e) {
  //     print(e);
  //   }
  // }
}
