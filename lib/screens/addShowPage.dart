import 'dart:html';
import 'dart:isolate';
import 'package:admibka/api/sharede.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:admibka/themes/themes.dart';
import 'package:admibka/screens/sign_up.dart';
import 'package:admibka/screens/simple.dart';
import 'package:admibka/screens/admin_afisha.dart';
import 'package:admibka/screens/posters.dart';
import 'package:admibka/screens/my_profile.dart';
import 'package:admibka/screens/showPage.dart';
import 'dart:convert';
import 'package:felix_ui/components/components.dart';
import 'package:felix_ui/felix_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:admibka/screens/poster_card_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:admibka/api/shows.dart';
import 'package:admibka/api/genre.dart';

import 'genrePage.dart';
import 'modder_afisha.dart';

class AddShowPage extends StatefulWidget {
  AddShowPage({Key key}) : super(key: key);

  @override
  _AddShowPageState createState() => _AddShowPageState();
}

class _AddShowPageState extends State<AddShowPage>
    with TickerProviderStateMixin {
  Color textColor;
  Color borderColor;
  String curentGener;
  AnimationController _controller;
  Animation _animation;
  bool processing = false;

  Color textIconColor = Colors.white;
  double iconSize = 20;

  List<dynamic> _shows = [];
  List<dynamic> _imageShows;
  TextEditingController _showName;
  TextEditingController _showGenre;
  TextEditingController _showActors;
  TextEditingController _showDirector;
  TextEditingController _showScore;
  TextEditingController _showPoster;
  TextEditingController _showCost;
  TextEditingController _showInfo;
  @override
  void initState() {
    textColor = Colors.white;
    borderColor = Colors.white;
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
    _animation = Tween(begin: 0.0, end: 500.0)
        .animate(CurvedAnimation(curve: Curves.easeIn, parent: _controller))
          ..addListener(() {
            setState(() {});
          });
    super.initState();
    _showName = new TextEditingController();
    _showGenre = new TextEditingController();
    _showActors = new TextEditingController();
    _showDirector = new TextEditingController();
    _showScore = new TextEditingController();
    _showPoster = new TextEditingController();
    _showCost = new TextEditingController();
    _showInfo = new TextEditingController();
  }

  Future initApi() async {
    var url2 = "http://showconnect/addShow.php";
    // ignore: unused_local_variable
    var res2 = await Dio().get(
      url2,
      queryParameters: {
        "showName": _showName.text,
        "genre": _showGenre.text,
        "actors": _showActors.text,
        "director": _showDirector.text,
        "id": null,
        "scoreShow": _showScore.text,
        "poster": _showPoster.text,
        "showCost": _showCost.text,
        "showInfo": _showInfo.text
      },
    );
    _showName.text = '';
    _showGenre.text = '';
    _showActors.text = '';
    _showDirector.text = '';
    _showScore.text = '';
    _showPoster.text = '';
    _showCost.text = '';
    _showInfo.text = '';
    setState(() {});
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Opacity(
            opacity: 0.3,
            child: Image.asset(
              'assets/images/admin.png',
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 50),
            child: Container(
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 5,
                    color: Color.fromRGBO(70, 70, 70, 100),
                  ),
                  left: BorderSide(
                    width: 5,
                    color: Color.fromRGBO(70, 70, 70, 100),
                  ),
                  right: BorderSide(
                    width: 5,
                    color: Color.fromRGBO(70, 70, 70, 100),
                  ),
                  bottom: BorderSide(
                    width: 5,
                    color: Color.fromRGBO(70, 70, 70, 100),
                  ),
                ),
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width,
                    minWidth: 1000),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 60,
                          width: MediaQuery.of(context).size.width - 110,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  width: 5,
                                  color: Color.fromRGBO(70, 70, 70, 100),
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          width: 2,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                    child: topmenue('Представление')),
                                FlxTargetWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          new MaterialPageRoute(
                                              builder: (context) =>
                                                  GenresPage()));
                                    },
                                    child: topmenue('Жанры')),
                                FlxTargetWell(
                                    borderRadius: BorderRadius.circular(10),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          new MaterialPageRoute(
                                              builder: (context) =>
                                                  MPostersPage()));
                                    },
                                    child: topmenue('Афиша')),
                                FlxTargetWell(
                                  borderRadius: BorderRadius.circular(10),
                                  hoverColor: Color.fromRGBO(100, 100, 100, 50),
                                  onTap: () async {
                                    Navigator.push(
                                        context,
                                        new MaterialPageRoute(
                                            builder: (context) =>
                                                SignUpPage()));
                                    await MyPreference().setId(0);
                                  },
                                  child: topmenue('Выход'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 500),
                            child: textFiledShow(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget textFiledShow() {
    return Padding(
      padding: const EdgeInsets.only(top: 100),
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 1000,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 600,
              child: Center(
                child: Column(
                  children: [
                    TextField(
                      controller: _showName,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      cursorWidth: 5.0,
                      cursorColor: Colors.white,
                      style: TextStyle(fontSize: 30.0, color: Colors.white),
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.add_box_rounded,
                          color: Colors.white,
                        ),
                        hintText: 'Введите название представления',
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                    TextField(
                      controller: _showGenre,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      cursorWidth: 5.0,
                      cursorColor: Colors.white,
                      style: TextStyle(fontSize: 30.0, color: Colors.white),
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.add_box_rounded,
                          color: Colors.white,
                        ),
                        hintText: 'Введите жанр',
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                    TextField(
                      controller: _showActors,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      cursorWidth: 5.0,
                      cursorColor: Colors.white,
                      style: TextStyle(fontSize: 30.0, color: Colors.white),
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.add_box_rounded,
                          color: Colors.white,
                        ),
                        hintText: 'Введите имена актеров',
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                    TextField(
                      controller: _showDirector,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      cursorWidth: 5.0,
                      cursorColor: Colors.white,
                      style: TextStyle(fontSize: 30.0, color: Colors.white),
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.add_box_rounded,
                          color: Colors.white,
                        ),
                        hintText: 'Введите имя постановщика',
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                    TextField(
                      controller: _showScore,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      cursorWidth: 5.0,
                      cursorColor: Colors.white,
                      style: TextStyle(fontSize: 30.0, color: Colors.white),
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.add_box_rounded,
                          color: Colors.white,
                        ),
                        hintText: 'Введите оценку (целое число)',
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                    TextField(
                      controller: _showPoster,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      cursorWidth: 5.0,
                      cursorColor: Colors.white,
                      style: TextStyle(fontSize: 30.0, color: Colors.white),
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.add_box_rounded,
                          color: Colors.white,
                        ),
                        hintText: 'Введите путь к постеру',
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                    TextField(
                      controller: _showCost,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      cursorWidth: 5.0,
                      cursorColor: Colors.white,
                      style: TextStyle(fontSize: 30.0, color: Colors.white),
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.add_box_rounded,
                          color: Colors.white,
                        ),
                        hintText: 'Введите стоимость',
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                    TextField(
                      controller: _showInfo,
                      maxLines: 7,
                      textAlign: TextAlign.center,
                      cursorWidth: 5.0,
                      cursorColor: Colors.white,
                      style: TextStyle(fontSize: 30.0, color: Colors.white),
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.add_box_rounded,
                          color: Colors.white,
                        ),
                        hintText: 'Введите описание',
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            buttonADD(),
          ],
        ),
      ),
    );
  }

  Widget buttonADD() {
    return Container(
      child: FlxButton(
        onTap: () async {
          await initApi();
          setState(() {});
        },
        text: 'Добавить',
        color: Color.fromRGBO(110, 26, 5, 50),
        width: 180,
      ),
    );
  }

  Widget topmenue(String topMenueTitle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 160,
          height: 60,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: InkWell(
                onHover: (value) {
                  if (value) {
                    _controller.forward();
                    setState(() {
                      textColor = Colors.red;
                    });
                  } else {
                    _controller.reverse();
                    setState(() {
                      textColor = Colors.white;
                    });
                  }
                },
                child: AnimatedDefaultTextStyle(
                  duration: Duration(milliseconds: 300),
                  style: TextStyle(color: textColor),
                  child: Text(
                    topMenueTitle,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
