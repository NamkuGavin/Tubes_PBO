import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tubes_pbo/app/modules/roles/penghuni/navigation/views/penghuni_kost/add_pembayaran_kost.dart';

import '../../../../../../../common/constant/assets.dart';
import '../../../../../../../common/constant/color_value.dart';
import '../../../../../../../common/utils/shared_code.dart';
import '../../../../../../../model/dummy/kost_model.dart';
import '../../../../../../../model/dummy/penghuni_model.dart';

class RiwayatDetailTransaksi extends StatelessWidget {
  final RiwayatPembayaran data;
  final KostModel dataKost;
  const RiwayatDetailTransaksi({super.key, required this.data, required this.dataKost});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Riwayat", style: TextStyle(fontWeight: FontWeight.bold)),
            GestureDetector(
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AddPembayaranKost())),
              child: Text("+ Tambah Pembayaran",
                  style: TextStyle(fontWeight: FontWeight.bold, color: MyColor.mainBlue)),
            )
          ],
        ),
        SizedBox(height: 12),
        ListView.builder(
          shrinkWrap: true,
          itemCount: data.riwayatTransaksi.length,
          itemBuilder: (context, index) {
            final dataTransaksi = data.riwayatTransaksi[index];
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
                    decoration: BoxDecoration(
                        color: MyColor.mainGreen, borderRadius: BorderRadius.circular(8)),
                    child: SvgPicture.asset(
                      IconAssets.trendUp,
                      color: Colors.white,
                      height: 20,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("+ ${SharedCode().convertToIdr(dataTransaksi.nominal, 0)}",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: MyColor.mainGreen)),
                      Text(
                        dataTransaksi.tanggal,
                        style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFF8C8C8C),
                            fontWeight: FontWeight.w600),
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
