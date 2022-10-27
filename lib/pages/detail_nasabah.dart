import 'package:final_project/data/my_colors.dart';
import 'package:final_project/pages/daftar_riwayat.dart';
import 'package:final_project/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:date_field/date_field.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:date_field/date_field.dart';

import 'package:file_picker/file_picker.dart';

class DetailNasabah extends StatefulWidget {
  final int id;
  const DetailNasabah({Key? key, required this.id}) : super(key: key);

  @override
  State<DetailNasabah> createState() => _DetailNasabahState();
}

class _DetailNasabahState extends State<DetailNasabah> {
  var _data;
  final String _tokenAuth = '';
  final TextEditingController _inputTitle = TextEditingController();
  final TextEditingController _inputCatatan = TextEditingController();
  final TextEditingController _inputTanggal = TextEditingController();

  var marketing_id;
  String nama_nasabah = "";
  String jenis = "";
  String created_at = "";
  String status = "";
  String attachment = "";
  String title = "";
  String note = "";
  String date_submit = "";
  var riwayat;

  List itemStatus = [];

  Future _getAllData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    marketing_id = prefs.getInt('idUser');
    try {
      var url = Uri.parse(
          'https://frontliner.intermediatech.id/api/home/assignment?id=' +
              widget.id.toString());
      var response = await http.get(
        url,
        headers: {'Authorization': 'Bearer ' + _tokenAuth},
      );
      if (response.statusCode == 200) {
        setState(() {
          _data = json.decode(response.body)['data'];
        });
        nama_nasabah = _data['nasabah']['nama_nasabah'].toString();
        jenis = _data['nasabah']['jenis'].toString();
        created_at = _data['nasabah']['created_at'].toString();
        status = _data['nasabah']['status'].toString();
        itemStatus = _data['status'];
        riwayat = _data['riwayat'];
        print(itemStatus);
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

   Future _getBookmark() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    marketing_id = prefs.getInt('idUser');
    try {
      var url = Uri.parse(
          'https://frontliner.intermediatech.id/api/home/assignment?id=' +
              widget.id.toString());
      var response = await http.get(
        url,
        headers: {'Authorization': 'Bearer ' + _tokenAuth},
      );
      if (response.statusCode == 200) {
        setState(() {
          _data = json.decode(response.body)['data'];
        });
        nama_nasabah = _data['nasabah']['nama_nasabah'].toString();
        jenis = _data['nasabah']['jenis'].toString();
        created_at = _data['nasabah']['created_at'].toString();
        status = _data['nasabah']['status'].toString();
        itemStatus = _data['status'];
        riwayat = _data['riwayat'];
        print(itemStatus);
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

  Future _postFormData() async {
    try {
      Map<String, String> requestBody = <String, String>{
        'assignment_id': widget.id.toString(),
        'title': _inputTitle.text,
        'status': dropdownvalue,
        'note': _inputCatatan.text,
        'date_submit': _inputTanggal.text,
      };

      Map<String, String> headers = <String, String>{
        'contentType': 'multipart/form-data',
        // 'Authorization': 'Bearer ' + _tokenAuth,
      };

      var request = http.MultipartRequest(
          'POST',
          Uri.parse(
              'https://frontliner.intermediatech.id/api/marketing/add_activity'))
        ..headers.addAll(headers)
        ..fields.addAll(requestBody);
      http.MultipartFile multipartFile =
          await http.MultipartFile.fromPath('attachment', _path);
      request.files.add(multipartFile);
      var response = await request.send();
      var res = await http.Response.fromStream(response);
      print(requestBody);
      if (res.statusCode == 200) {
        print('sukses');
      } else {
        print('error1');
      }
    } on SocketException {
      print('no internet');
    } on HttpException {
      print('error2');
    } on FormatException {
      print('error3');
    }
  }

  final _formKey = GlobalKey<FormState>();
  String _path = '';
  String _filename = '';

  void _onChangeFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png'],
    );

    if (result != null) {
      PlatformFile file = result.files.first;
      setState(() {
        _path = file.path.toString();
        _filename = file.name.toString();
      });
    } else {
      // User canceled the picker
    }
  }

  @override
  void initState() {
    super.initState();
    _getAllData();
  }

  // var items = ["Mangga", "Nangka", "Semangka"];
  String dropdownvalue = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Detail Nasabah",
              style: TextStyle(fontWeight: FontWeight.bold)),
          actions: <Widget>[
            // IconButton(icon: Icon(Icons.share), onPressed: () {}),
            IconButton(icon: Icon(Icons.bookmark_border), onPressed: () {}),
          ]),
      body: SingleChildScrollView(
          child: Column(children: [
        Container(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Nama    :",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(nama_nasabah,
                        style: TextStyle(fontWeight: FontWeight.bold))
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Jenis    :",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Text(jenis, style: TextStyle(fontWeight: FontWeight.bold))
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        created_at,
                        style: TextStyle(fontSize: 12, color: MyColors.grey_40),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(color: MyColors.grey_15),
          width: (MediaQuery.of(context).size.width),
          // height: 1000,
          child: Column(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:25, vertical: 15),
                  child: Row(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            color: MyColors.primaryDark,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Icon(
                              Icons.whatsapp,
                              color: MyColors.white,
                              size: 30,
                            ),
                          )),
                      Container(width: 10),
                      Container(
                          decoration: BoxDecoration(
                            color: MyColors.primaryDark,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Icon(
                              Icons.phone,
                              color: MyColors.white,
                              size: 30,
                            ),
                          )),
                      Container(width: 10),
                      Container(
                          decoration: BoxDecoration(
                            color: MyColors.primaryDark,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Icon(
                              Icons.mail,
                              color: MyColors.white,
                              size: 30,
                            ),
                          )),
                      Container(width: 10)
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 25),
                            child: Text(
                              "Judul",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 25, right: 25),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4))),
                              child: TextFormField(
                                controller: _inputTitle,
                                validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Judul tidak boleh kosong';
                                }
                                return null;
                              },
                                style: TextStyle(),
                                keyboardType: TextInputType.text,
                                cursorColor: MyColors.primaryDark,
                                decoration: InputDecoration(
                                  hintText: 'Judul Aktivitas',
                                  hintStyle: MyText.body1(context)!
                                      .copyWith(color: MyColors.grey_40),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                        color: MyColors.primaryDark, width: 2),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                        color: MyColors.grey_40, width: 1),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 25),
                            child: Text(
                              "Status",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 25, right: 25),
                            child: Container(
                              alignment: Alignment.centerLeft,
                              // padding: EdgeInsets.symmetric(horizontal: 25),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4))),
                              child: DropdownButtonFormField(
                                validator: (value) {
                                  if (value == null) {
                                    return 'Status tidak boleh kosong';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10),
                                  border: InputBorder.none,
                                  hintText: status,
                                  hintStyle: MyText.body1(context)!
                                      .copyWith(color: MyColors.grey_40),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                        color: MyColors.primaryDark, width: 2),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                        color: MyColors.grey_40, width: 1),
                                  ),
                                ),
                                // value: dropdownvalue,
                                icon: const Icon(Icons.keyboard_arrow_down),
                                items: itemStatus.map((items) {
                                  return DropdownMenuItem(
                                    value: items['id'].toString(),
                                    child: AutoSizeText(
                                      items['status'] +
                                          ' - ' +
                                          items['kategori'],
                                      style: TextStyle(fontSize: 15),
                                      maxLines: 1,
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownvalue = newValue!;
                                  });
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 25),
                            child: Text(
                              "Catatan",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 25, right: 25),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4))),
                              child: TextFormField(
                                controller: _inputCatatan,
                                validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Catatan tidak boleh kosong';
                                }
                                return null;
                              },
                                style: TextStyle(),
                                keyboardType: TextInputType.multiline,
                                cursorColor: MyColors.primaryDark,
                                maxLines: 12,
                                minLines: 7,
                                decoration: InputDecoration(
                                  hintText: 'Pesan',
                                  hintStyle: MyText.body1(context)!
                                      .copyWith(color: MyColors.grey_40),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                        color: MyColors.primaryDark, width: 2),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                        color: MyColors.grey_40, width: 1),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 25),
                            child: Text(
                              "Tanggal",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 25, right: 25),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4))),
                              child: TextFormField(
                                controller: _inputTanggal,
                                validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Tanggal tidak boleh kosong';
                                }
                                return null;
                              },
                                //editing controller of this TextField
                                decoration: const InputDecoration(
                                  hintStyle: TextStyle(color: Colors.black45),
                                  errorStyle:
                                      TextStyle(color: Colors.redAccent),
                                  border: OutlineInputBorder(),
                                  suffixIcon: Icon(Icons.event_note),
                                  labelText: 'Select Date',
                                ),
                                readOnly: true,
                                //set it true, so that user will not able to edit text
                                onTap: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1950),
                                      //DateTime.now() - not to allow to choose before today.
                                      lastDate: DateTime(2100));

                                  if (pickedDate != null) {
                                    print(
                                        pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                    String formattedDate =
                                        DateFormat('MM/dd/yyyy')
                                            .format(pickedDate);
                                    print(
                                        formattedDate); //formatted date output using intl package =>  2021-03-16
                                    setState(() {
                                      _inputTanggal.text =
                                          formattedDate; //set output date to TextField value.
                                    });
                                  } else {}
                                },
                              ),
                            ),
                          ),
                          Container(
                            width: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 25),
                            child: Text(
                              "Dokumen",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: Row(
                              children: [
                                Container(
                                  // width: (MediaQuery.of(context).size.width),
                                  child: Expanded(
                                      child:
                                          // Text("data"),
                                          ElevatedButton(
                                    onPressed: () {
                                      _onChangeFile();
                                    },
                                    style: ElevatedButton.styleFrom(
                                        primary:
                                            MyColors.hijau.withOpacity(0.4)),
                                    child: Text("Unggah Dokumen"),
                                  )),
                                ),
                                // Container(
                                //   width: 15,
                                // ),
                                // Container(
                                //   child: Expanded(
                                //       child:
                                //           // Text("data"),
                                //           ElevatedButton(
                                //     onPressed: () {},
                                //     style: ElevatedButton.styleFrom(
                                //         primary:
                                //             MyColors.hijau.withOpacity(0.4)),
                                //     child: Text("Buka Kamera"),
                                //   )),
                                // ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: Container(
                              child: Text(
                                _filename,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            // Container(
                            //   width: 15,
                            // ),
                            // Align(
                            //   alignment: Alignment.topRight,
                            //   child: Icon(Icons.close),
                            // )
                            // Container(
                            //   child: Expanded(
                            //     child:
                            //     // Text("data"),
                            //     ElevatedButton(onPressed: () {},
                            //     child: Text("data"),
                            //     )
                            //   ),
                            // ),
                          ),
                          Container(
                            height: 15,
                          ),
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: Container(
                                width: (MediaQuery.of(context).size.width),
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      _postFormData();
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                      primary: MyColors.primaryDark),
                                  child: Text("Kirim"),
                                ),
                              ))
                        ],
                      ),
                    ],
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
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
          child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Riwayat",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
        ),
        (riwayat != null
            ? Column(
                children: [
                  Padding(
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
                                        riwayat['attachment'].toString(),
                                        height: 100,
                                        width: 100,
                                        fit: BoxFit.cover)),
                                Container(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(riwayat['title'].toString().toUpperCase(),
                                          maxLines: 3,
                                          style: MyText.subhead(context)!
                                              .copyWith(
                                                  color: MyColors.grey_80,
                                                  fontWeight: FontWeight.w500)),
                                      Container(
                                        height: 5,
                                      ),
                                      Text(riwayat['note'].toString(),
                                          style: MyText.caption(context)!
                                              .copyWith(
                                                  color: MyColors.grey_40)),
                                      Spacer(),
                                      Spacer(),
                                      Row(
                                        children: <Widget>[
                                          Text(riwayat['status'].toString().toUpperCase(),
                                              style: MyText.caption(context)!
                                                  .copyWith(
                                                      color: MyColors.grey_40)),
                                          Spacer(),
                                          Text(riwayat['tanggal'].toString(),
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
                                  builder: (context) => DaftarRiwayat(id: widget.id)),
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
                    'Daftar Riwayat Belum Tersedia',
                    style: TextStyle(color: MyColors.grey_60),
                  ),
                ),
              ))
      ])),
    );
  }
}
