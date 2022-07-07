import 'package:flutter/material.dart';
import 'package:realestate/modules/loginflow/verification_code_screen.dart';

import '../../resources/colors.dart';
import '../../resources/custom_textfield.dart';
import '../../resources/globals.dart';
import '../../resources/images.dart';
import '../../resources/sizedboxes.dart';
  import 'package:google_fonts/google_fonts.dart';

import '../../resources/widgets.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    Size sizes = MediaQuery.of(context).size;
    double h = sizes.height / 100;
    double w = sizes.width / 100;
    return Scaffold(
      body: SafeArea(
          child: Row(
        children: [
          isweb ? realEstateImage() : const SizedBox(),
          forgotPasswordSection(h, w, () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => const verificationCodeScreen())));
          }),
        ],
      )),
    );
  }
}

Widget realEstateImage() {
  return Expanded(
    child: Container(
      height: double.infinity,
      child: Image.asset(
        realestate,
        fit: BoxFit.fill,
      ),
    ),
  );
}

Widget forgotPasswordSection(double h, double w, VoidCallback onpress) {
  return Expanded(
    child: Container(
      height: double.infinity,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.only(left: w * 10, right: w * 10),
        children: [
          h60,
          Row(
            children: [
              Image.asset(
                logo,
                height:isweb? 41:30,
              ),
            ],
          ),
          isweb ? h30 : h20,
          Text("Reset Password.",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, fontSize: isweb ? 42 : 30)),
          Text(
            "Enter your email to get password reset verification code",
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.normal,
                fontSize: 12,
                color: Mycolors.greyColor),
          ),
          h20,
          Container(width: w * 35, child: customTextfield("Enter Email", "")),
          h15,
          SizedBox(
            height: 45,
          ),
          GestureDetector(
            onTap: onpress,
            child: customButton(
              "Send Code",
              (){}
            ),
          ),
          SizedBox(
            height: 35,
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    ),
  );
}
