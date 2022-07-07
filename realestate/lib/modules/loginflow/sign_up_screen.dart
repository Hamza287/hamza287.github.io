import 'package:flutter/material.dart';
import 'package:realestate/modules/loginflow/login_screen.dart';
import 'package:realestate/resources/colors.dart';
import 'package:realestate/resources/custom_textfield.dart';
import 'package:realestate/resources/images.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:realestate/resources/sizedboxes.dart';
import 'package:realestate/resources/widgets.dart';

import '../../resources/globals.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool chooseCategory = false;
  bool termsAndConditions = false;

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
          signUpSection(chooseCategory, termsAndConditions, h, w, context),
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

Widget signUpSection(bool iscompanyorindividual, bool ischeck, double h,
    double w, BuildContext context) {
  return Expanded(
    child: SizedBox(
      height: double.infinity,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.only(
            left: isweb ? w * 10 : w * 6, right: isweb ? w * 10 : w * 6),
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
          Text("Signup.",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, fontSize: isweb ? 42 : 30)),
          h20,
          StatefulBuilder(
              builder: ((context, setState) => Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            iscompanyorindividual = !iscompanyorindividual;
                            print(iscompanyorindividual);
                          });
                        },
                        child: Container(
                          height: 32,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: Mycolors.greyColor),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Container(
                                height: 32,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(17),
                                    color: iscompanyorindividual
                                        ? Mycolors.greyColor
                                        : Mycolors.seaBlue),
                                child: Center(
                                  child: Text(
                                    "Company",
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 11,
                                        color: iscompanyorindividual
                                            ? Colors.black
                                            : Colors.white),
                                  ),
                                ),
                              )),
                              Expanded(
                                  child: Container(
                                height: 32,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(17),
                                    color: iscompanyorindividual
                                        ? Mycolors.seaBlue
                                        : Mycolors.greyColor),
                                child: Center(
                                  child: Text("Individual",
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 11,
                                          color: iscompanyorindividual
                                              ? Colors.white
                                              : Colors.black)),
                                ),
                              ))
                            ],
                          ),
                        ),
                      ),
                      h25,
                      customTextfield("Enter Name", ""),
                      h15,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              width: isweb ? w * 6 : w * 22,
                              child: customTextfield("Code", "+992")),
                          Container(
                              width: isweb ? w * 23 : w * 60,
                              child: customTextfield("Mobile Number", ""))
                        ],
                      ),
                      h15,
                      Container(
                          width: isweb ? w * 35 : double.infinity,
                          child: customTextfield("Enter Email", "")),
                      h15,
                      iscompanyorindividual == false
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: isweb ? w * 25 : w * 70,
                                  child: customTextfield(
                                      "Commercial Registration Number", ""),
                                ),
                                Container(
                                  height: isweb ? h * 7.50 : w * 14,
                                  width: isweb ? w * 3.70 : w * 16,
                                  child: Stack(
                                    children: [
                                      Container(
                                        height: h * 6.50,
                                        width: isweb ? w * 5 : w * 15,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                                image: AssetImage(buildings),
                                                fit: BoxFit.fill),
                                            border: Border.all(
                                                color: Mycolors.blackColor)),
                                      ),
                                      Padding(
                                        padding: isweb
                                            ? EdgeInsets.only(
                                                left: w * 3, bottom: h * 2.50)
                                            : EdgeInsets.only(
                                                left: w * 12, bottom: h * 5),
                                        child: Image.asset(
                                          redcross,
                                          height: 17,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )
                          : Container(),
                      h15,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: isweb ? w * 25 : w * 70,
                            child:
                                customTextfield("VAT Registration Number", ""),
                          ),
                          Container(
                            height: isweb ? h * 7.50 : w * 14,
                            width: isweb ? w * 3.70 : w * 16,
                            child: Container(
                              height: h * 6.50,
                              width: isweb ? w * 5 : w * 15,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(attachment)),
                                  borderRadius: BorderRadius.circular(10),
                                  color: Mycolors.greyColor.withOpacity(0.4),
                                  border:
                                      Border.all(color: Mycolors.blackColor)),
                            ),
                          )
                        ],
                      ),
                    ],
                  ))),
          h15,
          Container(
              width: isweb ? w * 35 : double.infinity,
              child: customTextfield("Set Password", "")),
          h15,
          Container(
              width: isweb ? w * 35 : double.infinity,
              child: customTextfield("ID Number", "554")),
          SizedBox(
            height: 33,
          ),
          Row(
            children: [
              checkBox(ischeck),
              Text("I accept the Terms & Conditions",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.normal, fontSize: 12))
            ],
          ),
          SizedBox(
            height: 45,
          ),
          customButton("Signup", () {
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => const LoginScreen())));
          }),
          SizedBox(
            height: 35,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                    text: "Have an account?",
                    style: GoogleFonts.poppins(
                        fontSize: 12, color: Mycolors.blackColor),
                    children: [
                      TextSpan(
                          text: " Login",
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

Widget checkBox(bool ischeck) {
  return StatefulBuilder(
    builder: (context, setState) => Checkbox(
        activeColor: Mycolors.green,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        value: ischeck,
        onChanged: (value) {
          setState(() {
            ischeck = value!;
          });
        }),
  );
}
