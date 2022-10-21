import 'package:final_project/pages/login.dart';
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

  List _data = [];
  final String _tokenAuth = '';
  var UserId;
  var nameUser;
  var typeUser;
  var photoUser;
  var phoneUser;
  var emailUser;
  String phonebaru = '';

  Future _getAllData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    UserId = prefs.getInt('idUser');
    nameUser = prefs.getString('nameUser');
    typeUser = prefs.getString('typeUser');
    photoUser = prefs.getString('photoUser');
    phoneUser = prefs.getString('phoneUser');
    emailUser = prefs.getString('emailUser');
    phonebaru = phoneUser.toString();
  }

  @override
  void initState() {
    super.initState();
    _getAllData().whenComplete(() {
      setState(() {
        
      });
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
                    backgroundImage: AssetImage(photoUser.toString()),
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
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 25, left: 25, right: 25, bottom: 10),
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
                    alignment: Alignment.centerLeft,
                    child: TextFormField(
                      // initialValue: nameUser.toString(),
                      
                      maxLines: 1,
                      controller: _inputEmail,
                      validator: (value) {
                              if (value!.isEmpty) {
                                _inputEmail.text = value;
                                return 'Email tidak boleh kosong';
                              }
                              _inputEmail.text = phonebaru;
                              return null;
                            },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        border: InputBorder.none,
                        hintText: emailUser.toString(),
                        hintStyle: MyText.body1(context)!
                            .copyWith(color: MyColors.grey_40),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              BorderSide(color: MyColors.primaryDark, width: 2),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              BorderSide(color: MyColors.grey_20, width: 1),
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
                    alignment: Alignment.centerLeft,
                    // padding: EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(
                      // initialValue: phonebaru,
                      maxLines: 1,
                      controller: new TextEditingController(),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        border: InputBorder.none,
                        hintText: phonebaru,
                        hintStyle: MyText.body1(context)!
                            .copyWith(color: MyColors.grey_40),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              BorderSide(color: MyColors.primaryDark, width: 2),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              BorderSide(color: MyColors.grey_20, width: 1),
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
                      "Ubah Password",
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
                    alignment: Alignment.centerLeft,
                    // padding: EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(
                      maxLines: 1,
                      controller: new TextEditingController(),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        border: InputBorder.none,
                        hintText: "",
                        hintStyle: MyText.body1(context)!
                            .copyWith(color: MyColors.grey_40),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              BorderSide(color: MyColors.primaryDark, width: 2),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              BorderSide(color: MyColors.grey_20, width: 1),
                        ),
                      ),
                    ),
                  ),
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
                  onPressed: () {},
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
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
