import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tubes_pbo/app/common/utils/shared_code.dart';
import 'package:tubes_pbo/app/model/dummy/kost_model.dart';
import 'package:tubes_pbo/app/modules/roles/pemilik/navigation/views/manage_kost/cari_penghuni.dart';
import 'package:tubes_pbo/app/modules/roles/pemilik/navigation/views/manage_kost/detail_penghuni.dart';
import 'package:tubes_pbo/app/modules/roles/penghuni/navigation/views/penghuni_kost/detail_transaksi.dart';

import '../../../../../../../common/constant/assets.dart';
import '../../../../../../../common/constant/color_value.dart';
import '../../../../../../../widgets/custom_item_tile.dart';

class RiwayatDetailKostPenghuni extends StatelessWidget {
  final KostModel data;
  const RiwayatDetailKostPenghuni({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Pembayaran", style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: data.dataPembayaran.length,
              itemBuilder: (context, index) {
                final sortingItem = data.dataPembayaran..sort((a, b) => a.isLunas ? 1 : -1);
                final item = sortingItem[index];

                return GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DetailTransaksi(dataKost: data, data: item))),
                  child: Container(
                    padding: EdgeInsets.all(15),
                    margin: EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: Color(0xFFEFEFEF),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.only(right: 12),
                              decoration: BoxDecoration(
                                  color: item.isLunas ? MyColor.mainGreen : MyColor.mainRed,
                                  borderRadius: BorderRadius.circular(8)),
                              child: SvgPicture.asset(
                                IconAssets.bill,
                                color: Colors.white,
                                height: 20,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    item.isLunas
                                        ? SharedCode().convertToIdr(item.currency, 0)
                                        : "- ${SharedCode().convertToIdr(item.currency, 0)}",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: item.isLunas
                                            ? MyColor.mainGreen
                                            : MyColor.mainRed)),
                                Text(
                                  item.date,
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Color(0xFF8C8C8C),
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            )
                          ],
                        ),
                        Icon(Icons.arrow_forward_ios, color: Color(0xFF838383), size: 20),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
