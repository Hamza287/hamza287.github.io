import 'package:flutter/material.dart';
import 'package:realestate/modules/homeflow/add_communit_web_screen.dart';
import 'package:realestate/modules/homeflow/add_container_mobile_screen.dart';
import 'package:realestate/modules/homeflow/dashboard.dart';
import 'package:realestate/resources/colors.dart';
import 'package:realestate/resources/images.dart';
import 'package:realestate/resources/sizedboxes.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../resources/globals.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
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
      key: _scaffoldkey,
      backgroundColor: Mycolors.lightgrey,
      drawer: sideDrawer(h, w, () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) => const AddContainerMobileScreen())));
      }),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            appBar(h, w, context, () {
              _scaffoldkey.currentState!.openDrawer();
            }),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  isweb
                      ? sideDrawer(h, w, () {
                          setState(() {
                            addcommunity = true;
                            print(addcommunity);
                            print("aaaaaaaaaaaaaaaaaa");
                          });
                        })
                      : const SizedBox(),
                  SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        addcommunity
                            ? const AddCommunityWebScreen()
                            : const DashBoard()
                      ],
                    ),
                  ),
                  SizedBox()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget appBar(double h, double w, BuildContext context, VoidCallback onpress) {
  return Container(
    height: isweb ? h * 10 : h * 8,
    width: double.infinity,
    color: Mycolors.white,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(left: isweb ? 20 : 15),
          child: Row(
            children: [
              isweb
                  ? SizedBox()
                  : GestureDetector(
                      onTap: onpress,
                      child: Image.asset(
                        drawericon,
                        height: 15,
                      ),
                    ),
              SizedBox(
                width: isweb ? 0 : 10,
              ),
              Image.asset(
                logo,
                height: isweb ? 41 : 25,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: isweb ? 20 : 15),
          child: Container(
            child: Row(
              children: [
                Image.asset(
                  searchicon,
                  height: isweb ? 25 : 18,
                ),
                isweb ? w30 : w15,
                Container(
                  height: isweb ? 19 : 15,
                  width: isweb ? 28 : 25,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Mycolors.red),
                  child: Center(
                    child: Text(
                      "34",
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontSize: isweb ? 10 : 8),
                    ),
                  ),
                ),
                Image.asset(
                  notificationicon,
                  height: isweb ? 25 : 22,
                ),
                isweb ? w30 : w20,
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage(profileimage),
                    ),
                    isweb ? w10 : w5,
                    isweb
                        ? Text(
                            "Justin Adams",
                            style: GoogleFonts.poppins(
                                fontSize: 13, color: Mycolors.darkGrey),
                          )
                        : SizedBox(),
                    isweb ? w10 : w5,
                    isweb
                        ? const Icon(
                            Icons.keyboard_arrow_down_sharp,
                            color: Mycolors.darkGrey,
                          )
                        : SizedBox()
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget sideDrawer(double h, double w, VoidCallback addcomunity) {
  return StatefulBuilder(
    builder: (context, setState) => Container(
      width: isweb ? w * 13 : w * 50,
      height: double.infinity,
      color: Mycolors.blueColor,
      child: ListView(
        shrinkWrap: true,
        children: [
          isweb ? h10 : h40,
          sideDrawerContent(dashboardicon, "Dashboard", 16, h, w, () {
            setState(() {});
          }),
          h25,
          Column(
            children: [
              sideDrawerContent(quicklinksicon, "Quick Links", 16, h, w, () {
                setState(() {
                  isquicklinks = !isquicklinks;
                });
              }),
              SizedBox(
                height: isquicklinks ? 10 : 0,
              ),
              isquicklinks
                  ? Container(
                      width: double.infinity,
                      child: Row(
                        children: [
                          SizedBox(
                            width: isweb ? w * 2.90 : w * 12.20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: addcomunity,
                                child: Text(
                                  "Add Community",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.normal,
                                      fontSize: isweb ? w * 0.70 : w * 3,
                                      color: Mycolors.white),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Add Building",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.normal,
                                    fontSize: isweb ? w * 0.70 : w * 3,
                                    color: Mycolors.white),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Add Unit",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.normal,
                                    fontSize: isweb ? w * 0.70 : w * 3,
                                    color: Mycolors.white),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "New Request",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.normal,
                                    fontSize: isweb ? w * 0.70 : w * 3,
                                    color: Mycolors.white),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "New Announcement",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.normal,
                                    fontSize: isweb ? w * 0.70 : w * 3,
                                    color: Mycolors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  : const SizedBox()
            ],
          ),
          h25,
          sideDrawerContent(buildingicon, "Properties", 18, h, w, () {
            setState(() {});
          }),
          h25,
          sideDrawerContent(requesticon, "Requests", 17, h, w, () {
            setState(() {});
          }),
          h25,
          sideDrawerContent(membericon, "Members", 11.40, h, w, () {
            setState(() {});
          }),
          h25,
          sideDrawerContent(transactionicon, "Transactions", 11.40, h, w, () {
            setState(() {});
          }),
          h25,
          sideDrawerContent(announcmenticon, "Announcements", 16, h, w, () {
            setState(() {});
          }),
          h25,
          sideDrawerContent(settingicon, "Settings", 16, h, w, () {
            setState(() {});
          }),
        ],
      ),
    ),
  );
}

Widget sideDrawerContent(String image, String title, double height, double h,
    double w, VoidCallback onpress) {
  return GestureDetector(
    onTap: onpress,
    child: Container(
      margin: const EdgeInsets.only(left: 19, right: 19),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                image,
                height: height,
              ),
              w10,
              Text(
                title,
                style: GoogleFonts.poppins(
                    fontSize: isweb ? w * 0.80 : w * 3,
                    color: Mycolors.white,
                    fontWeight: FontWeight.normal),
              )
            ],
          ),
        ],
      ),
    ),
  );
}

