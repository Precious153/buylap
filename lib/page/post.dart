import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Post extends StatelessWidget {
  const Post ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.grey,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0,right: 20,left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Post Laptops',
                  style: GoogleFonts.raleway(
                      fontSize: 24,
                      color: Color(0xff5956E9),
                      fontWeight: FontWeight.w700
                  )),
              SizedBox(height: 30,),
              TextFormField(
                validator: (value){
                  if(value!.isEmpty)
                    return 'Lastname field entry is needed';
                },
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.account_circle_outlined,
                      color: Color(0xff5956E9),
                    ),
                    filled: true,
                    fillColor:Colors.white ,
                    contentPadding: EdgeInsets.only(left: 10),
                    hintText: "Laptop Name",
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromRGBO( 229, 229, 229, 1), width: 2),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromRGBO( 229, 229, 229, 1), width: 1.5),
                        borderRadius:  BorderRadius.circular(10)
                    ),
                    hintStyle:
                    GoogleFonts.raleway(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w400
                    )),
              ),
              SizedBox(height: 20,),
              TextFormField(
                validator: (value){
                  if(value!.isEmpty)
                    return 'Lastname field entry is needed';
                },
                decoration: InputDecoration(
                    // prefixIcon: Icon(
                    //   Icons.messenger_outline,
                    //   color: Color(0xff5956E9),
                    // ),
                    filled: true,
                    fillColor:Colors.white ,
                    contentPadding: EdgeInsets.only(left: 10),
                    hintText: "Description",
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromRGBO( 229, 229, 229, 1), width: 2),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromRGBO( 229, 229, 229, 1), width: 1.5),
                        borderRadius:  BorderRadius.circular(10)
                    ),
                    hintStyle:
                    GoogleFonts.raleway(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w400
                    )),
              ),
              SizedBox(height: 20,),
              TextFormField(
                validator: (value){
                  if(value!.isEmpty)
                    return 'Lastname field entry is needed';
                },
                decoration: InputDecoration(
                    // prefixIcon: Icon(
                    //   Icons.messenger_outline,
                    //   color: Color(0xff5956E9),
                    // ),
                    filled: true,
                    fillColor:Colors.white ,
                    contentPadding: EdgeInsets.only(left: 10),
                    hintText: "Price",
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromRGBO( 229, 229, 229, 1), width: 2),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromRGBO( 229, 229, 229, 1), width: 1.5),
                        borderRadius:  BorderRadius.circular(10)
                    ),
                    hintStyle:
                    GoogleFonts.raleway(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w400
                    )),
              ),

              SizedBox(height: 30,),
              GestureDetector(
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xff5956E9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text('Post laptop',
                        style: GoogleFonts.raleway(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w700)),
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
