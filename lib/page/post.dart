
import 'package:buylap/screens/storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
 import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class Post extends StatefulWidget {

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {

  final StoragePath storage =  StoragePath();
  TextEditingController _name = TextEditingController();

  TextEditingController _desc = TextEditingController();

  TextEditingController _price = TextEditingController();


  sendUserName() async {
    CollectionReference _collectionRef=
    FirebaseFirestore.instance.collection('users-data');
    return _collectionRef.doc().set({
      'name':_name.text,
      'description':_desc.text,
      'price':_price.text,
    }).then((value) => print('user data added')).catchError((error)=>print("something is wrong")) ;
  }

  final _key = GlobalKey<FormState>();
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
              Form(
                key: _key,
                child: Column(
                  children: [
                    SizedBox(height: 30,),
                    TextFormField(
                      controller: _name,
                      validator: (value){
                        if(value!.isEmpty)
                          return 'Lastname field entry is needed';
                      },
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.account_circle_outlined,
                            color: Color(0xff5956E9),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
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
                      controller: _desc,
                      validator: (value){
                        if(value!.isEmpty)
                          return 'Lastname field entry is needed';
                      },
                      decoration: InputDecoration(
                          // prefixIcon: Icon(
                          //   Icons.messenger_outline,
                          //   color: Color(0xff5956E9),
                          // ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
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
                      keyboardType: TextInputType.number,
                      controller: _price,
                      validator: (value){
                        if(value!.isEmpty)
                          return 'Lastname field entry is needed';
                      },
                      decoration: InputDecoration(
                          // prefixIcon: Icon(
                          //   Icons.messenger_outline,
                          //   color: Color(0xff5956E9),
                          // ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
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
                    SizedBox(height: 20,),

                    Padding(
                      padding: const EdgeInsets.only(left: 50.0,right: 50,bottom: 20),
                      child: GestureDetector(
                        onTap: () async {
                           final results = await FilePicker.platform.pickFiles(
                             allowMultiple: false,
                             type: FileType.custom,
                             allowedExtensions: ['png','jpg'],
                           );
                           if(results ==null){
                             ScaffoldMessenger.of(context).showSnackBar(
                                 SnackBar(content: Text('No file selected'),
                                 ),
                             );
                             return null;
                           }

                           final path = results.files.single.path!;
                           final fileName = results.files.single.name ;

                           print(path);
                           print(fileName);

                           storage
                               .uploadFile( path, fileName)
                           .then((value) => print('Done'));
                        },
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xff5956E9),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text('Upload Image',
                                style: GoogleFonts.raleway(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700)),
                          ),
                        ),
                      ),
                    ),

                    GestureDetector(
                      onTap: (){
                        sendUserName();
                      },
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
            ],
          ),
        ),
      )
    );
  }

}
// class Storage {
//   final firebase_storage.FirebaseStorage storage =
//       firebase_storage.FirebaseStorage.instance;
//
//   Future<void> uploadFile(String filePath,
//       String fileName,) async {
//     File file = File(filePath);
//     try {
//       await storage.ref('test/$fileName').putFile(file);
//     } on firebase_core.FirebaseException catch (e) {
//       print(e);
//     }
//   }
