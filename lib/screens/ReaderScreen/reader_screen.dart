// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:receitas_avo/screens/HomeScreen/homescreen.dart';

import '../../style/app_style.dart';

class ReceitaReaderScreen extends StatefulWidget {
  ReceitaReaderScreen(this.doc, {Key? key}) : super(key: key);
  QueryDocumentSnapshot doc;

  @override
  State<ReceitaReaderScreen> createState() => _ReceitaReaderScreenState();
}

class _ReceitaReaderScreenState extends State<ReceitaReaderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.accentColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: 1200,
          child: Stack(children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                height: 350,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(widget.doc["receitas_image"]))),
              ),
            ),
            Positioned(
                top: 36,
                left: 30,
                right: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    StreamBuilder(
                      builder: (context, snapshot) {
                        return GestureDetector(
                          onTap: (() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: ((context) => HomeScreen()),
                                ));
                          }),
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(46),
                                color: Color.fromARGB(183, 255, 255, 255)),
                            child: Center(
                                child: Icon(Icons.arrow_back_ios_new_rounded)),
                          ),
                        );
                      }
                    ),
                    Text(
                      widget.doc["receitas_nome"],
                      style: GoogleFonts.roboto(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    StreamBuilder(
                      builder: (context, snapshot) {
                        return MaterialButton(
                            onPressed: () {
                               if (widget.doc["receitas_like"] == true) {
                              FirebaseFirestore.instance
                                  .collection("Receitas")
                                  .doc(widget.doc["receitas_nome"])
                                  .update({
                                    "receitas_like" : false 
                                  });
                            } else {
                              FirebaseFirestore.instance
                                  .collection("Receitas")
                                  .doc(widget.doc["receitas_nome"])
                                  .update({
                                    "receitas_like" : true  
                                  });
                            }
                            },
                            height: 40,
                            color:Color.fromARGB(183, 255, 255, 255),
                            child: Icon(Icons.favorite_rounded, color:widget.doc["receitas_like"] == true? Colors.red : Colors.black,),
                            padding: EdgeInsets.all(3),
                            shape: CircleBorder(),
                          );
                      }
                    )
                  ],
                )),
            Positioned(
              left: 0,
              right: 0,
              top: 300,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(46)),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.menu_book_rounded),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          "Ingredientes",
                          style: GoogleFonts.roboto(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Text(
                        widget.doc["receitas_ingred"],
                        style: GoogleFonts.roboto(
                            fontSize: 12.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.black),
                      ),
                      width: 300,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.restaurant_menu_rounded),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          "Modo de preparo",
                          style: GoogleFonts.roboto(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Text(
                        widget.doc["receitas_desc"],
                        style: GoogleFonts.roboto(
                            fontSize: 12.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.black),
                      ),
                      width: 300,
                    ),
                  ]),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}


// widget.doc["receitas_desc"],
//widget.doc["receitas_ingred"],
//widget.doc["receitas_image"]