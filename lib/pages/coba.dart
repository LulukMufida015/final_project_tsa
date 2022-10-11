import 'package:final_project/pages/daftar_nasabah.dart';
import 'package:final_project/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:final_project/data/img.dart';
import 'package:final_project/data/my_colors.dart';
import 'package:final_project/data/my_strings.dart';
import 'package:final_project/widget/my_text.dart';
import 'package:badges/badges.dart';

class ProfileRedRoute extends StatefulWidget {
  ProfileRedRoute();

  @override
  ProfileRedRouteState createState() => new ProfileRedRouteState();
}

class ProfileRedRouteState extends State<ProfileRedRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Home"),
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
                    radius: 53,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage("assets/pp.jpg"),
                    ),
                  ),
                  Container(
                    height: 15,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                    child: Text("James Pratterson",
                        style: MyText.title(context)!
                            .copyWith(color: MyColors.white)),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 35, vertical: 2),
                    child: Text("Graphic Designer",
                        style: MyText.body1(context)!
                            .copyWith(color: MyColors.white)),
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
                            height: 60,
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
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    'New',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        child: Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Text(
                                        "400",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.left,
                                      ),
                                    )),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 5),
                                      child: Text(
                                        "Nasabah",
                                        textAlign: TextAlign.right,
                                        style: TextStyle(fontSize: 13),
                                      ),
                                    ),
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
                            height: 60,
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
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    'On Progress',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        child: Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Text(
                                        "200",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.left,
                                      ),
                                    )),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 5),
                                      child: Text(
                                        "Nasabah",
                                        textAlign: TextAlign.right,
                                        style: TextStyle(fontSize: 13),
                                      ),
                                    ),
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
                            height: 60,
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
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    'All Data',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        child: Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Text(
                                        "600",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.left,
                                      ),
                                    )),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 5),
                                      child: Text(
                                        "Nasabah",
                                        textAlign: TextAlign.right,
                                        style: TextStyle(fontSize: 13),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(width: 15),
                      ],
                    ),
                  ],
                ),
                Container(height: 15),
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
                Container(height: 10),
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
                              padding: EdgeInsets.symmetric(vertical: 15),
                              width: double.infinity,
                              height: 50,
                              decoration: BoxDecoration(
                                color: MyColors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)),
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
                              ),
                            ),
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
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              color: MyColors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
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
                            ),
                          ),
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
                    Container(
                      width: 15,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              color: MyColors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
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
                            ),
                          ),
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
                    Container(
                      width: 15,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              color: MyColors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
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
                            ),
                          ),
                          Container(height: 10),
                          Container(
                            child: Text(
                              "Unqualified",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 10.5),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 15,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              color: MyColors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
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
                            ),
                          ),
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
                    Container(width: 15)
                  ],
                ),
                Container(height: 15),
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
                                                    HomePage()),
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
