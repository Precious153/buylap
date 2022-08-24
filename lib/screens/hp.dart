import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Hp extends StatelessWidget {
  const Hp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30,),
          Text('Hp Laptops',
              style: GoogleFonts.raleway(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w700
              )),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: 270,
                          width: 220,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xff604AED)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 70.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('HP Probook X360 11 Intel\n'
                                    'Pentium Touchscreen\n265GB SSD-'
                                    ' 4GB RAM + \n32GB Flash Mouse',
                                    style: GoogleFonts.raleway(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700
                                    )),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0,top: 15),
                                  child: Row(
                                    children: [
                                      Text('Brand:',
                                          style: GoogleFonts.raleway(
                                              color: Colors.grey,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700
                                          )),
                                      SizedBox(width: 5,),
                                      Text('Hp',
                                          style: GoogleFonts.raleway(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700
                                          )),
                                    ],
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0,top: 15),
                                  child: Row(
                                    children: [
                                      Text('₦',
                                          style: GoogleFonts.raleway(
                                              color: Colors.grey,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700
                                          )),
                                      SizedBox(width: 5,),
                                      Text('145,000',
                                          style: GoogleFonts.raleway(
                                              color: Colors.grey,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700
                                          )),
                                    ],
                                  ),
                                ),


                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 180,
                          left: 30,
                          child:
                        Container(
                          height: 157,
                          width: 157,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: ClipOval(
                              child: Image.asset('images/hp2.jpg',fit: BoxFit.cover,)),
                        ),),
                      ],
                    ),
                  ),
                  SizedBox(width: 20,),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: 270,
                          width: 220,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0xff604AED)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 70.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('HP Probook X360 11 Intel\n'
                                    'Pentium Touchscreen\n265GB SSD-'
                                    ' 4GB RAM + \n32GB Flash Mouse',
                                    style: GoogleFonts.raleway(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700
                                    )),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0,top: 15),
                                  child: Row(
                                    children: [
                                      Text('Brand:',
                                          style: GoogleFonts.raleway(
                                              color: Colors.grey,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700
                                          )),
                                      SizedBox(width: 5,),
                                      Text('Hp',
                                          style: GoogleFonts.raleway(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700
                                          )),
                                    ],
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0,top: 15),
                                  child: Row(
                                    children: [
                                      Text('₦',
                                          style: GoogleFonts.raleway(
                                              color: Colors.grey,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700
                                          )),
                                      SizedBox(width: 5,),
                                      Text('145,000',
                                          style: GoogleFonts.raleway(
                                              color: Colors.grey,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700
                                          )),
                                    ],
                                  ),
                                ),


                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 180,
                          left: 30,
                          child:
                          Container(
                            height: 157,
                            width: 157,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: ClipOval(
                                child: Image.asset('images/hp2.jpg',fit: BoxFit.cover,)),
                          ),),
                      ],
                    ),
                  ),
                  SizedBox(width: 20,),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('see more',
                  style: GoogleFonts.raleway(
                      color: Color(0xff604AED),
                      fontSize: 20,
                      fontWeight: FontWeight.w700
                  )),
              Icon(Icons.arrow_forward,
                color: Color(0xff604AED),)
            ],
          ),

        ],
      )
    );
  }
}
