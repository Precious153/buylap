import 'package:buylap/signUp.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5956E9),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 70,),
              Center(
                child: Text('Find your\nGadget',
                style: GoogleFonts.raleway(
                    color: Colors.white,
                    fontSize: 56,
                  fontWeight: FontWeight.w800
                )),
              ),
              Image.asset('images/Saly.png'),
              SizedBox(height: 39,),
              Padding(
                padding: const EdgeInsets.only(left: 50,right: 50,bottom: 20),
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                  },
                  child: Container(height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:Center(
                    child: Text('Get started',
                        style: GoogleFonts.raleway(
                            color: Color(0xff5956E9),
                            fontSize: 20,
                            fontWeight: FontWeight.w700
                        )),
                  ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
