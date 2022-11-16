import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:receitas_avo/style/app_style.dart';

Widget receitaCard(Function()? onTap, QueryDocumentSnapshot doc) {
  return InkWell(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(14), boxShadow: [
          BoxShadow(offset: Offset(0, 0), blurRadius: 5),
          BoxShadow(
            color: Colors.black,
            offset: const Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ), //BoxShadow
        ]),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Center(
              child: CircleAvatar(
                radius: 49,
                backgroundImage: AssetImage(
                  doc["receitas_image"],
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 11,
                top: 2,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(doc["receitas_nome"],
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.bold)),
                      MaterialButton(
                        onPressed: () {
                          StreamBuilder : if (doc["receitas_like"] == true) {
                          FirebaseFirestore.instance
                              .collection("Receitas")
                              .doc(doc["receitas_nome"])
                              .update({
                                "receitas_like" : false 
                              });
                        } else {
                          FirebaseFirestore.instance
                              .collection("Receitas")
                              .doc(doc["receitas_nome"])
                              .update({
                                "receitas_like" : true  
                              });
                        }
                        },
                        color:Color.fromARGB(255, 73, 71, 71),
                        textColor: Colors.white,
                        child: Icon(Icons.favorite_rounded, color:doc["receitas_like"] == true? Colors.red : Colors.white,),
                        padding: EdgeInsets.all(3),
                        shape: CircleBorder(),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}
