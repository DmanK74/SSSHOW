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

import 'admin_moders.dart';
import 'admin_panel.dart';
import 'admin_show_page.dart';

class APostersPage extends StatefulWidget {
  APostersPage({Key key}) : super(key: key);

  @override
  _APostersPageState createState() => _APostersPageState();
}

class _APostersPageState extends State<APostersPage>
    with TickerProviderStateMixin {
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
  TextEditingController _searchController = TextEditingController();
  String x;

  @override
  void initState() {
    initApi();
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
  }

  void initApi() async {
    _imageShows = await ShowsApi().getServ();
    // print(jsonEncode(_imageShows));
    _shows = _imageShows;
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
                                  hoverColor: Color.fromRGBO(100, 100, 100, 50),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        new MaterialPageRoute(
                                            builder: (context) => AdminPage()));
                                  },
                                  child: topmenue('Пользователи'),
                                ),
                                FlxTargetWell(
                                  borderRadius: BorderRadius.circular(10),
                                  hoverColor: Color.fromRGBO(100, 100, 100, 50),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        new MaterialPageRoute(
                                            builder: (context) =>
                                                AdminModersPage()));
                                  },
                                  child: topmenue('Модераторы'),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        width: 2,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                  child: topmenue('Афиша'),
                                ),
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
                    Expanded(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 20, bottom: 20, left: 50, right: 50),
                            child: buildList(context),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 40),
                                child: founder(),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 40),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        width: 2,
                                        color: x == 'Показать все'
                                            ? Colors.red
                                            : Color.fromRGBO(100, 100, 100, 50),
                                      ),
                                    ),
                                  ),
                                  child: FlxTargetWell(
                                    onTap: () async {
                                      _searchController.text = '';
                                      curentGener = '';
                                      x = 'Показать все';
                                      _shows = _imageShows
                                          .where((e) => (e['showName'])
                                              .contains(e['showName']))
                                          .toList();
                                      setState(() {});
                                    },
                                    child: Text(
                                      'Показать все',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: geners(context),
                              ),
                            ],
                          ),
                        ],
                      ),
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

  Widget geners(BuildContext context) {
    return SingleChildScrollView(
      child: FutureBuilder(
        future: GenreApi().getServ(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // print(jsonEncode(snapshot.data));
            return SizedBox(
              height: 600,
              width: 100,
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
                            _searchController.text = '';
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

  Widget founder() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border(
              top: BorderSide(
                width: 3,
                color: _searchController.text != ''
                    ? Colors.red
                    : Color.fromRGBO(100, 100, 100, 50),
              ),
              left: BorderSide(
                width: 3,
                color: _searchController.text != ''
                    ? Colors.red
                    : Color.fromRGBO(100, 100, 100, 50),
              ),
              right: BorderSide(
                width: 3,
                color: _searchController.text != ''
                    ? Colors.red
                    : Color.fromRGBO(100, 100, 100, 50),
              ),
              bottom: BorderSide(
                width: 3,
                color: _searchController.text != ''
                    ? Colors.red
                    : Color.fromRGBO(100, 100, 100, 50),
              ),
            ),
          ),
          child: SizedBox(
            height: 60,
            width: 220,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: TextField(
                  maxLines: 1,
                  textAlign: TextAlign.left,
                  cursorWidth: 5.0,
                  cursorColor: Colors.white,
                  style: TextStyle(fontSize: 25.0, color: Colors.white),
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Поиск',
                    border: InputBorder.none,
                    suffixIcon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                  focusNode: FocusNode(
                      canRequestFocus: true,
                      skipTraversal: true,
                      descendantsAreFocusable: true),
                  onChanged: (value1) async {
                    curentGener = '';
                    x = '';
                    _shows = _imageShows
                        .where((e) => (e['showName'] as String)
                            .toLowerCase()
                            .contains(_searchController.text.toLowerCase()))
                        .toList();
                    setState(() {});
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildList(BuildContext context) {
    return SizedBox(
      width: 1400,
      child: StaggeredGridView.countBuilder(
        itemCount: _shows.length,
        physics: BouncingScrollPhysics(),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
        crossAxisCount: 6,
        itemBuilder: (context, index) => PosterCard(
          onTap: () {
            String showName = _shows[index]['showName'].toString();
            String genre = _shows[index]['genre'].toString();
            String actors = _shows[index]['actors'].toString();
            String director = _shows[index]['director'].toString();
            String scoreShow = _shows[index]['scoreShow'].toString();
            String poster = _shows[index]['poster'].toString();
            String showCost = _shows[index]['showCost'].toString();
            String showInfo = _shows[index]['showInfo'].toString();
            String showId = _shows[index]['id'].toString();
            print(showId);
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => AShowPage(
                          showName: showName,
                          genre: genre,
                          actors: actors,
                          director: director,
                          scoreShow: scoreShow,
                          poster: poster,
                          showCost: showCost,
                          showInfo: showInfo,
                          showId: showId,
                        )));
          },
          name: _shows[index]['showName'].toString(),
          score: _shows[index]['scoreShow'].toString(),
          imageUri: _shows[index]['poster'].toString(),
        ),
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
