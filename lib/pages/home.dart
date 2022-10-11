import 'package:final_project/pages/daftar_nasabah.dart';
import 'package:final_project/pages/detail_nasabah.dart';
import 'package:final_project/pages/home.dart';
import 'package:final_project/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:final_project/data/img.dart';
import 'package:final_project/data/my_colors.dart';
import 'package:final_project/data/my_strings.dart';
import 'package:final_project/widget/my_text.dart';
import 'package:badges/badges.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
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
                  Container(height: 10,),
                  Container(
                    height: 15,
                  ),
                  CircleAvatar(
                    radius: 65,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 90,
                      backgroundImage: AssetImage("assets/pp.jpg"),
                    ),
                  ),
                  Container(
                    height: 15,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 35, vertical: 3),
                    child: Text("Luluk Mufida",
                        style: MyText.title(context)!
                            .copyWith(color: MyColors.white)),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 35, vertical: 2),
                    child: Text("Marketing Funding",
                        style: MyText.body1(context)!
                            .copyWith(color: MyColors.white)),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: MyColors.red,
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '100 point',
                        style: TextStyle(
                            color: MyColors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                  ),
                  Container(
                    height: 15,
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
                                  width: 2.0, color: MyColors.primaryDark.withOpacity(0.8)),
                              boxShadow: [
                                BoxShadow(
                                  color: MyColors.grey_40,
                                  offset: const Offset(
                                    0,
                                    2.0,
                                  ),
                                  blurRadius: 5.0,
                                  spreadRadius: 2.0,
                                ),  //BoxShadow
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
                                        "400",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold, color: MyColors.primaryDark),
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
                                  width: 2.0, color: MyColors.primaryDark.withOpacity(0.8)),
                              boxShadow: [
                                BoxShadow(
                                  color: MyColors.grey_40,
                                  offset: const Offset(
                                    0,
                                    2.0,
                                  ),
                                  blurRadius: 5.0,
                                  spreadRadius: 2.0,
                                ),  //BoxShadow
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
                                        "500",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold, color: MyColors.primaryDark),
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
                      child: Badge(
                        shape: BadgeShape.square,
                        borderRadius: BorderRadius.circular(5),
                        position: BadgePosition.topEnd(top: -12, end: -20),
                        padding: EdgeInsets.all(2),
                        badgeContent: Text(
                          '1508',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold),
                        ),
                        badgeColor: Colors.red,
                        child: Column(
                          children: [
                            Container(
                                width: double.infinity,
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
                                      width: 2.0, color: MyColors.primaryDark.withOpacity(0.8)),
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
                    Container(
                      width: 15,
                    ),
                    Expanded(
                      child: Badge(
                        shape: BadgeShape.square,
                        borderRadius: BorderRadius.circular(5),
                        position: BadgePosition.topEnd(top: -12, end: -20),
                        padding: EdgeInsets.all(2),
                        badgeContent: Text(
                          '1508',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold),
                        ),
                        badgeColor: Colors.red,
                        child: Column(
                          children: [
                            Container(
                                width: double.infinity,
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
                                      width: 2.0, color: MyColors.primaryDark.withOpacity(0.8)),
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
                    Container(
                      width: 15,
                    ),
                    Expanded(
                      child: Badge(
                        shape: BadgeShape.square,
                        borderRadius: BorderRadius.circular(5),
                        position: BadgePosition.topEnd(top: -12, end: -20),
                        padding: EdgeInsets.all(2),
                        badgeContent: Text(
                          '1508',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold),
                        ),
                        badgeColor: Colors.red,
                        child: Column(
                          children: [
                            Container(
                                width: double.infinity,
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
                                      width: 2.0, color: MyColors.primaryDark.withOpacity(0.8)),
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
                    Container(
                      width: 15,
                    ),
                    Expanded(
                      child: Badge(
                        shape: BadgeShape.square,
                        borderRadius: BorderRadius.circular(5),
                        position: BadgePosition.topEnd(top: -12, end: -20),
                        padding: EdgeInsets.all(2),
                        badgeContent: Text(
                          '1508',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold),
                        ),
                        badgeColor: Colors.red,
                        child: Column(
                          children: [
                            Container(
                                width: double.infinity,
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
                                      width: 2.0, color: MyColors.primaryDark.withOpacity(0.8)),
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
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 9),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 15,
                    ),
                    Expanded(
                      child: Badge(
                        shape: BadgeShape.square,
                        borderRadius: BorderRadius.circular(5),
                        position: BadgePosition.topEnd(top: -12, end: -20),
                        padding: EdgeInsets.all(2),
                        badgeContent: Text(
                          '1508',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold),
                        ),
                        badgeColor: Colors.red,
                        child: Column(
                          children: [
                            Container(
                                width: double.infinity,
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
                                      width: 2.0, color: MyColors.primaryDark.withOpacity(0.8)),
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
                Row(
                  children: [
                    Container(
                      width: 15,
                    ),
                    Expanded(
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
                                    child: Text("Nama Nasabah Frontliner"),
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
                                        "Jenis :",
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
                                    child: Text("Funding"),
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
                                      "Created at 08:00 PM 09/09/2022",
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
                                          "Perlu difollow Up",
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
                                                  new BorderRadius.circular(
                                                      10)),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 5, right: 5),
                                          child: Text(
                                            "View",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailNasabah()),
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
                                builder: (context) => DaftarNasabah()),
                          );
                        },
                        child: Text(
                          "Load More",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: MyColors.primaryDark),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
