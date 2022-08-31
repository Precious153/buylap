import 'package:buylap/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _email =TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _firstname =TextEditingController();
  TextEditingController _lastname = TextEditingController();
  bool _obsure = false;
  bool  loading =false;
  String errorMessage = '';
  String? validatePassword(String? formPassword) {
    if (formPassword == null || formPassword.isEmpty)
      return 'Password is required.';

    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(formPassword))
      return '''
      Password must be at least 8 characters,
      include an uppercase letter, number and symbol.
      ''';

    return null;
  }
  String? validateEmail(String? formEmail) {
    if (formEmail == null || formEmail.isEmpty)
      return 'E-mail address is required.';

    String pattern = r'\w+@\w+\.\w+';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(formEmail)) return 'Invalid E-mail Address format.';

    return null;
  }

  sendName() async {
    CollectionReference _collectionRef=
    FirebaseFirestore.instance.collection('user');
    return _collectionRef.doc().set({
      'firstname':_firstname.text,
      'lastname':_lastname.text,
    }).then((value) => print('user data added')).
    catchError((error)=>print("something is wrong")) ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0,right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height:70,),
                Text('Welcome to BuyLap',
                    style: GoogleFonts.raleway(
                        color: Color(0xff5956E9),
                        fontSize: 30,
                        fontWeight: FontWeight.w800
                    )),
                SizedBox(height:20,),
                Text('Hello, I guess you are new around here. You\n'
                    'can start the application after sign up.',
                    style: GoogleFonts.raleway(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                    )),
                SizedBox(height:50,),
               Form(
                 key: _formKey,
                 child: Column(
                   children: [
                     TextFormField(
                       keyboardType: TextInputType.emailAddress,
                       controller: _email,
                       validator:validateEmail,
                       decoration: InputDecoration(
                           border: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(10)
                           ),
                           prefixIcon: Icon(
                             Icons.email_outlined,
                             color: Color(0xff5956E9),
                           ),
                           filled: true,
                           fillColor:Colors.white ,
                           contentPadding: EdgeInsets.only(left: 10),
                           hintText: "Email",
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
                       controller: _firstname,
                       validator: (value){
                         if(value!.isEmpty)
                           return 'Firstname field entry is needed';
                       },
                       decoration: InputDecoration(
                           border: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(10)
                           ),
                           prefixIcon: Icon(
                             Icons.account_circle_outlined,
                             color: Color(0xff5956E9),
                           ),
                           filled: true,
                           fillColor:Colors.white ,
                           contentPadding:  EdgeInsets.only(left: 10),
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
                       controller: _lastname,
                       validator: (value){
                         if(value!.isEmpty)
                           return 'Lastname field entry is needed';
                       },
                       decoration: InputDecoration(
                           border: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(10)
                           ),
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
                     SizedBox(height:20,),
                     TextFormField(
                       controller: _password,
                       validator: validatePassword,
                       obscureText: _obsure,
                       decoration: InputDecoration(
                           border: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(10)
                           ),
                           prefixIcon: Icon(
                             Icons.lock_outline,
                             color: Color(0xff5956E9),
                           ),
                           filled: true,
                           fillColor:Colors.white ,
                           suffixIcon:!_obsure ? GestureDetector(
                             onTap: (){
                               setState(() {
                                 _obsure = !_obsure;
                               });
                             },
                             child: Icon(Icons.visibility,
                               color: Color(0xff5956E9),),
                           ) : GestureDetector(
                             onTap: () {
                               setState(() {
                                 _obsure = !_obsure;
                               });
                             },
                             child: Icon(Icons.visibility_off,
                               color: Color(0xff5956E9),
                             ),
                           ),
                           contentPadding: EdgeInsets.only(left: 10),
                           hintText: "Password",
                           enabledBorder: OutlineInputBorder(
                               borderSide: BorderSide(color: Color.fromRGBO( 229, 229, 229, 1), width: 2),
                               borderRadius: BorderRadius.circular(10)
                           ),
                           focusedBorder: OutlineInputBorder(
                               borderSide: BorderSide(color: Color.fromRGBO( 229, 229, 229, 1), width: 1.5),
                               borderRadius:  BorderRadius.circular(10)
                           ),
                           hintStyle: GoogleFonts.raleway(
                               color: Colors.grey,
                               fontSize: 14,
                               fontWeight: FontWeight.w400
                           )),
                     ),

                     SizedBox(height: 40,),
                     Center(
                       child: Text(
                         errorMessage,style: TextStyle(
                           color: Colors.red
                       ),),
                     ),
                    loading
                        ?CircularProgressIndicator(
                      valueColor: new AlwaysStoppedAnimation<Color>(Color(0xff5956E9)),
                    )
                        : GestureDetector(
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            loading = true;
                          });
                          try {
                            await
                            sendName();
                            FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                              email: _email.text.trim(),
                              password: _password.text,
                            )
                                .then((value) =>
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Login())));
                            errorMessage = '';
                          } on FirebaseAuthException catch (error) {
                            errorMessage = error.message!;
                            print(error);
                          } catch (e, s) {
                            print(e);
                            print(s);
                          }
                          setState(() {
                            loading = false;
                          });
                        }
                      },
                       child: Container(
                         height: 50,
                         width: double.infinity,
                         decoration: BoxDecoration(
                           color: Color(0xff5956E9),
                           borderRadius: BorderRadius.circular(10),
                         ),
                         child:Center(
                           child: Text('SignUp',
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

                SizedBox(height: 30,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account?',
                        style: GoogleFonts.raleway(
                            color: Colors.grey,
                            fontSize: 15,
                            fontWeight: FontWeight.w400
                        )),

                    GestureDetector(
                      onTap: (){
                        Navigator.pushReplacement(
                            context, MaterialPageRoute(builder: (context)=>Login()));
                      },
                      child: Text('Login',
                          style: GoogleFonts.raleway(
                              color: Color(0xff5956E9),
                              fontSize: 16,
                              fontWeight: FontWeight.w500
                          )),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );

  }
  // void sign(){
  //   final isValid = _formKey.currentState!.validate();
  //   if(!isValid){
  //     return;
  //   }else{
  //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
  //   }
  // }
}


