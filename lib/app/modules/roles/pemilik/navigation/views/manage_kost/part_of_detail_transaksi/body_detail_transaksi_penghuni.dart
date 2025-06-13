import 'package:flutter/material.dart';
import 'package:tubes_pbo/app/common/utils/shared_code.dart';

import '../../../../../../../common/constant/color_value.dart';
import '../../../../../../../model/api/kost_model.dart';
import '../../../../../../../model/api/penghuni_model.dart';
import '../../../../../../../widgets/custom_title_subtitle.dart';

class BodyDetailTransaksiPenghuni extends StatelessWidget {
  final DataKost dataKost;
  final RiwayatPembayaran dataPembayaran;
  final List<DataTransaksi> dataTransaksi;
  const BodyDetailTransaksiPenghuni({super.key, required this.dataPembayaran, required this.dataKost, required this.dataTransaksi});

  @override
  Widget build(BuildContext context) {
    int totalTerbayar = dataTransaksi.fold(0, (sum, trx) => sum + trx.nominal);
    int sisa = dataKost.harga - totalTerbayar;

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
                    title: "Anggaran",
                    subtitle: SharedCode().convertToIdr(dataKost.harga, 0),
                    titleStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                    subtitleStyle: TextStyle(fontSize: 13, color: MyColor.mainBlue, fontWeight: FontWeight.bold)),
                Text(
                  "${dataPembayaran.tanggalAwal} - ${dataPembayaran.tanggalAkhir}",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF8C8C8C)),
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
                    title: "Sisa",
                    subtitle: "- ${SharedCode().convertToIdr(sisa, 0)}",
                    titleStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                    subtitleStyle: TextStyle(fontSize: 13, color: MyColor.mainRed, fontWeight: FontWeight.bold)),
                CustomTitleSubtitle(
                    title: "Terbayar",
                    subtitle: "+ ${SharedCode().convertToIdr(totalTerbayar, 0)}",
                    titleStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                    subtitleStyle: TextStyle(fontSize: 13, color: MyColor.mainGreen, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
