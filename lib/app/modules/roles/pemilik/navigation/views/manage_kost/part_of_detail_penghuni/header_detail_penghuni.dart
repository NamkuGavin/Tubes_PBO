import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../common/constant/assets.dart';
import '../../../../../../../common/constant/color_value.dart';
import '../../../../../../../model/dummy/penghuni_model.dart';

class HeaderDetailPenghuni extends StatelessWidget {
  final PenghuniModel data;
  const HeaderDetailPenghuni({super.key, required this.data});

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
                  Text(data.nama,
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                  Text(
                    data.jenisKelamin,
                    style: TextStyle(
                        fontSize: 15, color: Color(0xFF8C8C8C), fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ],
          ),
          SvgPicture.asset(IconAssets.delete, color: Colors.red, height: 30)
        ],
      ),
    );
  }
}
