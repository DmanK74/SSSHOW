import 'package:admibka/api/sharede.dart';
import 'package:dio/dio.dart';
import 'package:felix_ui/components/button/button.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'admin_panel.dart';
import 'modder_afisha.dart';
import 'my_profile.dart';

// ignore: camel_case_types
class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _secureText1 = true;
  bool _secureText2 = true;
  Color textIconColor = Colors.white;
  double iconSize = 20;
  TextEditingController _passwordController1 = TextEditingController();
  TextEditingController _passwordController2 = TextEditingController();
  TextEditingController _namectrl;
  final _formKey = GlobalKey<FormState>();
  String _passwordError1;
  String _passwordError2;
  String nick;
  String pass;
  String confimPass;
  bool signin = true;
  bool processing = false;

  @override
  void initState() {
    cool();
    super.initState();
    _namectrl = new TextEditingController();
    _passwordController1 = new TextEditingController();
  }

  void cool() async {
    var id = await MyPreference().getId();
    int per = await MyPreference().getPer();
    print(per.toString());
    if (id != 0) {
      if (id != null && per == 0) {
        Navigator.push(context,
            new MaterialPageRoute(builder: (context) => MyProfilePage()));
      }
      if (id != null && per == 1) {
        Navigator.push(
            context, new MaterialPageRoute(builder: (context) => AdminPage()));
      }
      if (id != null && per == 2) {
        Navigator.push(context,
            new MaterialPageRoute(builder: (context) => MPostersPage()));
      }
    }
  }

  void chekState() {
    if (signin) {
      setState(() {
        signin = false;
      });
    } else
      setState(() {
        signin = true;
      });
  }

  void stateLOGIN() {
    setState(() {
      signin = false;
    });
  }

  void stateSIGiN() {
    setState(() {
      signin = true;
    });
  }

  void registerUser() async {
    setState(() {
      processing = true;
    });
    var url = "http://showconnect/signup.php";
    var data = {
      "name": _namectrl.text,
      "pass": _passwordController1.text,
    };

    var res = await Dio().get(url, queryParameters: data);
    if (jsonDecode(res.data) == false) {
      Fluttertoast.showToast(
          msg: "account existsasaaswasdwas, Please login",
          toastLength: Toast.LENGTH_SHORT,
          timeInSecForIosWeb: 4,
          backgroundColor: Colors.white,
          textColor: Colors.black);
    } else {
      if (jsonDecode(res.data) == false) {
        Fluttertoast.showToast(
            msg: "error",
            toastLength: Toast.LENGTH_SHORT,
            timeInSecForIosWeb: 4,
            backgroundColor: Colors.white,
            textColor: Colors.black);
      } else {
        Fluttertoast.showToast(
            msg: "account created",
            toastLength: Toast.LENGTH_SHORT,
            timeInSecForIosWeb: 4,
            backgroundColor: Colors.white,
            textColor: Colors.black);
      }
    }
    setState(() {
      processing = false;
    });
  }

  void autoriseUser() async {
    setState(() {
      processing = true;
    });
    var url = "http://showconnect/signin.php";
    var data = {
      "name": _namectrl.text,
      "pass": _passwordController1.text,
    };
    var res = await Dio().get(url, queryParameters: data);

    if (res.data == 'error') {
      print(jsonDecode('FUUUU'));
    } else {
      var data = jsonDecode(res.data);
      var uId = int.parse(data['id'] as String);
      int uPer = int.parse(data['Permision'] as String);
      MyPreference().setId(uId);
      MyPreference().setPer(uPer);
      if (uId != 0) {
        if (uId != null && uPer == 0) {
          Navigator.push(context,
              new MaterialPageRoute(builder: (context) => MyProfilePage()));
        }
        if (uId != null && uPer == 1) {
          Navigator.push(context,
              new MaterialPageRoute(builder: (context) => AdminPage()));
        }
        if (uId != null && uPer == 2) {
          Navigator.push(context,
              new MaterialPageRoute(builder: (context) => MPostersPage()));
        }
      }
    }

    if (jsonDecode(res.data) == "dont have an account") {
      Fluttertoast.showToast(
          msg: "dont have an account,Create an account",
          toastLength: Toast.LENGTH_SHORT,
          timeInSecForIosWeb: 4,
          backgroundColor: Colors.white,
          textColor: Colors.black);
    } else {
      if (jsonDecode(res.data) == "false") {
        Fluttertoast.showToast(
            msg: "incorrect password",
            toastLength: Toast.LENGTH_SHORT,
            timeInSecForIosWeb: 4,
            backgroundColor: Colors.white,
            textColor: Colors.black);
      }
    }

    setState(() {
      processing = false;
    });
  }

  Widget boxUi() {
    return Column(
      children: <Widget>[
        signin == true ? textFiledSignIn() : textFiledLogIn(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 1000,
          height: 1000,
          child: Column(
            children: [
              Stack(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    child: Image.network(
                      'https://www.meme-arsenal.com/memes/815c35087a4012276cc49392ccfd9c79.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 300, vertical: 100),
                    child: Column(
                      children: [
                        boxUi(),
                        Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              FlxButton(
                                onTap: () {
                                  setState(() {
                                    signin = true;
                                  });
                                },
                                text: 'Я новенький',
                                color: Color.fromRGBO(110, 26, 5, 50),
                              ),
                              FlxButton(
                                onTap: () {
                                  setState(() {
                                    signin = false;
                                  });
                                },
                                text: 'Уже тут есть',
                                color: Color.fromRGBO(110, 26, 5, 50),
                              ),
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
      ),
    );
  }

  Widget textFiledSignIn() {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        SizedBox(
          width: 360,
          child: Center(
            child: TextField(
              controller: _namectrl,
              maxLines: 1,
              textAlign: TextAlign.center,
              cursorWidth: 5.0,
              cursorColor: Colors.white,
              style: TextStyle(fontSize: 30.0, color: Colors.white),
              decoration: InputDecoration(
                suffixIcon: Icon(
                  Icons.account_box,
                  color: Colors.white,
                ),
                hintText: 'Введите псевдоним',
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 70,
        ),
        SizedBox(
          width: 360,
          child: Center(
            child: Form(
              child: TextFormField(
                controller: _passwordController1,
                onChanged: (value1) {
                  setState(() {
                    if (_passwordController1.text.length < 5) {
                      _passwordError1 =
                          'Пароль должен быть не менее 5 символов';
                    } else {
                      _passwordError1 = null;
                    }
                  });
                },
                obscureText: _secureText1,
                maxLength: 15,
                maxLines: 1,
                textAlign: TextAlign.center,
                cursorWidth: 5.0,
                cursorColor: Colors.white,
                style: TextStyle(fontSize: 30.0, color: Colors.white),
                showCursor: true,
                decoration: InputDecoration(
                  hintText: 'Введите пароль',
                  errorText: _passwordError1,
                  errorStyle: TextStyle(color: Colors.white),
                  focusedBorder: InputBorder.none,
                  suffixIcon: IconButton(
                    alignment: Alignment.center,
                    color: textIconColor,
                    icon: Icon(
                        _secureText1 ? Icons.security : Icons.remove_red_eye),
                    onPressed: () {
                      setState(() {
                        _secureText1 = !_secureText1;
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        SizedBox(
          width: 400,
          child: Center(
            child: Form(
              key: _formKey,
              child: TextFormField(
                controller: _passwordController2,
                onChanged: (value2) {
                  setState(() {
                    if (_passwordController2.text !=
                        _passwordController1.text) {
                      _passwordError2 = 'Проверьте пароли на сходство!';
                    } else {
                      _passwordError2 = null;
                    }
                  });
                },
                obscureText: _secureText2,
                maxLength: 15,
                maxLines: 1,
                textAlign: TextAlign.center,
                cursorWidth: 5.0,
                cursorColor: Colors.white,
                style: TextStyle(fontSize: 30.0, color: Colors.white),
                showCursor: true,
                decoration: InputDecoration(
                  hintText: 'Подтвердите пароль',
                  errorText: _passwordError2,
                  errorStyle: TextStyle(color: Colors.white),
                  focusedBorder: InputBorder.none,
                  suffixIcon: IconButton(
                    alignment: Alignment.center,
                    color: textIconColor,
                    icon: Icon(
                        _secureText2 ? Icons.security : Icons.remove_red_eye),
                    onPressed: () {
                      setState(() {
                        _secureText2 = !_secureText2;
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 70,
        ),
        buttonSignIn(),
      ],
    );
  }

  Widget textFiledLogIn() {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        SizedBox(
          width: 360,
          child: Center(
            child: TextField(
              controller: _namectrl,
              maxLines: 1,
              textAlign: TextAlign.center,
              cursorWidth: 5.0,
              cursorColor: Colors.white,
              style: TextStyle(fontSize: 30.0, color: Colors.white),
              decoration: InputDecoration(
                suffixIcon: Icon(
                  Icons.account_box,
                  color: Colors.white,
                ),
                hintText: 'Введите псевдоним',
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 70,
        ),
        SizedBox(
          width: 360,
          child: Center(
            child: Form(
              child: TextFormField(
                controller: _passwordController1,
                onChanged: (value1) {
                  setState(() {
                    if (_passwordController1.text.length < 5) {
                      _passwordError1 =
                          'Пароль должен быть не менее 5 символов';
                    } else {
                      _passwordError1 = null;
                    }
                  });
                },
                obscureText: _secureText1,
                maxLength: 15,
                maxLines: 1,
                textAlign: TextAlign.center,
                cursorWidth: 5.0,
                cursorColor: Colors.white,
                style: TextStyle(fontSize: 30.0, color: Colors.white),
                showCursor: true,
                decoration: InputDecoration(
                  hintText: 'Введите пароль',
                  errorText: _passwordError1,
                  errorStyle: TextStyle(color: Colors.white),
                  focusedBorder: InputBorder.none,
                  suffixIcon: IconButton(
                    alignment: Alignment.center,
                    color: textIconColor,
                    icon: Icon(
                        _secureText1 ? Icons.security : Icons.remove_red_eye),
                    onPressed: () {
                      setState(() {
                        _secureText1 = !_secureText1;
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 193,
        ),
        buttonAuto(),
      ],
    );
  }

  Widget buttonSignIn() {
    return Container(
      child: FlxButton(
        onTap: () {
          registerUser();
        },
        text: 'Зарегистрироваться',
        color: Color.fromRGBO(110, 26, 5, 50),
        width: 180,
      ),
    );
  }

  Widget buttonAuto() {
    return Container(
      child: FlxButton(
        onTap: () => autoriseUser(),
        text: 'Войти',
        color: Color.fromRGBO(110, 26, 5, 50),
        width: 100,
      ),
    );
  }
}
