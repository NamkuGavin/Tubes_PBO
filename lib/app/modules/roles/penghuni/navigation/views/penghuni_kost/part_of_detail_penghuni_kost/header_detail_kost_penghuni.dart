import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tubes_pbo/app/modules/roles/pemilik/navigation/views/manage_kost/edit_kost.dart';

import '../../../../../../../common/constant/assets.dart';
import '../../../../../../../common/constant/color_value.dart';
import '../../../../../../../model/dummy/kost_model.dart';

class HeaderDetailKostPenghuni extends StatelessWidget {
  final KostModel data;
  const HeaderDetailKostPenghuni({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Row(
        children: [
          SvgPicture.asset(IconAssets.kost, color: MyColor.mainBlue, height: 35),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(data.nama, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
              Text(
                data.jenis,
                style: TextStyle(
                    fontSize: 15, color: Color(0xFF8C8C8C), fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
