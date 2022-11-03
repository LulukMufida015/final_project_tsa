import 'package:final_project/data/my_colors.dart';
import 'package:final_project/pages/master.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class UbahPassword extends StatefulWidget {
  const UbahPassword({Key? key}) : super(key: key);

  @override
  State<UbahPassword> createState() => _UbahPasswordState();
}

class _UbahPasswordState extends State<UbahPassword> {
  final String _tokenAuth = '';
  final TextEditingController _inputOldPassword = TextEditingController();
  final TextEditingController _inputNewPassword = TextEditingController();
  final TextEditingController _inputConfirmNewPassword =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  var UserId;
  var _data;
  var _message;

  Future _postDataJson() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    UserId = prefs.getInt('idUser');
    print(UserId);
    try {
      var url = Uri.parse(
          'https://frontliner.intermediatech.id/api/marketing/change_password');
      var response = await http.post(url, headers: {
        'Authorization': 'Bearer ' + _tokenAuth
      }, body: {
        'marketing_id': UserId.toString(),
        'new_password': _inputNewPassword.text,
        'old_password': _inputOldPassword.text,
        'new_confirm_password': _inputConfirmNewPassword.text,
      });
      setState(() {
        // _data = json.decode(response.body)['data'];
        _message = json.decode(response.body)['message'];
      });
      if (response.statusCode == 200) {
        print('sukses');
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MyMaster()));
      } else {
        print('error1');
        // ignore: use_build_context_synchronously
        return _showToast(_message.toString(), context);
      }
    } on SocketException {
      print('no internet');
    } on HttpException {
      print('error2');
    } on FormatException {
      print('error3');
    }
  }

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

  bool passwordHidden = true;
  void _showPassword() {
    setState(() {
      passwordHidden = !passwordHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Kata Sandi",
        ),
      ),
      body: SingleChildScrollView(
          child: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              height: 20,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 10, left: 25, right: 25, bottom: 10),
                child: Text(
                  "Kata Sandi Anda akan diperbarui sesuai dengan kata sandi baru yang Anda isi pada form di bawah ini. Pastikan password baru tidak diketahui user selain Anda!",
                  style: TextStyle(color: MyColors.grey_40),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: TextFormField(
                controller: _inputOldPassword,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Kata sandi lama tidak boleh kosong';
                  }
                  return null;
                },
                obscureText: passwordHidden,
                keyboardType: TextInputType.text,
                style: TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  labelText: "Kata Sandi Lama",
                  labelStyle: TextStyle(color: MyColors.grey_40),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: MyColors.grey_40, width: 1),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: MyColors.grey_40, width: 2),
                  ),
                ),
              ),
            ),
            Container(
              height: 6,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: TextFormField(
                controller: _inputNewPassword,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Kata sandi baru tidak boleh kosong';
                  }
                  return null;
                },
                obscureText: passwordHidden,
                keyboardType: TextInputType.text,
                style: TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  labelText: "Kata Sandi Baru",
                  labelStyle: TextStyle(color: MyColors.grey_40),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: MyColors.grey_40, width: 1),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: MyColors.grey_40, width: 2),
                  ),
                ),
              ),
            ),
            Container(
              height: 6,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: TextFormField(
                controller: _inputConfirmNewPassword,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Konfirmasi kata sandi baru tidak boleh kosong';
                  }
                  return null;
                },
                obscureText: passwordHidden,
                keyboardType: TextInputType.text,
                style: TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  labelText: "Konfirmasi kata sandi lama",
                  labelStyle: TextStyle(color: MyColors.grey_40),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: MyColors.grey_40, width: 1),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: MyColors.grey_40, width: 2),
                  ),
                ),
              ),
            ),
            Container(
              height: 25,
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
          ],
        ),
      )),
    );
  }
}
