import 'package:flutter/material.dart';
import 'package:tubes_pbo/app/model/dummy/kost_model.dart';

import '../../../../../../../common/constant/color_value.dart';
import '../../../../../../../common/utils/shared_code.dart';
import '../../../../../../../model/api/kost_model.dart';
import '../../../../../../../widgets/custom_title_subtitle.dart';

class BodyDetail extends StatelessWidget {
  final DataKost data;
  const BodyDetail({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final kamarTerisi = data.dataKamar.where((kamar) => kamar.status == 'Terisi').length;
    final sisaKamar = data.dataKamar.where((kamar) => kamar.status == 'Kosong').length;

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 30),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: Color(0xFFBABABA))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 30, 5),
            child: CustomTitleSubtitle(
                title: "Harga",
                subtitle: "${SharedCode().convertToIdr(data.harga, 0)} / tahun",
                titleStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                subtitleStyle: TextStyle(fontSize: 13, color: MyColor.mainBlue, fontWeight: FontWeight.bold)),
          ),
          Divider(color: Color(0xFFBABABA), thickness: 1),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 5, 30, 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTitleSubtitle(
                    title: "Penghuni Aktif",
                    subtitle: "$kamarTerisi Orang",
                    titleStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                    subtitleStyle: TextStyle(fontSize: 13, color: MyColor.mainBlue, fontWeight: FontWeight.bold)),
                CustomTitleSubtitle(
                    title: "Sisa kamar",
                    subtitle: "$sisaKamar Kamar",
                    titleStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                    subtitleStyle: TextStyle(fontSize: 13, color: MyColor.mainBlue, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Divider(color: Color(0xFFBABABA), thickness: 1),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 5, 30, 5),
            child: CustomTitleSubtitle(
                title: "Lokasi",
                subtitle: data.alamat,
                titleStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                subtitleStyle: TextStyle(fontSize: 13, color: Color(0xFF8B8B8B))),
          ),
          Divider(color: Color(0xFFBABABA), thickness: 1),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 5, 30, 15),
            child: CustomTitleSubtitle(
                title: "Deskripsi",
                subtitle: data.deskripsi,
                titleStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                subtitleStyle: TextStyle(fontSize: 13, color: Color(0xFF8B8B8B))),
          ),
        ],
      ),
    );
  }
}
