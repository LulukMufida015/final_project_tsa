import 'package:final_project/pages/detail_nasabah.dart';
import 'package:final_project/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:final_project/data/my_colors.dart';
import 'package:final_project/pages/camelcase.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class DaftarNasabahStatus extends StatefulWidget {
  final String status;
  const DaftarNasabahStatus({Key? key, required this.status}) : super(key: key);

  @override
  State<DaftarNasabahStatus> createState() => _DaftarNasabahStatusState();
}

class _DaftarNasabahStatusState extends State<DaftarNasabahStatus> {
  List _data = [];
  final String _tokenAuth = '';

  var marketing_id;

  Future _getAllData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    marketing_id = prefs.getInt('idUser');
    try {
      var url = Uri.parse('https://frontliner.intermediatech.id/api/home/all_assignment_by_category?marketing_id=' + marketing_id.toString() + '&category=' + widget.status.toString());
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
      appBar: AppBar(
        title: Text(
          "Daftar Nasabah " + widget.status.toCapitalized(), style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // method to show the search bar
              showSearch(
                  context: context,
                  // delegate to customize the search bar
                  delegate: CustomSearchDelegate());
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: ListView.builder(
          itemCount: _data.length,
          itemBuilder: (context, index) {
            return Padding(
               padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
              child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                        width: (MediaQuery.of(context).size.width),
                        decoration: BoxDecoration(
                            color: MyColors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(
                                width: 2.0, color: MyColors.primaryDark)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Nama     :",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Column(children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 25),
                                    child: Text(_data[index]['nama_nasabah']),
                                  )
                                ]),
                              ],
                            ),
                            Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Kategori :",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Column(children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 25),
                                    child: Text(_data[index]['jenis']),
                                  )
                                ]),
                              ],
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Created at " + _data[index]['created_at'],
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
                                      color: MyColors.hijau.withOpacity(0.6),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, right: 5),
                                      child: Center(
                                        child: Text(
                                          _data[index]['status'],
                                          style: TextStyle(color: Colors.white),
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
                                        style: ElevatedButton.styleFrom(
                                          primary: MyColors.primaryDark,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  new BorderRadius.circular(10)),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 5, right: 5),
                                          child: Text(
                                            "View",
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => DetailNasabah(id: _data[index]['id'])),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                Container(width: 15)
                              ],
                            )
                          ],
                        ),
                      ),
            );
          }
          )
      
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  // Demo list to show querying
  List<String> searchTerms = [
    "Apple",
    "Banana",
    "Mango",
    "Pear",
    "Watermelons",
    "Blueberries",
    "Pineapples",
    "Strawberries"
  ];

  // first overwrite to
  // clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  // second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  // third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  // last overwrite to show the
  // querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}
