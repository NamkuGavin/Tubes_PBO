import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tubes_pbo/app/model/dummy/penghuni_model.dart';

import '../common/constant/assets.dart';
import '../common/constant/color_value.dart';

class ItemSearchPenghuni extends StatelessWidget {
  final PenghuniModel data;
  const ItemSearchPenghuni({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Color(0xFFBABABA))),
      child: Row(
        children: [
          SvgPicture.asset(IconAssets.person2, color: MyColor.mainBlue, height: 30),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(data.nama, style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
              Text("${data.jenisKelamin}, ${data.id}",
                  style: TextStyle(fontSize: 13, color: Color(0xFF8C8C8C))),
            ],
          )
        ],
      ),
    );
  }
}
