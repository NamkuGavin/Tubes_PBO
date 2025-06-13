import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tubes_pbo/app/data/dummy/all_dummy_data.dart';
import 'package:tubes_pbo/app/modules/roles/pemilik/navigation/views/manage_kost/detail_pembayaran.dart';

import '../../../../../../../common/constant/assets.dart';
import '../../../../../../../common/constant/color_value.dart';
import '../../../../../../../common/constant/navigate.dart';
import '../../../../../../../model/api/kost_model.dart';
import '../../../../../../../model/api/penghuni_model.dart';
import '../../../../../../../widgets/custom_item_tile.dart';

class RiwayatDetailPenghuni extends StatelessWidget {
  final PenghuniModel data;
  final DataKost dataKost;
  const RiwayatDetailPenghuni({super.key, required this.data, required this.dataKost});

  @override
  Widget build(BuildContext context) {
    final sortedPembayaran = data.dataPenghuni.riwayatPembayaran.toList()..sort((a, b) => a.status == "Lunas" ? 1 : -1);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Riwayat Pembayaran Kost", style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 12),
        ...sortedPembayaran.map((pembayaran) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 4),
            child: GestureDetector(
              // onTap: () {},
              onTap: () => Navigate.navigatorPush(context, DetailPembayaran(dataKost: dataKost, dataPembayaran: pembayaran, dataTransaksi: data.dataPenghuni.dataTransaksi)),
              child: CustomItemTile(
                icon: SvgPicture.asset(
                  IconAssets.bill,
                  color: Colors.white,
                  height: 20,
                ),
                colorItem: pembayaran.status == "Lunas" ? MyColor.mainGreen : MyColor.mainRed,
                name: pembayaran.status == "Lunas" ? "LUNAS" : "BELUM LUNAS",
                kost: "",
                currency: pembayaran.nominalPembayaran,
                date: pembayaran.tanggalAwal.toString(),
                lunas: pembayaran.status == "Lunas",
              ),
            ),
          );
        }).toList(),
      ],
    );
  }
}
