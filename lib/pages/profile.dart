import 'package:final_project/pages/login.dart';
import 'package:final_project/pages/master.dart';
import 'package:final_project/pages/ubah_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:final_project/data/img.dart';
import 'package:final_project/data/my_colors.dart';
import 'package:final_project/data/my_strings.dart';
import 'package:final_project/widget/my_text.dart';
import 'package:badges/badges.dart';
import 'package:final_project/pages/daftar_nasabah.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController _inputEmail = TextEditingController();
  TextEditingController _inputPhone = TextEditingController();
  TextEditingController _inputPassword = TextEditingController();
  TextEditingController _inputName = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  List _data = [];
  final String _tokenAuth = '';
  var UserId;
  var nameUser;
  var typeUser;
  String photoUser =
      'https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty.jpg';
  var phoneUser;
  var emailUser;
  String phonebaru = '';

  Future _getAllData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    UserId = prefs.getInt('idUser');
    nameUser = prefs.getString('nameUser');
    typeUser = prefs.getString('typeUser');
    photoUser = prefs.getString('photoUser').toString();
    phoneUser = prefs.getString('phoneUser');
    emailUser = prefs.getString('emailUser');
    phonebaru = phoneUser.toString();
    _inputEmail.text = emailUser.toString();
    _inputName.text = nameUser.toString();
    _inputPhone.text = phonebaru.toString();
  }

  LogOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  Future _postDataJson() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    UserId = prefs.getInt('idUser');
    try {
      var url = Uri.parse(
          'https://frontliner.intermediatech.id/api/marketing/update_profile_data');
      var response = await http.post(url, headers: {
        'Authorization': 'Bearer ' + _tokenAuth
      }, body: {
        'marketing_id': UserId.toString(),
        'email': _inputEmail.text,
        'password': _inputPassword.text,
        'name': _inputName.text,
        'phone': _inputPhone.text
      });
      setState(() {
        _data = json.decode(response.body)['data'];
        postData(_inputName.text, _inputEmail.text, _inputPhone.text);
        _getAllData();
      });
      if (response.statusCode == 200) {
        print('sukses');
        _showToast(context, 'Profile berhasil diperbarui');
      } else {
        print('error');
        _showToast(context, 'Profile gagal diperbarui');
      }
    } on SocketException {
      print('no internet');
    } on HttpException {
      print('error');
    } on FormatException {
      print('error');
    }
  }

  void _showToast(BuildContext context, String msg) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(
          msg,
        ),
        action: SnackBarAction(
            label: 'hide', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  postData(name, email, phone) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('nameUser', name);
    prefs.setString('emailUser', email);
    prefs.setString('phoneUser', phone);
  }

  @override
  void initState() {
    super.initState();
    _getAllData().whenComplete(() {
      setState(() {});
    });
  }

  bool isSwitched1 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Profile", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: MyColors.primaryDark,
            ),
            child: Column(
              children: <Widget>[
                Container(
                  height: 15,
                ),
                CircleAvatar(
                  radius: 65,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 90,
                    backgroundImage: NetworkImage(photoUser),
                  ),
                ),
                Container(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 35),
                  child: Text(nameUser.toString(),
                      style: MyText.title(context)!
                          .copyWith(color: MyColors.white)),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 35, vertical: 2),
                  child: Text("Marketing " + typeUser.toString(),
                      style: MyText.body1(context)!
                          .copyWith(color: MyColors.white)),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: MyColors.red,
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                ),
              ],
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 25, left: 25, right: 25, bottom: 10),
                    child: Text(
                      "Nama",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(4))),
                    child: TextFormField(
                      controller: _inputName,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Nama tidak boleh kosong';
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              BorderSide(color: MyColors.grey_20, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              BorderSide(color: MyColors.primaryDark, width: 2),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 10, left: 25, right: 25, bottom: 10),
                    child: Text(
                      "Email",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(4))),
                    child: TextFormField(
                      controller: _inputEmail,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'E-mail tidak boleh kosong';
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              BorderSide(color: MyColors.grey_20, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              BorderSide(color: MyColors.primaryDark, width: 2),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 10, left: 25, right: 25, bottom: 10),
                    child: Text(
                      "No. Telepon",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(4))),
                    child: TextFormField(
                      controller: _inputPhone,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'No Telepon tidak boleh kosong';
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              BorderSide(color: MyColors.grey_20, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              BorderSide(color: MyColors.primaryDark, width: 2),
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(width: 15),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UbahPassword()),
                          );
                        },
                        child: Text(
                          "Ubah Password",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: MyColors.primaryDark),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 10,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                width: (MediaQuery.of(context).size.width),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _postDataJson();
                    }
                  },
                  style:
                      ElevatedButton.styleFrom(primary: MyColors.primaryDark),
                  child: Text("Simpan"),
                ),
              )),
          Container(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Container(
              width: (MediaQuery.of(context).size.width),
              child: ElevatedButton(
                onPressed: () {
                  LogOut();
                },
                style: ElevatedButton.styleFrom(primary: MyColors.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Logout",
                      style: TextStyle(
                          color: MyColors.primaryDark,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: 10,
                    ),
                    Icon(
                      Icons.logout,
                      color: MyColors.primaryDark,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
