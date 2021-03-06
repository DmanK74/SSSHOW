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

import 'tiket_Info.dart';

// ignore: camel_case_types
class ShowPage extends StatefulWidget {
  const ShowPage({
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
  _ShowPageState createState() => _ShowPageState();
}

class _ShowPageState extends State<ShowPage> {
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
                padding: const EdgeInsets.only(right: 100, bottom: 20),
                child: SizedBox(
                  height: 30,
                  width: 200,
                  child: FlxTargetWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      Navigator.pop(context);
                      // back page
                    },
                    child: Row(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Image.asset('assets/images/back-arrow.png'),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text('?? ??????????'),
                        ),
                      ],
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
                  '????????: ${widget.genre}',
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  '??????????????????????: ${widget.director}',
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  '??????????????:  ${widget.scoreShow} ???',
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  '??????????????????: ${widget.showCost}??.',
                  style: TextStyle(fontSize: 25),
                ),
              ],
            ),
          ),
        ),
        rightBar()
      ],
    );
  }

  Widget rightBar() {
    return Padding(
      padding: const EdgeInsets.only(left: 300),
      child: Column(
        children: [
          FlxTargetWell(
            tapColor: Colors.white,
            borderRadius: BorderRadius.circular(10),
            onTap: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => TiketPage(
                            showName: widget.showName,
                            genre: widget.genre,
                            actors: widget.actors,
                            director: widget.director,
                            scoreShow: widget.scoreShow,
                            poster: widget.poster,
                            showCost: widget.showCost,
                            showInfo: widget.showInfo,
                            showId: widget.showId,
                          )));
            },
            child: FlxCard(
              width: 250,
              height: 150,
              child: Image.network(
                'https://st.depositphotos.com/2681265/3192/v/600/depositphotos_31927123-stock-video-retro-cinema-frame.jpg',
                fit: BoxFit.fill,
              ),
              overlay: Center(
                child: Text(
                  '???????????? ??????????',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomBar() {
    return Column(
      children: [
        Row(
          children: [
            Text(
              '????????????????',
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
