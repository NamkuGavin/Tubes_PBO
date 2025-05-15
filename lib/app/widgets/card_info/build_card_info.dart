import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/constant/assets.dart';
import '../../common/constant/color_value.dart';

class BuildCardInfo extends StatelessWidget {
  const BuildCardInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
                color: MyColor.mainGreen, borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Penghuni Aktif",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 13, color: Colors.white)),
                    SizedBox(height: 4),
                    Text("50 Orang",
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold, color: Colors.white)),
                  ],
                ),
                Spacer(),
                SvgPicture.asset(color: Colors.white, IconAssets.personUp, width: 23),
              ],
            ),
          ),
        ),
        SizedBox(width: 15),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
                color: MyColor.mainGreen, borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Kost Aktif",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 13, color: Colors.white)),
                    SizedBox(height: 4),
                    Text("25 Kost",
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold, color: Colors.white)),
                  ],
                ),
                Spacer(),
                SvgPicture.asset(color: Colors.white, IconAssets.kost, width: 23),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
