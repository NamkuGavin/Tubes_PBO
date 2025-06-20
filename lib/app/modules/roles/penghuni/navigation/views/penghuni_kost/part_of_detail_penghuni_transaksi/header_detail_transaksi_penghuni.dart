import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../common/constant/assets.dart';
import '../../../../../../../common/constant/color_value.dart';
import '../../../../../../../model/api/kost_by_penghuni.dart';

class HeaderDetailTransaksi extends StatelessWidget {
  final RiwayatPembayaran data;
  final KostbyPenghuniModel dataKost;
  const HeaderDetailTransaksi({super.key, required this.data, required this.dataKost});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(IconAssets.kost, color: MyColor.mainBlue, height: 35),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(dataKost.namaKos.toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                  Text(
                    dataKost.tipeKos.toString(),
                    style: TextStyle(fontSize: 15, color: Color(0xFF8C8C8C), fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ],
          ),
          Text(data.status == "Lunas" ? "LUNAS" : "BELUM LUNAS",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: data.status == "Lunas" ? MyColor.mainGreen : MyColor.mainRed)),
        ],
      ),
    );
  }
}
