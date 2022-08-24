
import 'package:buylap/screens/view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/apple.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      body:SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0,right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20,),
                Text('Order online\ncollect in store',
                    style: GoogleFonts.raleway(
                        color: Colors.black,
                        fontSize: 34,
                        fontWeight: FontWeight.w700
                    )),
                SizedBox(height: 20,),
                GestureDetector(
                  // onTap: (){
                  //   Navigator.push(context,
                  //   MaterialPageRoute(builder: (context)=>View()));
                  // },
                  child: Container(
                    height: 130,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0,top: 10),
                          child: Container(
                              height:100,
                              width: 100,
                              child: Image.asset('images/hp2.jpg',fit: BoxFit.cover,)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20,),
                              Text('HP Probook X360 11 Intel Pentium \nTouchscreen'
                                  '265GB SSD - 4GB\nRAM + 32GB Flash Mouse',
                                  style: GoogleFonts.raleway(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600
                                  )),
                              SizedBox(height: 20,),
                              Row(
                                children: [
                                  Text('₦',
                                      style: GoogleFonts.raleway(
                                          color: Color(0xff5956E9),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700
                                      )),
                                  Text('180,000',
                                      style: GoogleFonts.raleway(
                                          color: Color(0xff5956E9),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
