import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../common/constant/assets.dart';
import '../../../../../../../common/constant/color_value.dart';
import '../../../../../../../model/dummy/kost_model.dart';
import '../../../../../../../model/dummy/penghuni_model.dart';

class HeaderDetailTransaksiPenghuni extends StatelessWidget {
  final RiwayatPembayaran data;
  final KostModel dataKost;
  const HeaderDetailTransaksiPenghuni(
      {super.key, required this.data, required this.dataKost});

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
                  Text(dataKost.nama,
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                  Text(
                    dataKost.jenis,
                    style: TextStyle(
                        fontSize: 15, color: Color(0xFF8C8C8C), fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ],
          ),
          Text(data.isLunas ? "LUNAS" : "BELUM LUNAS",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: data.isLunas ? MyColor.mainGreen : MyColor.mainRed)),
        ],
      ),
    );
  }
}
