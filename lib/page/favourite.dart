import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Favourite extends StatelessWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0,right: 20),
            child: Column(
              children: [
                SizedBox(height: 50,),
                Text('Favorites',
                    style: GoogleFonts.raleway(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600
                    )),

                SizedBox(width: 115,),
                SizedBox(height: 20,),

                Image.asset('images/Sally4.png',
                fit: BoxFit.fill,),
                SizedBox(height: 20,),
                Text(' No Favorites',
                    style: GoogleFonts.raleway(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.w600
                    )),
                SizedBox(height: 24,),
                Text('Hit the orange button down\nbelow to Create an order',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.raleway(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w400
                    )),
                SizedBox(height: 24,),
                Container(
                  height: 50,
                  width: 224,
                  decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xff58C0EA),
                  ),
                  child: Center(
                    child: Text('Start ordering',
                        style: GoogleFonts.raleway(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w700
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
  