Widget headerSection(double h, double w) {
  return Container(
    width: isweb ? w * 83 : w * 92,
    child: Wrap(
      spacing: isweb ? 20 : 15,
      runSpacing: isweb ? 20 : 15,
      direction: Axis.horizontal,
      alignment: WrapAlignment.spaceBetween,
      children: [
        headerCards(h, w),
        headerCards(h, w),
        headerCards(h, w),
        headerCards(h, w),
        headerCards(h, w),
        headerCards(h, w),
        headerCards(h, w),
        headerCards(h, w),
        headerCards(h, w),
        headerCards(h, w),
      ],
    ),
  );
}

Widget headerCards(double h, double w) {
  return Container(
    height: h * 10,
    width: isweb ? w * 15.50 : w * 43,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: Mycolors.white,
    ),
    child: Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Owners",
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.normal,
                fontSize: 12,
                color: Mycolors.greyColor),
          ),
          h5,
          Text(
            "24",
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Mycolors.seaBlue),
          )
        ],
      ),
    ),
  );
}

class GraphWidget extends StatefulWidget {
  const GraphWidget({Key? key}) : super(key: key);

  @override
  State<GraphWidget> createState() => _GraphWidgetState();
}

class _GraphWidgetState extends State<GraphWidget> {
  final List<_ChartData> _data = [
    _ChartData('Jan', 100),
    _ChartData('Feb', 200),
    _ChartData('Mar', 400),
    _ChartData('Apr', 200),
    _ChartData('May', 100),
    _ChartData('jun', 300),
    _ChartData('jul', 600),
    _ChartData('aug', 700),
    _ChartData('sept', 800),
    _ChartData('oct', 500),
    _ChartData('nov', 400),
    _ChartData('dec', 500)
  ];

  @override
  Widget build(BuildContext context) {
    Size sizes = MediaQuery.of(context).size;
    double h = sizes.height / 100;
    double w = sizes.width / 100;
    return Column(
      children: [
        Container(
          height: h * 40,
          width: isweb ? w * 83 : w * 100,
          color: Mycolors.white,
          child: SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              primaryYAxis: NumericAxis(
                majorGridLines:
                    const MajorGridLines(width: 0, color: Mycolors.white),
                minimum: 0,
                maximum: 800,
                interval: 100,
              ),
              palette: <Color>[
                Mycolors.seaBlue,
                Mycolors.darkgreen
              ],
              // tooltipBehavior: _tooltip,
              series: <ChartSeries<_ChartData, String>>[
                ColumnSeries<_ChartData, String>(
                    dataSource: _data,
                    xValueMapper: (_ChartData data, _) => data.x,
                    yValueMapper: (_ChartData data, _) => data.y,
                    name: 'Gold',
                    color: Mycolors.seaBlue),
                ColumnSeries<_ChartData, String>(
                    dataSource: _data,
                    xValueMapper: (_ChartData data, _) => data.x,
                    yValueMapper: (_ChartData data, _) => data.y,
                    name: 'Gold',
                    color: Mycolors.darkgreen),
              ]),
        ),
        SizedBox(
          height: h * 15,
        )
      ],
    );
  }
}

// Widget graphWidget(double h, double w) {
//   return
// }

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
