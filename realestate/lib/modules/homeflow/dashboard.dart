import 'package:flutter/material.dart';
import 'package:realestate/modules/homeflow/home_screen.dart';

import '../../resources/sizedboxes.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    Size sizes = MediaQuery.of(context).size;
    double h = sizes.height / 100;
    double w = sizes.width / 100;
    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [headerSection(h, w), h30, const GraphWidget()],
    );
  }
}
