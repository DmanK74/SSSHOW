import 'package:admibka/api/sharede.dart';
import 'package:felix_ui/components/card/card.dart';
import 'package:felix_ui/felix_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:dio/dio.dart';
import 'package:admibka/screens/posters.dart';
import 'dart:convert';
import 'qrCode.dart';

// ignore: camel_case_types
class MyProfilePage extends StatefulWidget {
  MyProfilePage({
    Key key,
  }) : super(key: key);

  @override
  _MyProfilePageState createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  int userId;

  String userName;
  List<dynamic> _tiket = [];
  @override
  void initState() {
    cool();

    super.initState();
  }

  void cool() async {
    userId = await MyPreference().getId();

    var url = "http://showconnect/api/get_visitors.php";

    var res = await Dio().get(
      url,
      queryParameters: {
        "id": userId.toString(),
      },
    );
    var data = jsonDecode(res.data);

    userName = data['NickName'] as String;

    setState(() {});

    await initApi();
  }

  Future initApi() async {
    var url2 = "http://showconnect/get_Visitor_show.php";
    var res2 = await Dio().get(
      url2,
      queryParameters: {
        "visitor_id": userId.toString(),
      },
    );
    var data2 = jsonDecode(res2.data);
    // print(data2);

    _tiket = data2;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Stack(
              children: <Widget>[
                Image.asset(
                  'assets/images/my_prof.png',
                  fit: BoxFit.fill,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 80, horizontal: 325),
                  child: Column(
                    children: [
                      top(),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Column(
                          children: [
                            bottomText(),
                            bottom(context),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

///////
  Widget top() {
    return Padding(
      padding: const EdgeInsets.only(left: 50),
      child: Row(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: SizedBox(
                  height: 25,
                  width: 125,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: FlxTargetWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => PostersPage()));
                        },
                        child: Row(
                          children: [
                            Image.asset('assets/images/back-arrow.png'),
                            SizedBox(
                              width: 10,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text('К афише'),
                            ),
                          ],
                        )),
                  ),
                ),
              ),
              FlxCard(
                width: 180,
                height: 180,
                color: Color.fromRGBO(0, 0, 0, 100),
                child: Image.asset('assets/images/icon-white.png'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child:
                    Text(userName.toString(), style: TextStyle(fontSize: 30)),
              ),
            ],
          ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 100),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Padding(
          //         padding: const EdgeInsets.only(bottom: 10),
          //         child: Text('Пол: м', style: TextStyle(fontSize: 25)),
          //       ),
          //       Padding(
          //         padding: const EdgeInsets.only(bottom: 10),
          //         child: Text('Возраст: 19', style: TextStyle(fontSize: 25)),
          //       ),
          //       Padding(
          //         padding: const EdgeInsets.only(bottom: 10),
          //         child: Text('Любимые жанры: Детектив, Мюзикл, Драмма',
          //             style: TextStyle(fontSize: 25)),
          //       ),
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }

////////
  Widget bottom(BuildContext context) {
    return SizedBox(
      height: 250,
      child: StaggeredGridView.countBuilder(
        mainAxisSpacing: 30,
        physics: BouncingScrollPhysics(),
        staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
        crossAxisCount: 1,
        itemCount: _tiket.length,
        itemBuilder: (context, index) => FlxTargetWell(
          hoverColor: Color.fromRGBO(100, 100, 100, 100),
          onTap: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => QRCodePage(
                          tiketId: _tiket[index]['TiketId'].toString(),
                          showCost: _tiket[index]['showCost'].toString(),
                          visitorId: userId.toString(),
                          showId: _tiket[index]['ShowId'],
                        )));
          },
          child: Padding(
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
                      Text(_tiket[index]['TiketId'].toString(),
                          style: TextStyle(fontSize: 18)),
                      Text(_tiket[index]['showName'].toString(),
                          style: TextStyle(fontSize: 18)),
                      Text(_tiket[index]['showCost'].toString() + 'р.',
                          style: TextStyle(fontSize: 18))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget bottomText() {
    return Column(
      children: [
        Row(
          children: [Text('История')],
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
                Text('Номер билета', style: TextStyle(fontSize: 22)),
                Padding(
                  padding: const EdgeInsets.only(right: 70),
                  child: Text('Название', style: TextStyle(fontSize: 22)),
                ),
                Text('Стоимость', style: TextStyle(fontSize: 22))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
