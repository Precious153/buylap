import 'package:buylap/page/cart.dart';
import 'package:buylap/page/favourite.dart';
import 'package:buylap/page/home.dart';
import 'package:buylap/page/post.dart';
import 'package:buylap/page/profile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int curretTab =0;
  final List<Widget> screens = [
    Cart(),
    Profile(),
    Post(),
    Favourite(),
    Home(),
  ];

  final PageStorageBucket bucket =  PageStorageBucket();
  Widget currentScreen = Home();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageStorage(
          child: currentScreen,
            bucket: bucket,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xff5956E9),
          child: Icon(Icons.add),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Post()));
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      minWidth: 40,
                        onPressed: (){
                        setState(() {
                          currentScreen = Home();
                          curretTab=0;
                        });
                        },
                      child: Column(
                        mainAxisAlignment:MainAxisAlignment.center,
                        children: [
                          Icon(Icons.home_filled,
                            color:curretTab==0 ? 
                            Color(0xff5956E9):Colors.grey,),
                        ], 
                      ),
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: (){
                        setState(() {
                          currentScreen = Favourite();
                          curretTab=1;
                        });
                      },
                      child: Column(
                        mainAxisAlignment:MainAxisAlignment.center,
                        children: [
                          Icon(Icons.favorite_outline,
                            color:curretTab==1 ?
                            Color(0xff5956E9):Colors.grey,),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      minWidth: 40,
                      onPressed: (){
                        setState(() {
                          currentScreen = Cart();
                          curretTab=2;
                        });
                      },
                      child: Column(
                        mainAxisAlignment:MainAxisAlignment.center,
                        children: [
                          Icon(Icons.shopping_cart_outlined,
                            color:curretTab==2 ?
                            Color(0xff5956E9):Colors.grey,),
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: (){
                        setState(() {
                          currentScreen =Profile();
                          curretTab=3;
                        });
                      },
                      child: Column(
                        mainAxisAlignment:MainAxisAlignment.center,
                        children: [
                          Icon(Icons.person_outline,
                            color:curretTab==3 ?
                            Color(0xff5956E9):Colors.grey,),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
       ),
    );
  }
}
