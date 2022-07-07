import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:realestate/resources/colors.dart';
import 'package:google_fonts/google_fonts.dart';

Widget customButton(String title,VoidCallback onpress) {
  return GestureDetector(
    onTap: onpress,
    child: Container(
      height: 40,
      width: double.infinity,
      
      child: Center(
        child: Text(title,
            style: GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 12,color: Colors.white)),
      ),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Mycolors.blueColor,),
    ),
  );
}
