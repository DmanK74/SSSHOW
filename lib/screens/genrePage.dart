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

import 'addShowPage.dart';
import 'modder_afisha.dart';

class GenresPage extends StatefulWidget {
  GenresPage({Key key}) : super(key: key);

  @override
  _GenresPageState createState() => _GenresPageState();
}

class _GenresPageState extends State<GenresPage> with TickerProviderStateMixin {
  Color textColor;
  Color borderColor;
  String curentGener;
  AnimationController _controller;
  List<dynamic> _shows = [];
  List<dynamic> _imageShows;
  // ignore: unused_field
  Animation _animation;
  bool processing = false;
  // ignore: unused_field

  String x;
  Color textIconColor = Colors.white;
  double iconSize = 20;
  TextEditingController _genre;
  String nick;
  String pass;
  String confimPass;

  @override
  void initState() {
    //initApi();
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
    _genre = new TextEditingController();
  }

  Future initApi() async {
    var url2 = "http://showconnect/addGenre.php";
    // ignore: unused_local_variable
    var res2 = await Dio().get(
      url2,
      queryParameters: {
        "genre": _genre.text,
      },
    );

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
                                FlxTargetWell(
                                    borderRadius: BorderRadius.circular(10),
                                    hoverColor:
                                        Color.fromRGBO(100, 100, 100, 50),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          new MaterialPageRoute(
                                              builder: (context) =>
                                                  AddShowPage()));
                                    },
                                    child: topmenue('Представление')),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        width: 2,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                  child: topmenue('Жанры'),
                                ),
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
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 500),
                            child: textFiledGenre(),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 180, right: 150),
                            child: geners(context),
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

  Widget textFiledGenre() {
    return Column(
      children: [
        SizedBox(
          width: 360,
          child: Center(
            child: TextField(
              controller: _genre,
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
          ),
        ),
        SizedBox(
          height: 30,
        ),
        buttonADD(),
      ],
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

  Widget geners(BuildContext context) {
    return SingleChildScrollView(
      child: FutureBuilder(
        future: GenreApi().getServ(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SizedBox(
              height: 600,
              width: 150,
              child: StaggeredGridView.countBuilder(
                  physics: BouncingScrollPhysics(),
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
                  crossAxisCount: 1,
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    String gen = snapshot.data[index]['genre'].toString();
                    return Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 1,
                              color: curentGener == gen
                                  ? Colors.red
                                  : Color.fromRGBO(100, 100, 100, 50),
                            ),
                          ),
                        ),
                        child: FlxTargetWell(
                          hoverColor: Color.fromRGBO(30, 30, 30, 50),
                          onTap: () async {
                            x = '';
                            curentGener = gen;
                            _shows = _imageShows
                                .where((e) => e['genre'] == gen)
                                .toList();
                            setState(() {});
                          },
                          child: SizedBox(
                            height: 30,
                            width: 60,
                            child: Center(
                              child: Text(
                                gen,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            );
          } else if (snapshot.hasError) {
            return Text('Ошибка');
          } else {
            return Text('Загрузка');
          }
        },
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
