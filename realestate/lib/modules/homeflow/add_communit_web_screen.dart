import 'package:flutter/material.dart';
import 'package:realestate/resources/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:realestate/resources/globals.dart';
import 'package:realestate/resources/images.dart';
import 'package:dotted_border/dotted_border.dart';

import '../../resources/custom_textfield.dart';

class AddCommunityWebScreen extends StatefulWidget {
  const AddCommunityWebScreen({Key? key}) : super(key: key);

  @override
  State<AddCommunityWebScreen> createState() => _AddCommunityWebScreenState();
}

class _AddCommunityWebScreenState extends State<AddCommunityWebScreen> {
  bool isCommunity = true;
  bool isBuildings = false;
  bool isUnits = false;

  @override
  Widget build(BuildContext context) {
    Size sizes = MediaQuery.of(context).size;
    double h = sizes.height / 100;
    double w = sizes.width / 100;
    return StatefulBuilder(
        builder: ((context, setState) => Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: h * 3,
                ),
                Container(
                  width: w * 85,
                  child: Column(
                    children: [
                      headerSection(h, w, isCommunity, isBuildings, isUnits),
                      SizedBox(
                        height: h * 3,
                      ),
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.start,
                        runSpacing: 20,
                        spacing: 20,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                showDialog(
                                    context: context,
                                    builder: (context) =>
                                        addCommunityInfoWeb(h, w, context));
                              });
                            },
                            child: addcommunityContainer(
                                h, w, isCommunity, isBuildings, isUnits),
                          ),
                          addedContainers(h, w),
                          addedContainers(h, w),
                          addedContainers(h, w),
                          addedContainers(h, w),
                          addedContainers(h, w)
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }
}

Widget headerSection(
    double h, double w, bool comunity, bool building, bool units) {
  return StatefulBuilder(
      builder: ((context, setState) => Row(
            // crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            comunity = true;
                            building = false;
                            units = false;
                            print(comunity);
                          });
                        },
                        child: headerButton(
                            h * 4,
                            w * 8,
                            "Communities",
                            comunity
                                ? Mycolors.seaBlue
                                : Mycolors.greyColor.withOpacity(0.7))),
                    SizedBox(
                      width: w * 1,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          building = true;
                          comunity = false;
                          units = false;
                          print(building);
                        });
                      },
                      child: headerButton(
                          h * 4,
                          w * 6,
                          "Buildings",
                          building
                              ? Mycolors.seaBlue
                              : Mycolors.greyColor.withOpacity(0.7)),
                    ),
                    SizedBox(
                      width: w * 1,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          building = false;
                          comunity = false;
                          units = true;
                          print(units);
                        });
                      },
                      child: headerButton(
                          h * 4,
                          w * 4,
                          "Units",
                          units
                              ? Mycolors.seaBlue
                              : Mycolors.greyColor.withOpacity(0.7)),
                    ),
                    SizedBox(
                      width: w * 1,
                    ),
                    searchTextfield(h, w),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Container(
                  child: Row(
                    children: [
                      Image.asset(
                        sorticon,
                        height: 18,
                      ),
                      SizedBox(
                        width: w * 1,
                      ),
                      Image.asset(
                        filtericon,
                        height: 18,
                      ),
                    ],
                  ),
                ),
              )
            ],
          )));
}

Widget headerButton(double h, double w, String title, Color color) {
  return Container(
    height: h,
    width: w,
    child: Center(
      child: Text(
        title,
        style: GoogleFonts.poppins(
            fontWeight: FontWeight.normal, color: Mycolors.white, fontSize: 11),
      ),
    ),
    decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(20), color: color),
  );
}

Widget searchTextfield(double h, double w) {
  return Container(
    height: h * 4,
    width: isweb ? w * 25 : w * 60,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Mycolors.greyColor.withOpacity(0.3)),
    child: TextField(
      decoration: InputDecoration(
          disabledBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          contentPadding: EdgeInsets.only(bottom: isweb ? 18 : 14),
          prefixIcon: Icon(
            Icons.search,
            size: 18,
          ),
          prefixIconConstraints:
              BoxConstraints(minWidth: isweb ? w * 2 : w * 10),
          hintText: "Search"),
    ),
  );
}

