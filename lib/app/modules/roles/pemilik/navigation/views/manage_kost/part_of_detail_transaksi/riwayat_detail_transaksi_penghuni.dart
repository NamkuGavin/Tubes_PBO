import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../common/constant/assets.dart';
import '../../../../../../../common/constant/color_value.dart';
import '../../../../../../../common/utils/shared_code.dart';
import '../../../../../../../model/api/kost_model.dart';
import '../../../../../../../model/api/penghuni_model.dart';
import '../../../../../../../widgets/custom_item_tile.dart';

class RiwayatDetailTransaksiPenghuni extends StatelessWidget {
  final List<DataTransaksi> dataTransaksi;
  const RiwayatDetailTransaksiPenghuni({super.key, required this.dataTransaksi});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Pembayaran", style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 12),
        ListView.builder(
          shrinkWrap: true,
          itemCount: dataTransaksi.length,
          itemBuilder: (context, index) {
            final transaksi = dataTransaksi[index];
            return Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: Color(0xFFEFEFEF),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(color: MyColor.mainGreen, borderRadius: BorderRadius.circular(8)),
                    child: SvgPicture.asset(
                      IconAssets.trendUp,
                      color: Colors.white,
                      height: 20,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("+ ${SharedCode().convertToIdr(transaksi.nominal, 0)}", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: MyColor.mainGreen)),
                      Text(
                        transaksi.tanggalPembayaran,
                        style: TextStyle(fontSize: 13, color: Color(0xFF8C8C8C), fontWeight: FontWeight.w600),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
