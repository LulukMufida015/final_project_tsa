import 'package:final_project/pages/daftar_nasabah.dart';
import 'package:final_project/pages/detail_nasabah.dart';
import 'package:final_project/pages/daftar_nasabah_status.dart';
import 'package:final_project/pages/home.dart';
import 'package:final_project/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:final_project/data/img.dart';
import 'package:final_project/data/my_colors.dart';
import 'package:final_project/data/my_strings.dart';
import 'package:final_project/widget/my_text.dart';
import 'package:badges/badges.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  //  List _data = [];
  var _data;
  final String _tokenAuth = '';
  String nameUser = '';
  String typeUser = '';
  String countBaru = '';
  String countProgress = '';
  String countHot = '';
  String countWarm = '';
  String countCold = '';
  String countUnqulified = '';
  String countClosed = '';
  String namaNasabah = '';
  String jenisNasabah = '';
  String statusNasabah = '';
  String tanggal = '';
  String photoUser =
      'https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty.jpg';
  var IdNewNasabah;

  var UserId;
  var NasabahId;
  var nasabahBaru;
  Future _getAllData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    UserId = prefs.getInt('idUser');
    nameUser = prefs.getString('nameUser').toString();
    typeUser = prefs.getString('typeUser').toString();
    photoUser = prefs.getString('photoUser').toString();
    // print(UserId);
    try {
      var url = Uri.parse(
          'https://frontliner.intermediatech.id/api/home/data?marketing_id=' +
              UserId.toString());
      var response = await http.get(
        url,
        headers: {'Authorization': 'Bearer ' + _tokenAuth},
      );
      if (response.statusCode == 200) {
        setState(() {
          print('sukses data');
          print(UserId);
          _data = json.decode(response.body)['data'];
          countBaru = _data['count']['badges']['new'].toString();
          countProgress = _data['count']['badges']['on_progress'].toString();
          countHot = _data['count']['type']['hot'].toString();
          countWarm = _data['count']['type']['warm'].toString();
          countCold = _data['count']['type']['cold'].toString();
          countUnqulified = _data['count']['type']['unqualified'].toString();
          countClosed = _data['count']['type']['closed'].toString();
          nasabahBaru = _data['new_nasabah'];
          if (_data['new_nasabah'] != null) {
            namaNasabah = _data['new_nasabah']['nama_nasabah'].toString();
            jenisNasabah = _data['new_nasabah']['jenis'].toString();
            statusNasabah = _data['new_nasabah']['status'].toString();
            tanggal = _data['new_nasabah']['created_at'].toString();
            IdNewNasabah = _data['new_nasabah']['id'];
          }
        });
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

  @override
  void initState() {
    super.initState();
    _getAllData().whenComplete(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Home", style: TextStyle(fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: Icon(Icons.menu),
          color: MyColors.grey_100_,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 35),
                    child: Text(nameUser,
                        style: MyText.title(context)!
                            .copyWith(color: MyColors.white)),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 35, vertical: 2),
                    child: Text("Marketing " + typeUser,
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(height: 30),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text("Statistik",
                          style: MyText.medium(context).copyWith(
                            color: MyColors.grey_90,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.start),
                    ),
                    Container(height: 10),
                    Row(
                      children: <Widget>[
                        Container(width: 15),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 2),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: MyColors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              border: Border.all(
                                  width: 1.0,
                                  color: MyColors.primaryDark.withOpacity(0.8)),
                              boxShadow: [
                                BoxShadow(
                                  color: MyColors.grey_40,
                                  offset: const Offset(
                                    0,
                                    2.0,
                                  ),
                                  blurRadius: 5.0,
                                  spreadRadius: 2.0,
                                ), //BoxShadow
                              ],
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.upload_file,
                                  size: 50,
                                  color: MyColors.grey_8,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, top: 8, bottom: 3),
                                      child: Text(
                                        'Baru',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, bottom: 8),
                                      child: Text(
                                        countBaru,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: MyColors.primaryDark),
                                        textAlign: TextAlign.left,
                                      ),
                                    )
                                    //
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(width: 10),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 2),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: MyColors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              border: Border.all(
                                  width: 1,
                                  color: MyColors.primaryDark.withOpacity(0.8)),
                              boxShadow: [
                                BoxShadow(
                                  color: MyColors.grey_40,
                                  offset: const Offset(
                                    0,
                                    2.0,
                                  ),
                                  blurRadius: 5.0,
                                  spreadRadius: 2.0,
                                ), //BoxShadow
                              ],
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.upload_file,
                                  size: 50,
                                  color: MyColors.grey_8,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, top: 8, bottom: 3),
                                      child: Text(
                                        'Proses',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, bottom: 8),
                                      child: Text(
                                        countProgress,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: MyColors.primaryDark),
                                        textAlign: TextAlign.left,
                                      ),
                                    )
                                    //
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(width: 10),
                      ],
                    ),
                  ],
                ),
                // Container(height: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(height: 30),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text("Status Progress",
                          style: MyText.medium(context).copyWith(
                            color: MyColors.grey_90,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.start),
                    ),
                  ],
                ),
                Container(height: 20),
                Row(
                  children: [
                    Container(
                      width: 15,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DaftarNasabahStatus(
                                      status: 'hot',
                                    )),
                          );
                        },
                        child: Badge(
                          shape: BadgeShape.square,
                          borderRadius: BorderRadius.circular(5),
                          position: BadgePosition.topEnd(top: -12, end: -1),
                          padding: EdgeInsets.all(2),
                          badgeContent: Text(
                            countHot,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                          badgeColor: Colors.red,
                          child: Column(
                            children: [
                              Container(
                                  // width: double.infinity,
                                  // height: 50,
                                  decoration: BoxDecoration(
                                    color: MyColors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: MyColors.grey_40,
                                        offset: const Offset(
                                          2.0,
                                          2.0,
                                        ),
                                        blurRadius: 3.0,
                                        spreadRadius: 2.0,
                                      ), //BoxShadow
                                      BoxShadow(
                                        color: Colors.white,
                                        offset: const Offset(0.0, 0.0),
                                        blurRadius: 0.0,
                                        spreadRadius: 0.0,
                                      ), //BoxShadow
                                    ],
                                    border: Border.all(
                                        width: 1,
                                        color: MyColors.primaryDark
                                            .withOpacity(0.8)),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Icon(
                                      Icons.local_fire_department,
                                      color: MyColors.primaryDark,
                                      size: 35,
                                    ),
                                  )),
                              Container(height: 10),
                              Container(
                                child: Text(
                                  "Hot",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 15,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DaftarNasabahStatus(
                                      status: 'warm',
                                    )),
                          );
                        },
                        child: Badge(
                          shape: BadgeShape.square,
                          borderRadius: BorderRadius.circular(5),
                          position: BadgePosition.topEnd(top: -12, end: -1),
                          padding: EdgeInsets.all(2),
                          badgeContent: Text(
                            countWarm,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                          badgeColor: Colors.red,
                          child: Column(
                            children: [
                              Container(
                                  // width: double.infinity,
                                  // height: 50,
                                  decoration: BoxDecoration(
                                    color: MyColors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: MyColors.grey_40,
                                        offset: const Offset(
                                          2.0,
                                          2.0,
                                        ),
                                        blurRadius: 3.0,
                                        spreadRadius: 2.0,
                                      ), //BoxShadow
                                      BoxShadow(
                                        color: Colors.white,
                                        offset: const Offset(0.0, 0.0),
                                        blurRadius: 0.0,
                                        spreadRadius: 0.0,
                                      ), //BoxShadow
                                    ],
                                    border: Border.all(
                                        width: 1,
                                        color: MyColors.primaryDark
                                            .withOpacity(0.8)),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Icon(
                                      Icons.coffee,
                                      color: MyColors.primaryDark,
                                      size: 35,
                                    ),
                                  )),
                              Container(height: 10),
                              Container(
                                child: Text(
                                  "Warm",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 15,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DaftarNasabahStatus(
                                      status: 'cold',
                                    )),
                          );
                        },
                        child: Badge(
                          shape: BadgeShape.square,
                          borderRadius: BorderRadius.circular(5),
                          position: BadgePosition.topEnd(top: -12, end: -1),
                          padding: EdgeInsets.all(2),
                          badgeContent: Text(
                            countCold,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                          badgeColor: Colors.red,
                          child: Column(
                            children: [
                              Container(
                                  // width: double.infinity,
                                  // height: 50,
                                  decoration: BoxDecoration(
                                    color: MyColors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: MyColors.grey_40,
                                        offset: const Offset(
                                          2.0,
                                          2.0,
                                        ),
                                        blurRadius: 3.0,
                                        spreadRadius: 2.0,
                                      ), //BoxShadow
                                      BoxShadow(
                                        color: Colors.white,
                                        offset: const Offset(0.0, 0.0),
                                        blurRadius: 0.0,
                                        spreadRadius: 0.0,
                                      ), //BoxShadow
                                    ],
                                    border: Border.all(
                                        width: 1,
                                        color: MyColors.primaryDark
                                            .withOpacity(0.8)),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Icon(
                                      Icons.ac_unit,
                                      color: MyColors.primaryDark,
                                      size: 35,
                                    ),
                                  )),
                              Container(height: 10),
                              Container(
                                child: Text(
                                  "Cold",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 15,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DaftarNasabahStatus(
                                      status: 'unqualified',
                                    )),
                          );
                        },
                        child: Badge(
                          shape: BadgeShape.square,
                          borderRadius: BorderRadius.circular(5),
                          position: BadgePosition.topEnd(top: -12, end: -1),
                          padding: EdgeInsets.all(2),
                          badgeContent: Text(
                            countUnqulified,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                          badgeColor: Colors.red,
                          child: Column(
                            children: [
                              Container(
                                  // width: double.infinity,
                                  // height: 50,
                                  decoration: BoxDecoration(
                                    color: MyColors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: MyColors.grey_40,
                                        offset: const Offset(
                                          2.0,
                                          2.0,
                                        ),
                                        blurRadius: 3.0,
                                        spreadRadius: 2.0,
                                      ), //BoxShadow
                                      BoxShadow(
                                        color: Colors.white,
                                        offset: const Offset(0.0, 0.0),
                                        blurRadius: 0.0,
                                        spreadRadius: 0.0,
                                      ), //BoxShadow
                                    ],
                                    border: Border.all(
                                        width: 1,
                                        color: MyColors.primaryDark
                                            .withOpacity(0.8)),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Icon(
                                      Icons.cancel,
                                      color: MyColors.primaryDark,
                                      size: 35,
                                    ),
                                  )),
                              Container(height: 10),
                              Container(
                                child: Text(
                                  "Unqualified",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 9),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 15,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DaftarNasabahStatus(
                                      status: 'closed',
                                    )),
                          );
                        },
                        child: Badge(
                          shape: BadgeShape.square,
                          borderRadius: BorderRadius.circular(5),
                          position: BadgePosition.topEnd(top: -12, end: -1),
                          padding: EdgeInsets.all(2),
                          badgeContent: Text(
                            countClosed,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                          badgeColor: Colors.red,
                          child: Column(
                            children: [
                              Container(
                                  // width: double.infinity,
                                  // height: 50,
                                  decoration: BoxDecoration(
                                    color: MyColors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: MyColors.grey_40,
                                        offset: const Offset(
                                          2.0,
                                          2.0,
                                        ),
                                        blurRadius: 3.0,
                                        spreadRadius: 2.0,
                                      ), //BoxShadow
                                      BoxShadow(
                                        color: Colors.white,
                                        offset: const Offset(0.0, 0.0),
                                        blurRadius: 0.0,
                                        spreadRadius: 0.0,
                                      ), //BoxShadow
                                    ],
                                    border: Border.all(
                                        width: 1,
                                        color: MyColors.primaryDark
                                            .withOpacity(0.8)),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Icon(
                                      Icons.how_to_reg,
                                      color: MyColors.primaryDark,
                                      size: 35,
                                    ),
                                  )),
                              Container(height: 10),
                              Container(
                                child: Text(
                                  "Closed",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 15,
                    ),
                    Container(width: 15)
                  ],
                ),

                // Container(height: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(height: 30),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text("Nasabah Terbaru",
                          style: MyText.medium(context).copyWith(
                            color: MyColors.grey_90,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.start),
                    ),
                  ],
                ),
                Container(height: 10),
                (nasabahBaru != null
                    ? Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 15,
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 15),
                                  width: (MediaQuery.of(context).size.width),
                                  decoration: BoxDecoration(
                                      color: MyColors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: MyColors.grey_40,
                                          offset: const Offset(
                                            2.0,
                                            2.0,
                                          ),
                                          blurRadius: 3.0,
                                          spreadRadius: 2.0,
                                        ), //BoxShadow
                                        BoxShadow(
                                          color: Colors.white,
                                          offset: const Offset(0.0, 0.0),
                                          blurRadius: 0.0,
                                          spreadRadius: 0.0,
                                        ), //BoxShadow
                                      ],
                                      border: Border.all(
                                          width: 1,
                                          color: MyColors.primaryDark)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  "Nama",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          Column(children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 25),
                                              child: Text(": " + namaNasabah),
                                            )
                                          ]),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  "Jenis",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          Column(children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 25),
                                              child: Text(": " + jenisNasabah),
                                            )
                                          ]),
                                        ],
                                      ),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                tanggal,
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ]),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              width: 140,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: MyColors.hijau
                                                    .withOpacity(0.6),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5, right: 5),
                                                child: Center(
                                                  child: Text(
                                                    statusNasabah,
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Align(
                                              alignment: Alignment.topRight,
                                              child: Container(
                                                width: 100,
                                                child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary:
                                                        MyColors.primaryDark,
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            new BorderRadius
                                                                .circular(10)),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 5, right: 5),
                                                    child: Text(
                                                      "View",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              DetailNasabah(
                                                                  id: IdNewNasabah)),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(width: 15)
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(width: 15)
                            ],
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
                                          builder: (context) =>
                                              DaftarNasabah()),
                                    );
                                  },
                                  child: Text(
                                    "Lihat Semua",
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: MyColors.primaryDark),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    : Center(
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Text(
                            'Daftar Nasabah Belum Tersedia',
                            style: TextStyle(color: MyColors.grey_60),
                          ),
                        ),
                      )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
