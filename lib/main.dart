import 'package:flutter/material.dart';
import 'package:final_project/pages/login.dart';
import 'package:final_project/pages/splashscreen.dart';
import 'package:final_project/data/my_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Frontliner BTN',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: MyColors.white,
          iconTheme: IconThemeData(color: Colors.black),
          // centerTitle: true,
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 16),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/login': (context) => const LoginPage(),
      },
      home: const LogoApp(),
    );
  }
}