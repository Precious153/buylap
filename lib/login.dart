import 'package:buylap/home_page.dart';
import 'package:buylap/screens/forgotpassword.dart';
import 'package:buylap/signUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  bool _obsure = false;
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  bool loading = false;
  String errorMessage = '';


  String? validateEmail(String? formEmail) {
    if (formEmail == null || formEmail.isEmpty)
      return 'E-mail address is required.';

    String pattern = r'\w+@\w+\.\w+';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(formEmail)) return 'Invalid E-mail Address format.';

    return null;
  }


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 70,
                ),
                Text('Welcome Back',
                    style: GoogleFonts.raleway(
                        color: Color(0xff5956E9),
                        fontSize: 30,
                        fontWeight: FontWeight.w800)),
                SizedBox(
                  height: 20,
                ),
                Text(
                    'I am happy to see you again, You can \n'
                    'continue where you left off by logging in.',
                    style: GoogleFonts.raleway(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w600)),
                SizedBox(
                  height: 50,
                ),
                Form(
                  key: _formkey,
                  child: Column(children: [
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _email,
                      validator: validateEmail,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
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
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _password,
                      validator: (value) {
                        if (value!.isEmpty) return 'Password field entry is needed';
                      },
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
                          fillColor: Colors.white,
                          suffixIcon: !_obsure
                              ? GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _obsure = !_obsure;
                                    });
                                  },
                                  child: Icon(
                                    Icons.visibility,
                                    color: Color(0xff5956E9),
                                  ),
                                )
                              : GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _obsure = !_obsure;
                                    });
                                  },
                                  child: Icon(
                                    Icons.visibility_off,
                                    color: Color(0xff5956E9),
                                  ),
                                ),
                          contentPadding: EdgeInsets.only(left: 10),
                          hintText: "Password",
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
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUp()));
                          },
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPassword()));
                            },
                            child: Text('forgot Password?',
                                style: GoogleFonts.raleway(
                                    color: Color(0xff5956E9),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500)),
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: Text(errorMessage,style: TextStyle(
                        color: Colors.red
                      ),),
                    ),
                    SizedBox(
                      height: 40,
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
                                      .signInWithEmailAndPassword(
                                        email: _email.text.trim(),
                                        password: _password.text,
                                      )
                                      .then((value) =>
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      HomePage())));
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
                                child: Text('SignIn',
                                    style: GoogleFonts.raleway(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700)),
                              ),
                            ),
                          ),
                  ]),
                ),
                // Spacer(),
                SizedBox(
                  height: 20,
                ),

                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUp()));
                    },
                    child: Text('Create account.',
                        style: GoogleFonts.raleway(
                            color: Color(0xff5956E9),
                            fontSize: 16,
                            fontWeight: FontWeight.w500)),
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
