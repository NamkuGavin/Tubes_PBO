import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../common/constant/assets.dart';
import '../../../../../../../common/constant/color_value.dart';
import '../../../../../../../model/api/kost_model.dart';
import '../../../../../../../model/api/penghuni_model.dart';

class HeaderDetailTransaksiPenghuni extends StatelessWidget {
  final DataKost dataKost;
  final RiwayatPembayaran dataPembayaran;
  const HeaderDetailTransaksiPenghuni({super.key, required this.dataPembayaran, required this.dataKost});

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
                  Text(dataKost.namaKos, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                  Text(
                    dataKost.tipeKos,
                    style: TextStyle(fontSize: 15, color: Color(0xFF8C8C8C), fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ],
          ),
          Text(dataPembayaran.status == "Belum Lunas" ? "BELUM LUNAS" : "LUNAS",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: dataPembayaran.status == "Belum Lunas" ? MyColor.mainRed : MyColor.mainGreen)),
        ],
      ),
    );
  }
}
