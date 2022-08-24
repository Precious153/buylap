import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class View extends StatelessWidget {
  const View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 250,
                  width: double.infinity,
                    child: Image.asset('images/hp2.jpg',fit: BoxFit.cover,),
                  ),
                  Positioned(
                    top: 180,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0,right: 10),
                      child: Positioned(
                        child:
                      Container(
                          height: 150,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 20,),
                                    Text('HP Probook X360 11 Intel Pentium Touchscreen'
                                        '265GB SSD - 4GB RAM + 32GB Flash Mouse',
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
                          )
                      ),),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
