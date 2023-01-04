import 'package:final_project/data/my_strings.dart';
import 'package:final_project/pages/master.dart';
import 'package:final_project/widget/my_toast.dart';
import 'package:flutter/material.dart';
import 'package:final_project/data/my_colors.dart';
import 'package:final_project/pages/home.dart';
import 'package:final_project/widget/my_text.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:modals/modals.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //Login Post
  final String _tokenAuth = '';
  final TextEditingController _inputEmail = TextEditingController();
  final TextEditingController _inputPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var UserId;
  var _data;
  var _message;

  void _showToast(String mesg, BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(mesg),
        action: SnackBarAction(
            label: 'hide', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  Future _postDataJson() async {
    try {
      var url = Uri.parse('https://frontliner.intermediatech.id/api/sign-in');
      var response = await http.post(url, headers: {
        'Authorization': 'Bearer ' + _tokenAuth
      }, body: {
        'email': _inputEmail.text,
        'password': _inputPassword.text,
      });
      setState(() {
        _data = json.decode(response.body)['data'];
        _message = json.decode(response.body)['message'];
      });
      if (response.statusCode == 200) {
        print(_data['id']);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        postData(_data['marketing_id'], _data['name'], _data['email'],
            _data['type'], _data['photo'], _data['phone']);
        print('sukses');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyMaster()),
        );
        _showToast(_message.toString(), context);
      } else {
        print('error');
        return _showToast(_message.toString(), context);
      }
    } on SocketException {
      print('no internet');
    } on HttpException {
      print('error');
    } on FormatException {
      print('error');
    }
  }

  postData(id, name, email, type, photo, phone) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('idUser', id);
    prefs.setString('nameUser', name);
    prefs.setString('emailUser', email);
    prefs.setString('typeUser', type);
    prefs.setString('photoUser', photo);
    prefs.setString('phoneUser', phone);
  }

  final TextEditingController _pin = TextEditingController();

  bool checkValid = true;
  bool passwordHidden = true;

  void _login() {
    if (_pin.text.isNotEmpty) {
      setState(() {
        if (_pin.text == "12345678") {
          checkValid = true;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return HomePage();
              },
            ),
          );
          const snackBar = SnackBar(
            content: Text('Selamat Anda Berhasil Login!'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else {
          checkValid = false;
          const snackBar = SnackBar(
            content:
                Text('PIN yang Anda Masukkan Salah, Silahkan Periksa Kembali'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      });
    } else {
      const snackBar = SnackBar(
        content: Text('Terjadi Kesalahan!'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  void _showPassword() {
    setState(() {
      passwordHidden = !passwordHidden;
    });
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: Container(color: MyColors.primaryDark)),
      body: Stack(
        children: <Widget>[
          Container(color: MyColors.primaryDark, height: 220),
          Column(
            children: <Widget>[
              Container(height: 40),
              Container(
                // child: Image.asset(
                //   Img.get('logo.PNG'),
                //   color: Colors.white,
                // ),
                width: 80,
                height: 80,
              ),
              Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                  margin: EdgeInsets.all(25),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(height: 25),
                          Text("SIGN IN",
                              style: MyText.title(context)!.copyWith(
                                  color: Color.fromARGB(255, 19, 160, 0),
                                  fontWeight: FontWeight.bold)),
                          TextFormField(
                            controller: _inputEmail,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Email tidak boleh kosong';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              labelText: "Email",
                              labelStyle:
                                  TextStyle(color: Colors.blueGrey[400]),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blueGrey[400]!, width: 1),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blueGrey[400]!, width: 2),
                              ),
                            ),
                          ),
                          Container(height: 25),
                          TextFormField(
                            controller: _inputPassword,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Password tidak boleh kosong';
                              }
                              return null;
                            },
                            obscureText: passwordHidden,
                            keyboardType: TextInputType.text,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              labelText: "Password",
                              suffixIcon: IconButton(
                                onPressed: () {
                                  _showPassword();
                                },
                                icon: (passwordHidden)
                                    ? const Icon(Icons.visibility)
                                    : const Icon(Icons.visibility_off),
                              ),
                              labelStyle:
                                  TextStyle(color: Colors.blueGrey[400]),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blueGrey[400]!, width: 1),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blueGrey[400]!, width: 2),
                              ),
                            ),
                          ),
                          Container(height: 25),
                          Container(
                            width: double.infinity,
                            height: 40,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: MyColors.primaryDark,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(20)),
                              ),
                              child: Text(
                                "SUBMIT",
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _postDataJson();
                                }
                              },
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                  primary: Colors.transparent),
                              child: Text(
                                "Lupa Password?",
                                style: TextStyle(color: MyColors.primaryDark),
                              ),
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (_) => CustomEventDialog());
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ))
            ],
          )
        ],
      ),
    );
  }
}

class CustomEventDialog extends StatefulWidget {
  CustomEventDialog({Key? key}) : super(key: key);

  @override
  CustomEventDialogState createState() => new CustomEventDialogState();
}

class CustomEventDialogState extends State<CustomEventDialog> {
  final String _tokenAuth = '';
  var whatsapp;

  Future _getNumberAdmin() async {
    try {
      var url = Uri.parse(
          'https://frontliner.intermediatech.id/api/home/get_number_admin');
      var response = await http.get(
        url,
        headers: {'Authorization': 'Bearer ' + _tokenAuth},
      );
      if (response.statusCode == 200) {
        setState(() {
          whatsapp = json.decode(response.body)['data'];
        });
        print('sukses');
        print("whatsapp");
      } else {
        print('error');
      }
    } on SocketException {
      print('no internet');
    } on HttpException {
      print('error');
    } on FormatException {
      print('error');
    }
  }

  _launchURLWA() async {
    if (await canLaunch(whatsapp)) {
      await launch(whatsapp);
    } else {
      throw 'Could not launch' + whatsapp;
    }
  }

  @override
  void initState() {
    super.initState();
    _getNumberAdmin();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: 160,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          color: Colors.white,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Wrap(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                color: MyColors.primaryDark,
                child: Column(
                  children: <Widget>[
                    Container(height: 10),
                    Icon(Icons.whatsapp, color: Colors.white, size: 80),
                    Container(height: 10),
                    Text("Lupa Password",
                        style: MyText.title(context)!
                            .copyWith(color: Colors.white)),
                    Container(height: 10),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                child: Column(
                  children: <Widget>[
                    Text("Hubungi admin melalui nomor di bawah ini!!",
                        textAlign: TextAlign.center,
                        style: MyText.subhead(context)!
                            .copyWith(color: MyColors.grey_60)),
                    Container(height: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 8, 156, 47),
                        elevation: 0,
                        padding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0)),
                      ),
                      child: Text("WhatsApp",
                          style: TextStyle(color: Colors.white)),
                      onPressed: () {
                        _launchURLWA();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
