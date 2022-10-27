import 'package:final_project/data/my_colors.dart';
import 'package:final_project/widget/my_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class DaftarRiwayat extends StatefulWidget {
   final int id;
  const DaftarRiwayat({Key? key, required this.id}) : super(key: key);

  @override
  State<DaftarRiwayat> createState() => _DaftarRiwayatState();
}

class _DaftarRiwayatState extends State<DaftarRiwayat> {
  List _data = [];
  final String _tokenAuth = '';

  Future _getAllData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      var url = Uri.parse('https://frontliner.intermediatech.id/api/home/assignment_get_all_riwayat?assignment_id=' + widget.id.toString());
      var response = await http.get(
        url,
        headers: {'Authorization': 'Bearer ' + _tokenAuth},
      );
      if (response.statusCode == 200) {
        setState(() {
          _data = json.decode(response.body)['data'];
        });
        print(_data);
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
    // Pertama Kali widget dijalankan memanggil request
    _getAllData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:
            Text("Daftar Riwayat", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: ListView.builder(
        itemCount: _data.length,
          itemBuilder: (context, index){
            return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 110,
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Row(
                              children: <Widget>[
                                Card(
                                    margin: EdgeInsets.all(0),
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: Image.network(
                                        _data[index]['attachment'],
                                        height: 100,
                                        width: 100,
                                        fit: BoxFit.cover)),
                                Container(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text( _data[index]['title'].toUpperCase(),
                                          maxLines: 3,
                                          style: MyText.subhead(context)!
                                              .copyWith(
                                                  color: MyColors.grey_80,
                                                  fontWeight: FontWeight.w500)),
                                      Container(
                                        height: 5,
                                      ),
                                      Text( _data[index]['note'],
                                          style: MyText.caption(context)!
                                              .copyWith(
                                                  color: MyColors.grey_40)),
                                      Spacer(),
                                      Spacer(),
                                      Row(
                                        children: <Widget>[
                                          Text( _data[index]['status'].toUpperCase(),
                                              style: MyText.caption(context)!
                                                  .copyWith(
                                                      color: MyColors.grey_40)),
                                          Spacer(),
                                          Text( _data[index]['tanggal'],
                                              style: MyText.caption(context)!
                                                  .copyWith(
                                                      color: MyColors.grey_40)),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(height: 10),
                          Divider(height: 0)
                        ],
                      ),
                    )
                  );
          }        
      ),
    );
  }
}