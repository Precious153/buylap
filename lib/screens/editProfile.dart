import 'package:buylap/page/profile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0,right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Text('EditProfile',
                  style: GoogleFonts.raleway(
                      color: Colors.black,
                      fontSize: 34,
                      fontWeight: FontWeight.w700
                  )),

              SizedBox(height:20,),
              TextFormField(
                validator: (value){
                  if(value!.isEmpty)
                    return 'Field entry is needed';
                },
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.account_circle_outlined,
                      color: Color(0xff5956E9),
                    ),
                    filled: true,
                    fillColor:Colors.white ,
                    contentPadding: EdgeInsets.only(left: 10),
                    hintText: "First Name",
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
              SizedBox(height:20,),
              TextFormField(
                validator: (value){
                  if(value!.isEmpty)
                    return 'Field entry is needed';
                },
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.account_circle_outlined,
                      color: Color(0xff5956E9),
                    ),
                    filled: true,
                    fillColor:Colors.white ,
                    contentPadding: EdgeInsets.only(left: 10),
                    hintText: "Last Name",
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
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>Profile()));
                },
                child: Container(height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xff5956E9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:Center(
                    child: Text('Save',
                        style: GoogleFonts.raleway(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w700
                        )),
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
