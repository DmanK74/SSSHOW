import 'package:admibka/api/sharede.dart';
import 'package:felix_ui/components/card/card.dart';
import 'package:felix_ui/felix_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:math';
import 'package:dio/dio.dart';
import 'package:felix_ui/components/button/button.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'posters.dart';
import 'qrCode.dart';

// ignore: camel_case_types
class TiketPage extends StatefulWidget {
  const TiketPage({
    @required this.showName,
    @required this.genre,
    @required this.actors,
    @required this.director,
    @required this.scoreShow,
    @required this.poster,
    @required this.showCost,
    @required this.showInfo,
    @required this.showId,
  });

  final String showName;
  final String genre;
  final String actors;
  final String director;
  final String scoreShow;
  final String poster;
  final String showCost;
  final String showInfo;
  final String showId;

  @override
  _TiketPageState createState() => _TiketPageState();
}

class _TiketPageState extends State<TiketPage> {
  @override
  void initState() {
    cool();
    super.initState();
  }

  int userId;
  Map<String, dynamic> _tiket = {};
  void cool() async {
    userId = await MyPreference().getId();

    var url = "http://showconnect/addBuy.php";

    var res = await Dio().get(
      url,
      queryParameters: {
        "showCost": widget.showCost,
        "Visitor_id": userId.toString(),
        "ShowId": widget.showId,
      },
    );
    var data = jsonDecode(res.data);
    _tiket = data;
    // String d = _tiket['TiketId'];
    // print(jsonDecode(d));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border(
                bottom: BorderSide(
                  width: 4,
                  color: Color.fromRGBO(255, 255, 255, 100),
                ),
                top: BorderSide(
                  width: 4,
                  color: Color.fromRGBO(255, 255, 255, 100),
                ),
                right: BorderSide(
                  width: 4,
                  color: Color.fromRGBO(255, 255, 255, 100),
                ),
                left: BorderSide(
                  width: 4,
                  color: Color.fromRGBO(255, 255, 255, 100),
                ),
              ),
            ),
            child: Column(
              children: [
                Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 50, horizontal: 200),
                      child: Column(
                        children: [
                          topBar(),
                          Padding(
                            padding: const EdgeInsets.only(top: 50),
                            child: bottomBar(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget topBar() {
    return Row(
      children: [
        SizedBox(
          width: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 100),
                child: SizedBox(
                  height: 40,
                  width: 100,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: SizedBox(
                      height: 25,
                      width: 200,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: FlxTargetWell(
                            borderRadius: BorderRadius.circular(10),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) => PostersPage()));

                              // back page
                            },
                            child: Image.asset('assets/images/back-arrow.png')),
                      ),
                    ),
                  ),
                ),
              ),
              FlxCard(
                width: 200,
                height: 300,
                color: Color.fromRGBO(0, 0, 0, 100),
                child: Image.network(
                  widget.poster,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(widget.showName, style: TextStyle(fontSize: 30)),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 100),
          child: SizedBox(
            width: 440,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Жанр: ${widget.genre}',
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Постановщик: ${widget.director}',
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Рейтинг:  ${widget.scoreShow} ★',
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Стоимость: ${widget.showCost}р.',
                  style: TextStyle(fontSize: 25),
                ),
              ],
            ),
          ),
        ),
        qrCode()
      ],
    );
  }

  Widget qrCode() {
    return FlxTargetWell(
      onTap: () {
        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => QRCodePage(
                      tiketId: _tiket['TiketId'],
                      showCost: _tiket['showCost'],
                      visitorId: _tiket['Visitor_id'],
                      showId: _tiket['ShowId'],
                    )));
      },
      hoverColor: Color.fromRGBO(100, 100, 100, 50),
      borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        height: 380,
        width: 350,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  'Ваш билет',
                  style: TextStyle(fontSize: 25, color: Colors.red),
                ),
              ),
              Container(
                height: 300,
                width: 300,
                child: QrImage(
                  backgroundColor: Colors.white,
                  data:
                      '${_tiket['TiketId']}, ${_tiket['showCost']}, ${_tiket['Visitor_id']}, ${_tiket['ShowId']}',
                  // TiketId, showCost, Visitor_id, ShowId.
                  version: QrVersions.auto,
                  size: 300.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomBar() {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Описание',
              style: TextStyle(fontSize: 25),
            )
          ],
        ),
        SizedBox(
          height: 240,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                widget.showInfo,
                style: TextStyle(fontSize: 22),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
