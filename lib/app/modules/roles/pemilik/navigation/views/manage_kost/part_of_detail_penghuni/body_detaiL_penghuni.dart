import 'package:flutter/material.dart';
import 'package:tubes_pbo/app/common/constant/assets.dart';

import '../../../../../../../common/constant/color_value.dart';
import '../../../../../../../model/api/kost_model.dart';
import '../../../../../../../model/api/penghuni_model.dart';
import '../../../../../../../widgets/custom_title_subtitle.dart';

class BodyDetailPenghuni extends StatelessWidget {
  final PenghuniModel data;
  final DataKamar dataKamar;
  const BodyDetailPenghuni({super.key, required this.data, required this.dataKamar});

  @override
  Widget build(BuildContext context) {
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTitleSubtitle(
                    title: "Umur",
                    subtitle: "${data.dataPenghuni.usia} Tahun",
                    titleStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                    subtitleStyle: TextStyle(fontSize: 13, color: MyColor.mainBlue, fontWeight: FontWeight.bold)),
                SizedBox(
                  width: 100,
                  child: CustomTitleSubtitle(
                      title: "Kamar",
                      subtitle: "Kamar ${dataKamar.noKamar}",
                      titleStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                      subtitleStyle: TextStyle(fontSize: 13, color: MyColor.mainBlue, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          Divider(color: Color(0xFFBABABA), thickness: 1),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 5, 30, 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTitleSubtitle(
                    title: "Pekerjaan",
                    subtitle: data.dataPenghuni.pekerjaan,
                    titleStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                    subtitleStyle: TextStyle(fontSize: 13, color: MyColor.mainBlue, fontWeight: FontWeight.bold)),
                SizedBox(
                  width: 100,
                  child: CustomTitleSubtitle(
                      title: "No. Handphone",
                      subtitle: "${data.dataPenghuni.nomorHp}",
                      titleStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                      subtitleStyle: TextStyle(fontSize: 13, color: MyColor.mainBlue, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          Divider(color: Color(0xFFBABABA), thickness: 1),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 5, 30, 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTitleSubtitle(
                    title: "Kendaraan",
                    subtitle: data.dataPenghuni.jenisKendaraan,
                    titleStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                    subtitleStyle: TextStyle(fontSize: 13, color: MyColor.mainBlue, fontWeight: FontWeight.bold)),
                SizedBox(
                  width: 100,
                  child: CustomTitleSubtitle(
                      title: "No. Plat",
                      subtitle: data.dataPenghuni.platKendaraan,
                      titleStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                      subtitleStyle: TextStyle(fontSize: 13, color: MyColor.mainBlue, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          Divider(color: Color(0xFFBABABA), thickness: 1),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 5, 30, 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTitleSubtitle(
                    title: "No. Darurat",
                    subtitle: "${data.dataPenghuni.kontakDarurat}",
                    titleStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                    subtitleStyle: TextStyle(fontSize: 13, color: MyColor.mainBlue, fontWeight: FontWeight.bold)),
                SizedBox(
                  width: 100,
                  child: CustomTitleSubtitle(
                      title: "ID",
                      subtitle: data.dataPenghuni.id.toString(),
                      titleStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                      subtitleStyle: TextStyle(fontSize: 13, color: MyColor.mainBlue, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          // _buildDokumen(),
        ],
      ),
    );
  }
}

Widget _buildDokumen() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            "Dokumen",
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Image.asset(
                  ImageAssets.ktp,
                  height: 100,
                  width: 175,
                ),
                SizedBox(height: 12),
                Text("Foto KTP"),
              ],
            ),
            Column(
              children: [
                Image.asset(
                  ImageAssets.stnk,
                  height: 100,
                  width: 175,
                ),
                SizedBox(height: 12),
                Text("Foto STNK"),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
