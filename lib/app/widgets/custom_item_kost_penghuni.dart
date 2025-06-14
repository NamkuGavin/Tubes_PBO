import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tubes_pbo/app/common/utils/shared_code.dart';
import 'package:tubes_pbo/app/model/dummy/kost_model.dart';

import '../common/constant/assets.dart';
import '../common/constant/color_value.dart';
import '../modules/roles/penghuni/navigation/views/penghuni_kost/detail_penghuni_kost.dart';

class CustomItemKostPenghuni extends StatelessWidget {
  final KostModel dataKost;
  const CustomItemKostPenghuni({super.key, required this.dataKost});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => DetailKost(data: dataKost))),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Color(0xFFBABABA))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 30, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(IconAssets.kost, color: MyColor.mainBlue, height: 40),
                      SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(dataKost.nama,
                              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                          Text(
                            dataKost.jenis,
                            style: TextStyle(
                                fontSize: 13,
                                color: Color(0xFF8C8C8C),
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      )
                    ],
                  ),
                  SvgPicture.asset(IconAssets.arrowRight, height: 30),
                ],
              ),
            ),
            Divider(color: Color(0xFFBABABA), thickness: 1),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 5, 30, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Harga",
                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                      Text(
                        "${SharedCode().convertToIdr(dataKost.harga, 0)} / Tahun",
                        style: TextStyle(
                            fontSize: 13,
                            color: MyColor.mainBlue,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Pembayaran",
                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                      Text(
                        dataKost.dataPembayaran.where((e) => e.isLunas == false).isEmpty
                            ? "SEMUA LUNAS"
                            : "${dataKost.dataPembayaran.where((e) => e.isLunas == false).length} BELUM LUNAS",
                        style: TextStyle(
                            fontSize: 13,
                            color: dataKost.dataPembayaran
                                    .where((e) => e.isLunas == false)
                                    .isEmpty
                                ? MyColor.mainGreen
                                : MyColor.mainRed,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
