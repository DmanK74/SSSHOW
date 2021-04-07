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

// ignore: camel_case_types
class QRCodePage extends StatefulWidget {
  const QRCodePage({
    @required this.tiketId,
    @required this.showCost,
    @required this.visitorId,
    @required this.showId,
  });
  // TiketId, showCost, Visitor_id, ShowId.
  final String tiketId;
  final String showCost;
  final String visitorId;
  final String showId;

  @override
  _QRCodePageState createState() => _QRCodePageState();
}

class _QRCodePageState extends State<QRCodePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
          child: Container(
            width: MediaQuery.of(context).size.width - 40,
            height: MediaQuery.of(context).size.height - 40,
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                  width: 100,
                  child: FlxTargetWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Image.asset('assets/images/back-arrow.png'),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(alignment: Alignment.center, child: qrCode()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget qrCode() {
    return SizedBox(
      height: 800,
      width: 800,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            QrImage(
              backgroundColor: Colors.white,
              data:
                  '${widget.tiketId}, ${widget.showCost}, ${widget.visitorId}, ${widget.showId}',
              version: QrVersions.auto,
              size: 700.0,
            ),
          ],
        ),
      ),
    );
  }
}
