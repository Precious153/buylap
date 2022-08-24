import 'package:basic_utils/basic_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../login.dart';
class ForgotPassword extends StatefulWidget {
  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  String? validateEmail(String? formEmail) {
    if (formEmail == null || formEmail.isEmpty)
      return 'E-mail address is required.';

    String pattern = r'\w+@\w+\.\w+';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(formEmail)) return 'Invalid E-mail Address format.';

    return null;
  }

  TextEditingController _email = TextEditingController();

  final _formkey = GlobalKey<FormState>();
  String errorMessage = '';
  bool loading = false;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0,right: 20,top: 50),
            child: Column(
              children: [
                Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _email,
                        validator: validateEmail,
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: Color(0xff5956E9),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.only(left: 10),
                            hintText: "Email",
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(229, 229, 229, 1),
                                    width: 2),
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(229, 229, 229, 1),
                                    width: 1.5),
                                borderRadius: BorderRadius.circular(10)),
                            hintStyle: GoogleFonts.raleway(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w400)),
                      ),
                      SizedBox(height: 30,),
                      Center(
                        child: Text(errorMessage,style: TextStyle(
                            color: Colors.red
                        ),),
                      ),
                      loading
                          ? CircularProgressIndicator(
                        valueColor: new AlwaysStoppedAnimation<Color>(Color(0xff5956E9)),
                      )
                          : GestureDetector(
                        onTap: () async {
                          if (_formkey.currentState!.validate()) {
                            setState(() {
                              loading = true;
                            });
                            try {
                              await FirebaseAuth.instance
                              .sendPasswordResetEmail(
                                  email: _email.text.trim()

                              ).then((value) =>
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Login())));
                              errorMessage = '';
                            } on FirebaseAuthException catch (error) {
                              errorMessage = error.message!;

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
                          child: Center(
                            child: Text('Reset Password',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
