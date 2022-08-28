import 'package:buylap/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/editProfile.dart';
class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 40.0,right: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20,),
                  Text('My Profile',
                      style: GoogleFonts.raleway(
                          color: Colors.black,
                          fontSize: 34,
                          fontWeight: FontWeight.w700
                      )),
                  SizedBox(height: 20,),
                  Center(
                    child: Container(
                          height: 167,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                            child: Column(
                              children: [
                                Icon(Icons.account_circle,size: 76,),
                                SizedBox(height: 20,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Precious',
                                        style: GoogleFonts.raleway(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700
                                        )),
                                    SizedBox(width: 10,),
                                    Text('Adeleye',
                                        style: GoogleFonts.raleway(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                  ),
                  SizedBox(height: 20,),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>EditProfile()));
                    },
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white
                      ),
                      child: Row(
                        mainAxisAlignment:MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text('Edit Profile',
                                style: GoogleFonts.raleway(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Icon(Icons.arrow_forward_ios_outlined,
                              color: Colors.black,),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 27,),
                  Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white
                    ),
                    child: Row(
                      mainAxisAlignment:MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text('Shopping address',
                              style: GoogleFonts.raleway(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Icon(Icons.arrow_forward_ios_outlined,
                            color: Colors.black,),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 27,),
                  Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white
                    ),
                    child: Row(
                      mainAxisAlignment:MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text('Order history',
                              style: GoogleFonts.raleway(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Icon(Icons.arrow_forward_ios_outlined,
                            color: Colors.black,),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 27,),
                  Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white
                    ),
                    child: Row(
                      mainAxisAlignment:MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text('Cards',
                              style: GoogleFonts.raleway(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Icon(Icons.arrow_forward_ios_outlined,
                            color: Colors.black,),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 27,),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        FirebaseAuth.instance.signOut().then((value) =>
                        Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context)=>Login())));
                      },
                      child: Text('Sign Out',
                          style: GoogleFonts.raleway(
                              color: Colors.red,
                              fontSize: 16,
                              fontWeight: FontWeight.w700
                          )),
                    ),
                  ),
                  SizedBox(height: 20,)
              ]
            ),
    ),
          ),
        ),
    );
  }
}
