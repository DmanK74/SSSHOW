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

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:admibka/api/shows.dart';
import 'package:admibka/api/genre.dart';

import 'admin_panel.dart';

class AdminModersPage extends StatefulWidget {
  AdminModersPage({Key key}) : super(key: key);

  @override
  _AdminModersPageState createState() => _AdminModersPageState();
}

class _AdminModersPageState extends State<AdminModersPage>
    with TickerProviderStateMixin {
  Color textColor;
  Color borderColor;
  String curentGener;
  AnimationController _controller;
  List<dynamic> _modders = [];

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

  Future initApi() async {
    var url2 = "http://showconnect/get_all_moders.php";
    var res2 = await Dio().get(url2);
    var data2 = jsonDecode(res2.data);

    _modders = data2;

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
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        width: 2,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                  child: FlxTargetWell(
                                    borderRadius: BorderRadius.circular(10),
                                    hoverColor:
                                        Color.fromRGBO(100, 100, 100, 50),
                                    onTap: () {},
                                    child: topmenue('Модераторы'),
                                  ),
                                ),
                                FlxTargetWell(
                                  borderRadius: BorderRadius.circular(10),
                                  hoverColor: Color.fromRGBO(100, 100, 100, 50),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        new MaterialPageRoute(
                                            builder: (context) =>
                                                APostersPage()));
                                  },
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
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 80),
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          height: MediaQuery.of(context).size.height - 300,
                          child: Column(
                            children: [
                              bottomText(),
                              bottom(context),
                            ],
                          )),
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

  Widget bottomText() {
    return Column(
      children: [
        Row(
          children: [Text('Модераторы')],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 2,
                  color: Color.fromRGBO(200, 200, 200, 50),
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('ID',
                    style: TextStyle(
                      fontSize: 22,
                    )),
                Padding(
                  padding: const EdgeInsets.only(right: 70),
                  child: Text('Псевдоним', style: TextStyle(fontSize: 22)),
                ),
                Text('Действие', style: TextStyle(fontSize: 22))
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget bottom(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 370,
      child: StaggeredGridView.countBuilder(
        mainAxisSpacing: 30,
        physics: BouncingScrollPhysics(),
        staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
        crossAxisCount: 1,
        itemCount: _modders.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: Color.fromRGBO(100, 100, 100, 50),
                ),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(_modders[index]['id'].toString(),
                        style: TextStyle(
                          fontSize: 22,
                        )),
                    Text(_modders[index]['NickName'].toString(),
                        style: TextStyle(
                          fontSize: 22,
                        )),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: FlxTargetWell(
                        onTap: () async {
                          var url2 = "http://showconnect/set_to_user.php";
                          // ignore: unused_local_variable
                          var res2 = await Dio().get(
                            url2,
                            queryParameters: {
                              "Visitor_id": _modders[index]['id'].toString(),
                            },
                          );
                          await initApi();

                          setState(() {});
                        },
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border(
                              bottom: BorderSide(
                                width: 3,
                                color: Color.fromRGBO(100, 100, 100, 50),
                              ),
                              right: BorderSide(
                                width: 3,
                                color: Color.fromRGBO(100, 100, 100, 50),
                              ),
                              left: BorderSide(
                                width: 3,
                                color: Color.fromRGBO(100, 100, 100, 50),
                              ),
                              top: BorderSide(
                                width: 3,
                                color: Color.fromRGBO(100, 100, 100, 50),
                              ),
                            ),
                          ),
                          child: Text(
                            'Сделать пользователем',
                            style: TextStyle(
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
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