Widget addcommunityContainer(
    double h, double w, bool community, bool building, bool units) {
  return StatefulBuilder(
      builder: (context, setState) => DottedBorder(
            borderType: BorderType.RRect,
            radius: Radius.circular(10),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              child: Container(
                  height: h * 49,
                  width: w * 27,
                  child: Center(
                    child: community
                        ? Image.asset(
                            addcontainerImage,
                            height: 60,
                          )
                        : building
                            ? Image.asset(
                                addbuilding,
                                height: 60,
                              )
                            : units
                                ? Image.asset(
                                    addunit,
                                    height: 60,
                                  )
                                : Text("error"),
                  )),
            ),
          ));
}

Widget addedContainers(double h, double w) {
  return Container(
    height: isweb ? h * 49 : h * 40,
    width: isweb ? w * 27 : double.infinity,
    decoration: BoxDecoration(
        color: Mycolors.white, borderRadius: BorderRadius.circular(10)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(communityimage),
        SizedBox(
          height: h * 1.70,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            "Building Name",
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.normal,
                fontSize: 16,
                color: Mycolors.blackColor),
          ),
        ),
        SizedBox(
          height: h * 1,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Row(
            children: [
              Image.asset(
                locationicon,
                height: 16,
              ),
              SizedBox(
                width: w * 0.40,
              ),
              Text(
                "Location",
                style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Mycolors.greyColor,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
        SizedBox(
          height: h * 1,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Row(
            children: [
              Image.asset(
                uniticon,
                height: 14,
              ),
              SizedBox(
                width: w * 0.40,
              ),
              Text(
                "6 Units",
                style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Mycolors.greyColor,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
        SizedBox(
          height: h * 2,
        ),
        Container(
          height: h * 0.10,
          margin: EdgeInsets.only(left: 6, right: 6),
          color: Mycolors.lightgrey,
        ),
        SizedBox(
          height: h * 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              deleteicon,
              height: 18,
            ),
            Image.asset(
              editicon,
              height: 18,
            ),
            Image.asset(
              viewicon,
              height: 18,
            )
          ],
        )
      ],
    ),
  );
}

Widget addCommunityInfoWeb(double h, double w, BuildContext context) {
  return Dialog(
    insetPadding: EdgeInsets.only(left: 500, right: 500),
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
              SizedBox(height: h * 3),
              Text("Add new community",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                      color: Mycolors.darkGrey)),
              SizedBox(
                height: h * 3,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: textfieldForDialog("Enter community name", ""),
              ),
              SizedBox(
                height: h * 2,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: customDropDown(h, w, "Selected City"),
              ),
              SizedBox(
                height: h * 2,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: customDropDown(h, w, "Select district"),
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
                    width: w * 1,
                  ),
                  Container(
                    height: h * 9,
                    width: w * 4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Mycolors.darkGrey,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: h * 2,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Container(
                  height: h * 6.70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Mycolors.seaBlue.withOpacity(0.3)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Image.asset(
                          locationicon,
                          color: Mycolors.seaBlue,
                          height: 18,
                        ),
                        SizedBox(
                          width: w * 0.50,
                        ),
                        Text(
                          "Pick location via map",
                          style: GoogleFonts.poppins(
                              color: Mycolors.seaBlue,
                              fontWeight: FontWeight.normal,
                              fontSize: 12),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: h * 2,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
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
    height: 55,
    child: Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 45,
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
          padding: const EdgeInsets.only(left: 10, bottom: 15),
          child: Container(
            height: h * 2,
            width: w * 5,
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

Widget textfieldForDialog(
  String label,
  String hinttext,
) {
  return Container(
    height: 45,
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
