import 'package:flutter/material.dart';

import '../../../../../common/constant/color_value.dart';

class KostView extends StatelessWidget {
  const KostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.neutral500,
      body: SafeArea(
          child: Center(
            child: Text("KOST"),
          )),
    );
  }
}
