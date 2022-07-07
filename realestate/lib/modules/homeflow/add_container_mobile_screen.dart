import 'package:flutter/material.dart';
import 'package:realestate/resources/custom_textfield.dart';

import '../../resources/colors.dart';
import '../../resources/globals.dart';
import '../../resources/images.dart';
import 'add_communit_web_screen.dart';
import 'home_screen.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:google_fonts/google_fonts.dart';

class AddContainerMobileScreen extends StatefulWidget {
  const AddContainerMobileScreen({Key? key}) : super(key: key);

  @override
  State<AddContainerMobileScreen> createState() =>
      _AddContainerMobileScreenState();
}

class _AddContainerMobileScreenState extends State<AddContainerMobileScreen> {
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Size sizes = MediaQuery.of(context).size;
    double h = sizes.height / 100;
    double w = sizes.width / 100;
    return Scaffold(
      key: _scaffoldkey,
      backgroundColor: Mycolors.lightgrey,
      drawer: sideDrawer(h, w, () {}),
      body: SafeArea(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            appBar(h, w, context, () {
              _scaffoldkey.currentState!.openDrawer();
            }),
            SizedBox(
              height: h * 2,
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 15),
                    child: Column(
                      children: [
                        headerButtons(h, w),
                        SizedBox(
                          height: h * 2,
                        ),
                        searchFilterSection(h, w),
                        SizedBox(
                          height: h * 2,
                        ),
                        GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) =>
                                      addCommunityInfo(h, w, context));
                            },
                            child: dottedContainer(h, w)),
                        SizedBox(
                          height: h * 2,
                        ),
                        addedContainers(h, w),
                        SizedBox(
                          height: h * 2,
                        ),
                        addedContainers(h, w)
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Container(
            //   width: w * 85,
            //   child: Column(
            //     children: [
            //       // headerSection(h, w),
            //       SizedBox(
            //         height: h * 3,
            //       ),
            //       Wrap(
            //         crossAxisAlignment: WrapCrossAlignment.start,
            //         runSpacing: 20,
            //         spacing: 20,
            //         children: [
            //           // addcommunityContainer(h, w),
            //           // addedContainers(h, w),
            //           // addedContainers(h, w),
            //           // addedContainers(h, w),
            //           // addedContainers(h, w),
            //           // addedContainers(h, w)
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

Widget headerButtons(double h, double w) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      headerButton(h * 4, w * 33, "Communities", Mycolors.seaBlue),
      headerButton(
          h * 4, w * 28, "Buildings", Mycolors.greyColor.withOpacity(0.7)),
      headerButton(h * 4, w * 22, "Units", Mycolors.greyColor.withOpacity(0.7)),
    ],
  );
}

Widget searchFilterSection(double h, double w) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      searchTextfield(h, w),
      Container(
        child: Row(
          children: [
            Image.asset(
              sorticon,
              height: 18,
            ),
            SizedBox(
              width: w * 2,
            ),
            Image.asset(
              filtericon,
              height: 18,
            ),
          ],
        ),
      ),
    ],
  );
}

Widget dottedContainer(double h, double w) {
  return DottedBorder(
    borderType: BorderType.RRect,
    radius: Radius.circular(10),
    child: ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      child: Container(
          height: h * 7,
          width: double.infinity,
          child: Center(
            child: Image.asset(
              addcontainericonmobile,
              height: 23,
            ),
          )),
    ),
  );
}

Widget addCommunityInfo(double h, double w, BuildContext context) {
  return Dialog(
    insetPadding: EdgeInsets.all(15),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    backgroundColor: Colors.transparent,
    child: Container(
      color: Colors.transparent,
      height: h * 73.50,
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: h * 70,
                decoration: BoxDecoration(
                    color: Mycolors.white,
                    borderRadius: BorderRadius.circular(20)),
              ),
            ],
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        cross,
                        height: 26,
                      )),
                ],
              ),
              SizedBox(
                height: h * 5,
              ),
              Text("Add new community",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                      color: Mycolors.darkGrey)),
              SizedBox(
                height: h * 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: customTextfield("Enter community name", ""),
              ),
              SizedBox(
                height: h * 3,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: customDropDown(h, w, "Selected City"),
              ),
              SizedBox(
                height: h * 3,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: customDropDown(h, w, "Select district"),
              ),
              SizedBox(
                height: h * 3,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                    ),
                    child: Text(
                      "Add Image",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.normal,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: h * 2,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                    ),
                    child: Image.asset(
                      attachmentimage,
                      height: 70,
                    ),
                  ),
                  SizedBox(
                    width: w * 2,
                  ),
                  Container(
                    height: h * 9,
                    width: w * 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Mycolors.darkGrey,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: h * 3,
              ),
              Padding(
                 padding: const EdgeInsets.only(left: 15, right: 15),
                child: Container(
                  height: h * 6,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Mycolors.blueColor),
                  child: Center(
                    child: Text(
                      "Save Community",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Mycolors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    ),
  );
}

String dropdownvalue = 'Item 1';

Widget customDropDown(double h, double w, String labletext) {
  return Container(
    height: isweb ? 60 : 60,
    child: Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: isweb ? 57 : 45,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Mycolors.darkGrey),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 20),
                child: DropdownButton(
                  underline: Container(),
                  isExpanded: true,
                  items: [
                    DropdownMenuItem(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("data"),
                      ),
                      value: dropdownvalue,
                    ),
                  ],
                  onChanged: (val) {},
                  value: dropdownvalue,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, bottom: 5),
          child: Container(
            height: h * 2,
            width: w * 22,
            color: Mycolors.white,
            child: Center(
              child: Text(
                labletext,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.normal,
                  fontSize: 10,
                ),
              ),
            ),
          ),
        )
      ],
    ),
  );
}
