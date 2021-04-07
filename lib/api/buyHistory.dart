import 'dart:convert';

import 'package:dio/dio.dart';

class VHistoryApi {
  // ignore: missing_return
  Future<List<dynamic>> getServ(int id) async {
    var dio = new Dio();

    try {
      var result = await dio.get('http://showconnect/get_Visitor_show.php',
          queryParameters: {'visitor_id': id});

      var data = jsonDecode(result.data);

      return data;
    } catch (e) {
      print(e);
    }
  }
}
