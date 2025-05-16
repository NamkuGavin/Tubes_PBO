import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tubes_pbo/app/data/dummy/all_dummy_data.dart';
import 'package:tubes_pbo/app/modules/roles/pemilik/navigation/views/manage_kost/detail_pembayaran.dart';

import '../../../../../../../common/constant/assets.dart';
import '../../../../../../../common/constant/color_value.dart';
import '../../../../../../../model/dummy/penghuni_model.dart';
import '../../../../../../../widgets/custom_item_tile.dart';

class RiwayatDetailPenghuni extends StatelessWidget {
  final PenghuniModel data;
  const RiwayatDetailPenghuni({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final sortedPembayaran = data.riwayatPembayaran.toList()
      ..sort((a, b) => a.isLunas ? 1 : -1);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Riwayat Pembayaran Kost", style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 12),
        ...sortedPembayaran.map((pembayaran) {
          final matchedKost =
              AllDummyData.dataKost.firstWhere((k) => k.id == pembayaran.kostId);
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 4),
            child: GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DetailPembayaran(dataKost: matchedKost, data: pembayaran))),
              child: CustomItemTile(
                icon: SvgPicture.asset(
                  IconAssets.bill,
                  color: Colors.white,
                  height: 20,
                ),
                colorItem: pembayaran.isLunas ? MyColor.mainGreen : MyColor.mainRed,
                name: pembayaran.isLunas ? "LUNAS" : "BELUM LUNAS",
                kost: "",
                currency: pembayaran.currency,
                date: pembayaran.date,
                lunas: pembayaran.isLunas,
              ),
            ),
          );
        }).toList(),
      ],
    );
  }
}
