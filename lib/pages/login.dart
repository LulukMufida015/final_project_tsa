import 'package:flutter/material.dart';
import 'package:final_project/data/img.dart';
import 'package:final_project/data/my_colors.dart';
import 'package:final_project/pages/home.dart';
import 'package:final_project/widget/my_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                return  HomePage();
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
          child: Container(color: MyColors.primary)),
      body: Stack(
        children: <Widget>[
          Container(color: MyColors.primary, height: 220),
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
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(height: 25),
                        Text("SIGN IN",
                            style: MyText.title(context)!.copyWith(
                                color: Colors.green[500],
                                fontWeight: FontWeight.bold)),
                        TextField(
                          keyboardType: TextInputType.text,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: "Email",
                            labelStyle: TextStyle(color: Colors.blueGrey[400]),
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
                        TextField(
                          keyboardType: TextInputType.text,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: "Password",
                            labelStyle: TextStyle(color: Colors.blueGrey[400]),
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
                              primary: MyColors.primary,
                              shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(20)),
                            ),
                            child: Text(
                              "SUBMIT",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HomePage()),
                            );
                          },
                          ),
                        ),
                        // Container(
                        //   width: double.infinity,
                        //   child: TextButton(
                        //     style: TextButton.styleFrom(
                        //         primary: Colors.transparent),
                        //     child: Text(
                        //       "New user? Sign Up",
                        //       style: TextStyle(color: MyColors.primaryLight),
                        //     ),
                        //     onPressed: () {},
                        //   ),
                        // ),
                      ],
                    ),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
