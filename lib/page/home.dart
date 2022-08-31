import 'dart:io';

import 'package:buylap/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _name = TextEditingController();

  TextEditingController _desc = TextEditingController();

  TextEditingController _price = TextEditingController();

  final user = FirebaseAuth.instance.currentUser;
  final CollectionReference _reference =
      FirebaseFirestore.instance.collection('users-data');

  updateUserName() async {
    return _reference.doc(_name.text).update({
      'name':_name.text,
      'description':_desc.text,
      'price':_price.text,
    }).then((value) => Navigator.pop(context)).catchError((error)=>print("something is wrong")) ;
  }
  deleteUserName() async {
    return _reference.doc('users').delete(
    ).then((value) => Navigator.pop(context)).catchError((error)=>print("something is wrong")) ;
  }

  Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {

      _name.text = documentSnapshot['name'];
      _desc.text = documentSnapshot['description'];
      _price.text = documentSnapshot['price'].toString();
    }

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _name,
                  decoration: const InputDecoration(labelText: 'name'),
                ),
                TextField(
                  controller: _desc,
                  decoration: const InputDecoration(labelText: 'description'),
                ),
                TextField(
                  keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
                  controller: _price,
                  decoration: const InputDecoration(
                    labelText: 'price',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text( 'Update'),
                  onPressed: () async {
                    final String name = _name.text;
                    final String desc = _desc.text;
                    final double? price =
                    double.tryParse(_price.text);
                    if (price != null) {
                      await _reference
                          .doc(documentSnapshot!.id)
                          .update({
                        "name": name,
                        "price": price,
                        "description":desc});
                      _name.text = '';
                      _desc.text = '';
                      _price.text = '';
                      // Navigator.of(context).pop();
                    }
                  },
                )
              ],
            ),
          );
        });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffE5E5E5),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text('Order online\ncollect in store',
                      style: GoogleFonts.raleway(
                          color: Colors.black,
                          fontSize: 34,
                          fontWeight: FontWeight.w700)),
                  SizedBox(
                    height: 20,
                  ),
                  StreamBuilder(
                    stream: _reference.snapshots().asBroadcastStream(),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.hasError) {
                        return Center(child: Text('error'));
                      } else {
                        if (!snapshot.hasData) {
                          Center(
                            child: Center(
                              child: Text('No Data',style: TextStyle(
                                fontSize: 20
                              ),),
                            ),
                          //     child: CircularProgressIndicator(
                          //   color: Colors.red,
                          // )
                            );
                        } else {
                          final datavalue = snapshot.data!.docs.toList();
                          print(datavalue.length);
                          print(datavalue[0].data());
                          return Container(
                            height: 800,
                            child: ListView.builder(
                                itemCount: datavalue.length,
                                itemBuilder: (context, index) {
                                  return Expanded(
                                    child: Slidable(
                                      startActionPane: ActionPane(
                                        motion: ScrollMotion(),
                                        children: [
                                          SlidableAction(
                                            onPressed: (_){
                                              showModalBottomSheet<void>(
                                                context: context,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.vertical(
                                                    top: Radius.circular(20),
                                                  ),
                                                ),
                                                isScrollControlled: true,
                                                builder: (BuildContext context) {
                                                  return Container(
                                                    height: 800,
                                                    color: Colors.white,
                                                    child:Padding(
                                                      padding: const EdgeInsets.only(left: 20,right: 20,top: 50),
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [

                                                          Text('Update Laptops',
                                                              style: GoogleFonts.raleway(
                                                                  fontSize: 24,
                                                                  color: Color(0xff5956E9),
                                                                  fontWeight: FontWeight.w700
                                                              )),
                                                          Column(
                                                            children: [
                                                              SizedBox(height: 30,),
                                                              TextFormField(
                                                                controller: _name,
                                                                validator: (value){
                                                                  if(value!.isEmpty)
                                                                    return 'LaptopName field entry is needed';
                                                                },
                                                                decoration: InputDecoration(
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
                                                                    return 'Description field entry is needed';
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
                                                                    return 'Price field entry is needed';
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

                                                              GestureDetector(
                                                                onTap: (){
                                                                  // _update();
                                                                    _desc.clear();
                                                                    _name.clear();
                                                                    _price.clear();
                                                                },
                                                                child: Container(
                                                                  height: 50,
                                                                  width: double.infinity,
                                                                  decoration: BoxDecoration(
                                                                    color: Color(0xff5956E9),
                                                                    borderRadius: BorderRadius.circular(10),
                                                                  ),
                                                                  child: Center(
                                                                    child: Text('Update',
                                                                        style: GoogleFonts.raleway(
                                                                            fontSize: 20,
                                                                            color: Colors.white,
                                                                            fontWeight: FontWeight.w700)),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                            icon: Icons.edit,
                                            backgroundColor: Colors.blueAccent,
                                          ),
                                        ],
                                      ),
                                      endActionPane: ActionPane(
                                        motion: ScrollMotion(),
                                        children: [
                                          SlidableAction(
                                            onPressed: (_) {
                                            },
                                            icon: Icons.delete_outline,
                                            backgroundColor: Colors.red,
                                          )
                                        ],
                                      ),
                                      child: Column(
                                        children: [
                                          GestureDetector(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 20.0),
                                              child: Container(
                                                height: 130,
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: Colors.white),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 20.0,
                                                              top: 10),
                                                      child: Container(
                                                          height: 100,
                                                          width: 100,
                                                          child: Image.file(File(
                                                              '${datavalue[index]['imagepath'].toString()}'))),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 10.0),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          SizedBox(
                                                            height: 20,
                                                          ),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                  '${datavalue[index]['name']}',
                                                                  style: GoogleFonts.raleway(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600)),
                                                            ],
                                                          ),
                                                          Text(
                                                              '${datavalue[index]['description']}',
                                                              style: GoogleFonts.raleway(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600)),
                                                          SizedBox(
                                                            height: 20,
                                                          ),
                                                          Row(
                                                            children: [
                                                              Text('₦',
                                                                  style: GoogleFonts.raleway(
                                                                      color: Color(
                                                                          0xff5956E9),
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700)),
                                                              Text(
                                                                  '${datavalue[index]['price']}',
                                                                  style: GoogleFonts.raleway(
                                                                      color: Color(
                                                                          0xff5956E9),
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700)),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          );
                        }
                        return SizedBox();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
