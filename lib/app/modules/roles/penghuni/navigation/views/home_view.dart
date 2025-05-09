import 'package:flutter/material.dart';

import '../../../../../common/constant/color_value.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.neutral500,
      body: SafeArea(
          child: Center(
        child: Text("HOME"),
      )),
    );
  }
}
