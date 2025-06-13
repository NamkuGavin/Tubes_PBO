import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../common/constant/assets.dart';
import '../../../../../../../common/constant/color_value.dart';
import '../../../../../../../model/api/penghuni_model.dart';

class HeaderDetailPenghuni extends StatelessWidget {
  final PenghuniModel data;
  final Function() onKosongin;
  const HeaderDetailPenghuni({super.key, required this.data, required this.onKosongin});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(IconAssets.person2, color: MyColor.mainBlue, height: 35),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data.dataPenghuni.nama, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                  Text(
                    data.dataPenghuni.jenisKelamin,
                    style: TextStyle(fontSize: 15, color: Color(0xFF8C8C8C), fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ],
          ),
          GestureDetector(onTap: onKosongin, child: SvgPicture.asset(IconAssets.delete, color: Colors.red, height: 30))
        ],
      ),
    );
  }
}
