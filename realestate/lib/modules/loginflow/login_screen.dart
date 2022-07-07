import 'package:flutter/material.dart';
import 'package:realestate/modules/homeflow/home_screen.dart';

import '../../resources/colors.dart';
import '../../resources/custom_textfield.dart';
import '../../resources/globals.dart';
import '../../resources/images.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../resources/sizedboxes.dart';

import '../../resources/widgets.dart';
import 'forgot_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
          loginSection(h, w, context),
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

Widget loginSection(double h, double w, BuildContext context) {
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
                height: isweb ? 41 : 30,
              ),
            ],
          ),
          isweb ? h30 : h20,
          Text("Login.",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, fontSize: isweb ? 42 : 30)),
          h20,
          h15,
          Container(width: w * 35, child: customTextfield("ID Number", "")),
          h15,
          Container(
              width: w * 35,
              child: customTextfield("Enter Email/Phone no", "")),
          h15,
          Container(
              width: w * 35, child: customTextfield("Enter Password", "")),
          SizedBox(
            height: 33,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) =>
                              const ForgotPasswordScreen())));
                },
                child: Text(
                  "Forgot Password?",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                      color: Mycolors.blueColor),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 45,
          ),
          customButton("Login", () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomeScreen()));
          }),
          SizedBox(
            height: 35,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                    text: "New Here?",
                    style: GoogleFonts.poppins(
                        fontSize: 12, color: Mycolors.blackColor),
                    children: [
                      TextSpan(
                          text: " Register",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Mycolors.blueColor))
                    ]),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    ),
  );
}
