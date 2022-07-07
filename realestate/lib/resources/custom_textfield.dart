import 'package:flutter/material.dart';
import 'package:realestate/resources/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:realestate/resources/globals.dart';

Widget customTextfield(String label, String hinttext,) {
  return Container(
    height:isweb? 57:45,
    width: double.infinity,
    child: TextField(
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        label: Text(label),
        labelStyle:
            GoogleFonts.poppins(fontWeight: FontWeight.normal, fontSize: 11),
        hintText: hinttext,
        hintStyle: GoogleFonts.poppins(color: Mycolors.greyColor, fontSize: 13),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Mycolors.darkGrey)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Mycolors.darkGrey)),
      ),
    ),
  );
}
