import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tubes_pbo/app/model/dummy/kost_model.dart';
import 'package:tubes_pbo/app/modules/roles/pemilik/navigation/views/manage_kost/detail_kost.dart';

import '../common/constant/assets.dart';
import '../common/constant/color_value.dart';

class CustomItemKost extends StatelessWidget {
  final KostPenghuniModel data;
  const CustomItemKost({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => DetailKostPenghuni(data: data))),
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
                          Text(data.nama,
                              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                          Text(
                            data.jenis,
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
                      Text("Penghuni aktif",
                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                      Text(
                        "${data.dataPenghuni.length} orang",
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
                      Text("Sisa Kamar",
                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                      Text(
                        "${data.jumKamar - data.dataPenghuni.length} Kamar",
                        style: TextStyle(
                            fontSize: 13,
                            color: MyColor.mainBlue,
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
