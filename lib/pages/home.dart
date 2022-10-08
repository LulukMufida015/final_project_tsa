import 'package:flutter/material.dart';
import 'package:final_project/data/my_colors.dart';
import 'package:final_project/model/bottom_nav.dart';
import 'package:final_project/widget/my_text.dart';

class HomePage extends StatefulWidget {

  final List<BottomNav> itemsNav = <BottomNav>[
    BottomNav('Home', Icons.home, null),
    BottomNav('Nasabah', Icons.file_copy, null),
    BottomNav('Profile', Icons.account_circle, null)
  ];

  @override
  HomePageState_ createState() => HomePageState_();
}

class HomePageState_ extends State<HomePage> with TickerProviderStateMixin<HomePage> {

  int currentIndex = 0;
  late BuildContext ctx;

  void onBackPress(){
    if(Navigator.of(ctx).canPop()){
      Navigator.of(ctx).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    ctx = context;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            // systemOverlayStyle: SystemUiOverlayStyle(
            //   statusBarBrightness: Brightness.dark,
            // ),
            bottom: PreferredSize(
                child: Card(
                  margin: EdgeInsets.all(10), elevation: 1,
                  child: Row(
                    children: <Widget>[
                      InkWell(
                        splashColor: Colors.grey[600], highlightColor: Colors.grey[600], onTap: onBackPress,
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Icon(Icons.menu, size: 23.0, color: Colors.grey[800],),
                        ),
                      ),
                      Text("Search", style: TextStyle(color: Colors.grey[600]),),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.all(12),
                        // child: Icon(Icons.mic, size: 23.0, color: Colors.grey[800],),
                      ),
                    ],
                  ),
                ),
                preferredSize: Size.fromHeight(15)
            ),
            backgroundColor: Colors.grey[200],
            automaticallyImplyLeading: false,
          ),
          Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(height: 30),
            Text("Pay Your Bills", style: MyText.medium(context).copyWith(color: MyColors.grey_90, fontWeight: FontWeight.bold)),
            Container(height: 10),
            Row(
              children: <Widget>[
                Container(width: 15),
                Expanded(
                  child: Container( padding: EdgeInsets.symmetric(vertical: 20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: MyColors.grey_5,
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.lightbulb_outline, size: 35, color: Colors.indigo[500]),
                          Container(height: 18),
                          Text("ELECTRICITY", style: MyText.body1(context)!.copyWith(color: MyColors.grey_90)),
                        ],
                    ),
                  ),
                ),
                Container(width: 6),
                Expanded(
                  child: Container( padding: EdgeInsets.symmetric(vertical: 20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: MyColors.grey_5,
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.invert_colors, size: 35, color: Colors.indigo[500]),
                        Container(height: 18),
                        Text("WATER", style: MyText.body1(context)!.copyWith(color: MyColors.grey_90)),
                      ],
                    ),
                  ),
                ),
                Container(width: 6),
                Expanded(
                  child: Container( padding: EdgeInsets.symmetric(vertical: 20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: MyColors.grey_5,
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.phone_android, size: 35, color: Colors.indigo[500]),
                        Container(height: 18),
                        Text("MOBILE", style: MyText.body1(context)!.copyWith(color: MyColors.grey_90)),
                      ],
                    ),
                  ),
                ),
                Container(width: 15),
              ],
            ),
            Container(height: 6),
            Row(
              children: <Widget>[
                Container(width: 15),
                Expanded(
                  child: Container( padding: EdgeInsets.symmetric(vertical: 20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: MyColors.grey_5,
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.phone, size: 35, color: Colors.indigo[500]),
                        Container(height: 18),
                        Text("LANDLINE", style: MyText.body1(context)!.copyWith(color: MyColors.grey_90)),
                      ],
                    ),
                  ),
                ),
                Container(width: 6),
                Expanded(
                  child: Container( padding: EdgeInsets.symmetric(vertical: 20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: MyColors.grey_5,
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.live_tv, size: 35, color: Colors.indigo[500]),
                        Container(height: 18),
                        Text("TV CABLE", style: MyText.body1(context)!.copyWith(color: MyColors.grey_90)),
                      ],
                    ),
                  ),
                ),
                Container(width: 6),
                Expanded(
                  child: Container( padding: EdgeInsets.symmetric(vertical: 20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: MyColors.grey_5,
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.public, size: 35, color: Colors.indigo[500]),
                        Container(height: 18),
                        Text("INTERNET", style: MyText.body1(context)!.copyWith(color: MyColors.grey_90)),
                      ],
                    ),
                  ),
                ),
                Container(width: 15),
              ],
            ),
            Container(height: 30),
            Text("Purchase Tickets", style: MyText.medium(context).copyWith(color: MyColors.grey_90, fontWeight: FontWeight.bold)),
            Container(height: 10),
            Row(
              children: <Widget>[
                Container(width: 15),
                Expanded(
                  child: Container( padding: EdgeInsets.symmetric(vertical: 20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: MyColors.grey_5,
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.local_movies, size: 35, color: Colors.indigo[500]),
                        Container(height: 18),
                        Text("MOVIE", style: MyText.body1(context)!.copyWith(color: MyColors.grey_90)),
                      ],
                    ),
                  ),
                ),
                Container(width: 6),
                Expanded(
                  child: Container( padding: EdgeInsets.symmetric(vertical: 20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: MyColors.grey_5,
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.event, size: 35, color: Colors.indigo[500]),
                        Container(height: 18),
                        Text("EVENT", style: MyText.body1(context)!.copyWith(color: MyColors.grey_90)),
                      ],
                    ),
                  ),
                ),
                Container(width: 6),
                Expanded(
                  child: Container( padding: EdgeInsets.symmetric(vertical: 20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: MyColors.grey_5,
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.directions_bike, size: 35, color: Colors.indigo[500]),
                        Container(height: 18),
                        Text("SPORT", style: MyText.body1(context)!.copyWith(color: MyColors.grey_90)),
                      ],
                    ),
                  ),
                ),
                Container(width: 15),
              ],
            ),
            Container(height: 6),
          ],
        ),
          // SliverList(
          //   delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          //     return IncludeReleasesContent.get(context);
          //   }, childCount: 1 ),
          // ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: MyColors.primary,
        unselectedItemColor: MyColors.grey_40,
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: widget.itemsNav.map((BottomNav d){
          return BottomNavigationBarItem(
            icon: Icon(d.icon),
            label: d.title,
          );
        }).toList(),
      ),
    );
  }
}
