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

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: MyColors.primaryDark,
              expandedHeight: 150.0,
              systemOverlayStyle:
                  SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: 
                Container(
                  decoration: BoxDecoration(color: MyColors.primaryDark),
                )
                // Image.asset('assets/pp.jpg', fit: BoxFit.cover),
              ),
              leading: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              // actions: <Widget>[
              //   IconButton(
              //     icon: const Icon(Icons.search),
              //     onPressed: () {},
              //   ), // overflow menu
              //   PopupMenuButton<String>(
              //     onSelected: (String value) {},
              //     itemBuilder: (context) => [
              //       PopupMenuItem(
              //         value: "Settings",
              //         child: Text("Settings"),
              //       ),
              //     ],
              //   )
              // ],
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(50),
                child: Container(
                  transform: Matrix4.translationValues(0, 50, 0),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey[200],
                    child: CircleAvatar(
                      radius: 48,
                      backgroundImage: AssetImage("assets/pp.jpg"),
                    ),
                  ),
                ),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: <Widget>[
                Container(height: 70),
                Text("Luluk Mufida",
                    style: MyText.headline(context)!.copyWith(
                        color: Colors.grey[900], fontWeight: FontWeight.bold)),
                Container(height: 15),
                Text("Marketing Funding",
                    textAlign: TextAlign.center,
                    style: MyText.subhead(context)!
                        .copyWith(color: Colors.grey[900])),
                Container(height: 25),
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: <Widget>[
                //     Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Container(height: 30),
                //         Padding(
                //           padding: const EdgeInsets.only(left: 15),
                //           child: Text("Statistik",
                //               style: MyText.medium(context).copyWith(
                //                 color: MyColors.grey_90,
                //                 fontWeight: FontWeight.bold,
                //               ),
                //               textAlign: TextAlign.start),
                //         ),
                //         Container(height: 10),
                //         Row(
                //           children: <Widget>[
                //             Container(width: 15),
                //             Expanded(
                //               child: Container(
                //                 padding: EdgeInsets.symmetric(vertical: 2),
                //                 width: double.infinity,
                //                 height: 60,
                //                 decoration: BoxDecoration(
                //                   color: MyColors.white,
                //                   borderRadius:
                //                       BorderRadius.all(Radius.circular(10)),
                //                   boxShadow: [
                //                     BoxShadow(
                //                       color: MyColors.grey_40,
                //                       offset: const Offset(
                //                         2.0,
                //                         2.0,
                //                       ),
                //                       blurRadius: 3.0,
                //                       spreadRadius: 2.0,
                //                     ), //BoxShadow
                //                     BoxShadow(
                //                       color: Colors.white,
                //                       offset: const Offset(0.0, 0.0),
                //                       blurRadius: 0.0,
                //                       spreadRadius: 0.0,
                //                     ), //BoxShadow
                //                   ],
                //                 ),
                //                 child: Column(
                //                   crossAxisAlignment: CrossAxisAlignment.start,
                //                   children: <Widget>[
                //                     Padding(
                //                       padding: const EdgeInsets.all(8),
                //                       child: Text(
                //                         'New',
                //                         style: TextStyle(
                //                             fontWeight: FontWeight.bold,
                //                             fontSize: 13),
                //                       ),
                //                     ),
                //                     Row(
                //                       children: [
                //                         Expanded(
                //                             child: Padding(
                //                           padding:
                //                               const EdgeInsets.only(left: 5),
                //                           child: Text(
                //                             "400",
                //                             style: TextStyle(
                //                                 fontSize: 16,
                //                                 fontWeight: FontWeight.bold),
                //                             textAlign: TextAlign.left,
                //                           ),
                //                         )),
                //                         Padding(
                //                           padding:
                //                               const EdgeInsets.only(right: 5),
                //                           child: Text(
                //                             "Nasabah",
                //                             textAlign: TextAlign.right,
                //                             style: TextStyle(fontSize: 13),
                //                           ),
                //                         ),
                //                       ],
                //                     ),
                //                   ],
                //                 ),
                //               ),
                //             ),
                //             Container(width: 10),
                //             Expanded(
                //               child: Container(
                //                 padding: EdgeInsets.symmetric(vertical: 2),
                //                 width: double.infinity,
                //                 height: 60,
                //                 decoration: BoxDecoration(
                //                   color: MyColors.white,
                //                   borderRadius:
                //                       BorderRadius.all(Radius.circular(10)),
                //                   boxShadow: [
                //                     BoxShadow(
                //                       color: MyColors.grey_40,
                //                       offset: const Offset(
                //                         2.0,
                //                         2.0,
                //                       ),
                //                       blurRadius: 3.0,
                //                       spreadRadius: 2.0,
                //                     ), //BoxShadow
                //                     BoxShadow(
                //                       color: Colors.white,
                //                       offset: const Offset(0.0, 0.0),
                //                       blurRadius: 0.0,
                //                       spreadRadius: 0.0,
                //                     ), //BoxShadow
                //                   ],
                //                 ),
                //                 child: Column(
                //                   crossAxisAlignment: CrossAxisAlignment.start,
                //                   children: <Widget>[
                //                     Padding(
                //                       padding: const EdgeInsets.all(8),
                //                       child: Text(
                //                         'On Progress',
                //                         style: TextStyle(
                //                             fontWeight: FontWeight.bold,
                //                             fontSize: 13),
                //                       ),
                //                     ),
                //                     Row(
                //                       children: [
                //                         Expanded(
                //                             child: Padding(
                //                           padding:
                //                               const EdgeInsets.only(left: 5),
                //                           child: Text(
                //                             "200",
                //                             style: TextStyle(
                //                                 fontSize: 16,
                //                                 fontWeight: FontWeight.bold),
                //                             textAlign: TextAlign.left,
                //                           ),
                //                         )),
                //                         Padding(
                //                           padding:
                //                               const EdgeInsets.only(right: 5),
                //                           child: Text(
                //                             "Nasabah",
                //                             textAlign: TextAlign.right,
                //                             style: TextStyle(fontSize: 13),
                //                           ),
                //                         ),
                //                       ],
                //                     ),
                //                   ],
                //                 ),
                //               ),
                //             ),
                //             Container(width: 10),
                //             Expanded(
                //               child: Container(
                //                 padding: EdgeInsets.symmetric(vertical: 2),
                //                 width: double.infinity,
                //                 height: 60,
                //                 decoration: BoxDecoration(
                //                   color: MyColors.white,
                //                   borderRadius:
                //                       BorderRadius.all(Radius.circular(8)),
                //                   boxShadow: [
                //                     BoxShadow(
                //                       color: MyColors.grey_40,
                //                       offset: const Offset(
                //                         2.0,
                //                         2.0,
                //                       ),
                //                       blurRadius: 3.0,
                //                       spreadRadius: 2.0,
                //                     ), //BoxShadow
                //                     BoxShadow(
                //                       color: Colors.white,
                //                       offset: const Offset(0.0, 0.0),
                //                       blurRadius: 0.0,
                //                       spreadRadius: 0.0,
                //                     ), //BoxShadow
                //                   ],
                //                 ),
                //                 child: Column(
                //                   crossAxisAlignment: CrossAxisAlignment.start,
                //                   children: <Widget>[
                //                     Padding(
                //                       padding: const EdgeInsets.all(8),
                //                       child: Text(
                //                         'All Data',
                //                         style: TextStyle(
                //                             fontWeight: FontWeight.bold,
                //                             fontSize: 13),
                //                       ),
                //                     ),
                //                     Row(
                //                       children: [
                //                         Expanded(
                //                             child: Padding(
                //                           padding:
                //                               const EdgeInsets.only(left: 5),
                //                           child: Text(
                //                             "600",
                //                             style: TextStyle(
                //                                 fontSize: 16,
                //                                 fontWeight: FontWeight.bold),
                //                             textAlign: TextAlign.left,
                //                           ),
                //                         )),
                //                         Padding(
                //                           padding:
                //                               const EdgeInsets.only(right: 5),
                //                           child: Text(
                //                             "Nasabah",
                //                             textAlign: TextAlign.right,
                //                             style: TextStyle(fontSize: 13),
                //                           ),
                //                         ),
                //                       ],
                //                     ),
                //                   ],
                //                 ),
                //               ),
                //             ),
                //             Container(width: 15),
                //           ],
                //         ),
                //       ],
                //     ),
                //     Container(height: 15),
                //     Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Container(height: 30),
                //         Padding(
                //           padding: const EdgeInsets.only(left: 15),
                //           child: Text("Status Progress",
                //               style: MyText.medium(context).copyWith(
                //                 color: MyColors.grey_90,
                //                 fontWeight: FontWeight.bold,
                //               ),
                //               textAlign: TextAlign.start),
                //         ),
                //       ],
                //     ),
                //     Container(height: 10),
                //     Row(
                //       children: [
                //         Container(
                //           width: 15,
                //         ),
                //         Expanded(
                //           child: Badge(
                //             shape: BadgeShape.square,
                //             borderRadius: BorderRadius.circular(5),
                //             position: BadgePosition.topEnd(top: -12, end: -20),
                //             padding: EdgeInsets.all(2),
                //             badgeContent: Text(
                //               '1508',
                //               style: TextStyle(
                //                   color: Colors.white,
                //                   fontSize: 10,
                //                   fontWeight: FontWeight.bold),
                //             ),
                //             badgeColor: Colors.red,
                //             child: Column(
                //               children: [
                //                 Container(
                //                   padding: EdgeInsets.symmetric(vertical: 15),
                //                   width: double.infinity,
                //                   height: 50,
                //                   decoration: BoxDecoration(
                //                     color: MyColors.white,
                //                     borderRadius:
                //                         BorderRadius.all(Radius.circular(6)),
                //                     boxShadow: [
                //                       BoxShadow(
                //                         color: MyColors.grey_40,
                //                         offset: const Offset(
                //                           2.0,
                //                           2.0,
                //                         ),
                //                         blurRadius: 3.0,
                //                         spreadRadius: 2.0,
                //                       ), //BoxShadow
                //                       BoxShadow(
                //                         color: Colors.white,
                //                         offset: const Offset(0.0, 0.0),
                //                         blurRadius: 0.0,
                //                         spreadRadius: 0.0,
                //                       ), //BoxShadow
                //                     ],
                //                   ),
                //                 ),
                //                 Container(height: 10),
                //                 Container(
                //                   child: Text(
                //                     "Hot",
                //                     style:
                //                         TextStyle(fontWeight: FontWeight.bold),
                //                   ),
                //                 )
                //               ],
                //             ),
                //           ),
                //         ),
                //         Container(
                //           width: 15,
                //         ),
                //         Expanded(
                //           child: Column(
                //             children: [
                //               Container(
                //                 padding: EdgeInsets.symmetric(vertical: 15),
                //                 width: double.infinity,
                //                 height: 50,
                //                 decoration: BoxDecoration(
                //                   color: MyColors.white,
                //                   borderRadius:
                //                       BorderRadius.all(Radius.circular(4)),
                //                   boxShadow: [
                //                     BoxShadow(
                //                       color: MyColors.grey_40,
                //                       offset: const Offset(
                //                         2.0,
                //                         2.0,
                //                       ),
                //                       blurRadius: 3.0,
                //                       spreadRadius: 2.0,
                //                     ), //BoxShadow
                //                     BoxShadow(
                //                       color: Colors.white,
                //                       offset: const Offset(0.0, 0.0),
                //                       blurRadius: 0.0,
                //                       spreadRadius: 0.0,
                //                     ), //BoxShadow
                //                   ],
                //                 ),
                //               ),
                //               Container(height: 10),
                //               Container(
                //                 child: Text(
                //                   "Warm",
                //                   style: TextStyle(fontWeight: FontWeight.bold),
                //                 ),
                //               )
                //             ],
                //           ),
                //         ),
                //         Container(
                //           width: 15,
                //         ),
                //         Expanded(
                //           child: Column(
                //             children: [
                //               Container(
                //                 padding: EdgeInsets.symmetric(vertical: 15),
                //                 width: double.infinity,
                //                 height: 50,
                //                 decoration: BoxDecoration(
                //                   color: MyColors.white,
                //                   borderRadius:
                //                       BorderRadius.all(Radius.circular(4)),
                //                   boxShadow: [
                //                     BoxShadow(
                //                       color: MyColors.grey_40,
                //                       offset: const Offset(
                //                         2.0,
                //                         2.0,
                //                       ),
                //                       blurRadius: 3.0,
                //                       spreadRadius: 2.0,
                //                     ), //BoxShadow
                //                     BoxShadow(
                //                       color: Colors.white,
                //                       offset: const Offset(0.0, 0.0),
                //                       blurRadius: 0.0,
                //                       spreadRadius: 0.0,
                //                     ), //BoxShadow
                //                   ],
                //                 ),
                //               ),
                //               Container(height: 10),
                //               Container(
                //                 child: Text(
                //                   "Cold",
                //                   style: TextStyle(fontWeight: FontWeight.bold),
                //                 ),
                //               )
                //             ],
                //           ),
                //         ),
                //         Container(
                //           width: 15,
                //         ),
                //         Expanded(
                //           child: Column(
                //             children: [
                //               Container(
                //                 padding: EdgeInsets.symmetric(vertical: 15),
                //                 width: double.infinity,
                //                 height: 50,
                //                 decoration: BoxDecoration(
                //                   color: MyColors.white,
                //                   borderRadius:
                //                       BorderRadius.all(Radius.circular(4)),
                //                   boxShadow: [
                //                     BoxShadow(
                //                       color: MyColors.grey_40,
                //                       offset: const Offset(
                //                         2.0,
                //                         2.0,
                //                       ),
                //                       blurRadius: 3.0,
                //                       spreadRadius: 2.0,
                //                     ), //BoxShadow
                //                     BoxShadow(
                //                       color: Colors.white,
                //                       offset: const Offset(0.0, 0.0),
                //                       blurRadius: 0.0,
                //                       spreadRadius: 0.0,
                //                     ), //BoxShadow
                //                   ],
                //                 ),
                //               ),
                //               Container(height: 10),
                //               Container(
                //                 child: Text(
                //                   "Unqualified",
                //                   style: TextStyle(
                //                       fontWeight: FontWeight.bold,
                //                       fontSize: 10.5),
                //                 ),
                //               )
                //             ],
                //           ),
                //         ),
                //         Container(
                //           width: 15,
                //         ),
                //         Expanded(
                //           child: Column(
                //             children: [
                //               Container(
                //                 padding: EdgeInsets.symmetric(vertical: 15),
                //                 width: double.infinity,
                //                 height: 50,
                //                 decoration: BoxDecoration(
                //                   color: MyColors.white,
                //                   borderRadius:
                //                       BorderRadius.all(Radius.circular(4)),
                //                   boxShadow: [
                //                     BoxShadow(
                //                       color: MyColors.grey_40,
                //                       offset: const Offset(
                //                         2.0,
                //                         2.0,
                //                       ),
                //                       blurRadius: 3.0,
                //                       spreadRadius: 2.0,
                //                     ), //BoxShadow
                //                     BoxShadow(
                //                       color: Colors.white,
                //                       offset: const Offset(0.0, 0.0),
                //                       blurRadius: 0.0,
                //                       spreadRadius: 0.0,
                //                     ), //BoxShadow
                //                   ],
                //                 ),
                //               ),
                //               Container(height: 10),
                //               Container(
                //                 child: Text(
                //                   "Closed",
                //                   style: TextStyle(fontWeight: FontWeight.bold),
                //                 ),
                //               )
                //             ],
                //           ),
                //         ),
                //         Container(width: 15)
                //       ],
                //     ),
                //     Container(height: 15),
                //     Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Container(height: 30),
                //         Padding(
                //           padding: const EdgeInsets.only(left: 15),
                //           child: Text("Nasabah Terbaru",
                //               style: MyText.medium(context).copyWith(
                //                 color: MyColors.grey_90,
                //                 fontWeight: FontWeight.bold,
                //               ),
                //               textAlign: TextAlign.start),
                //         ),
                //       ],
                //     ),
                //     Container(height: 10),
                //     Row(
                //       children: [
                //         Container(
                //           width: 15,
                //         ),
                //         Expanded(
                //           child: Container(
                //             padding: EdgeInsets.symmetric(
                //                 vertical: 15, horizontal: 15),
                //             width: (MediaQuery.of(context).size.width),
                //             decoration: BoxDecoration(
                //                 color: MyColors.white,
                //                 borderRadius:
                //                     BorderRadius.all(Radius.circular(10)),
                //                 border: Border.all(
                //                     width: 2.0, color: MyColors.primaryDark)),
                //             child: Column(
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               children: [
                //                 Row(
                //                   children: [
                //                     Column(
                //                       mainAxisAlignment:
                //                           MainAxisAlignment.start,
                //                       children: [
                //                         Padding(
                //                           padding: const EdgeInsets.all(8.0),
                //                           child: Text(
                //                             "Nama     :",
                //                             style: TextStyle(
                //                               fontWeight: FontWeight.bold,
                //                             ),
                //                           ),
                //                         )
                //                       ],
                //                     ),
                //                     Column(children: [
                //                       Padding(
                //                         padding:
                //                             const EdgeInsets.only(left: 25),
                //                         child: Text("Nama Nasabah Frontliner"),
                //                       )
                //                     ]),
                //                   ],
                //                 ),
                //                 Row(
                //                   children: [
                //                     Column(
                //                       mainAxisAlignment:
                //                           MainAxisAlignment.start,
                //                       children: [
                //                         Padding(
                //                           padding: const EdgeInsets.all(8.0),
                //                           child: Text(
                //                             "Kategori :",
                //                             style: TextStyle(
                //                               fontWeight: FontWeight.bold,
                //                             ),
                //                           ),
                //                         )
                //                       ],
                //                     ),
                //                     Column(children: [
                //                       Padding(
                //                         padding:
                //                             const EdgeInsets.only(left: 25),
                //                         child: Text("Funding"),
                //                       )
                //                     ]),
                //                   ],
                //                 ),
                //                 Row(
                //                     mainAxisAlignment: MainAxisAlignment.start,
                //                     children: [
                //                       Padding(
                //                         padding: const EdgeInsets.all(8.0),
                //                         child: Text(
                //                           "Created at 08:00 PM 09/09/2022",
                //                           style: TextStyle(
                //                             fontSize: 10,
                //                             fontWeight: FontWeight.bold,
                //                           ),
                //                         ),
                //                       ),
                //                     ]),
                //                 Row(
                //                   children: [
                //                     Padding(
                //                       padding: const EdgeInsets.all(8.0),
                //                       child: Container(
                //                         width: 140,
                //                         height: 30,
                //                         decoration: BoxDecoration(
                //                           color: MyColors.accentDark,
                //                           borderRadius: BorderRadius.all(
                //                               Radius.circular(10)),
                //                         ),
                //                         child: Padding(
                //                           padding: const EdgeInsets.only(
                //                               left: 5, right: 5),
                //                           child: Center(
                //                             child: Text(
                //                               "Perlu difollow Up",
                //                               style: TextStyle(
                //                                   color: Colors.white),
                //                             ),
                //                           ),
                //                         ),
                //                       ),
                //                     ),
                //                     Expanded(
                //                       child: Align(
                //                         alignment: Alignment.topRight,
                //                         child: Container(
                //                           width: 100,
                //                           child: ElevatedButton(
                //                             style: ElevatedButton.styleFrom(
                //                               primary: MyColors.primary,
                //                               shape: RoundedRectangleBorder(
                //                                   borderRadius:
                //                                       new BorderRadius.circular(
                //                                           10)),
                //                             ),
                //                             child: Padding(
                //                               padding: const EdgeInsets.only(
                //                                   left: 5, right: 5),
                //                               child: Text(
                //                                 "View",
                //                                 style: TextStyle(
                //                                     color: Colors.white),
                //                               ),
                //                             ),
                //                             onPressed: () {
                //                               Navigator.push(
                //                                 context,
                //                                 MaterialPageRoute(
                //                                     builder: (context) =>
                //                                         HomePage()),
                //                               );
                //                             },
                //                           ),
                //                         ),
                //                       ),
                //                     ),
                //                     Container(width: 15)
                //                   ],
                //                 )
                //               ],
                //             ),
                //           ),
                //         ),
                //         Container(width: 15)
                //       ],
                //     ),
                //     Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         Container(width: 15),
                //         Padding(
                //           padding: const EdgeInsets.all(15),
                //           child: GestureDetector(
                //             onTap: () {
                //               Navigator.push(
                //                 context,
                //                 MaterialPageRoute(
                //                     builder: (context) => DaftarNasabah()),
                //               );
                //             },
                //             child: Text(
                //               "Load More",
                //               style: TextStyle(
                //                   decoration: TextDecoration.underline,
                //                   color: MyColors.primaryDark),
                //             ),
                //           ),
                //         )
                //       ],
                //     )
                //   ],
                // ), Container(height: 35),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
