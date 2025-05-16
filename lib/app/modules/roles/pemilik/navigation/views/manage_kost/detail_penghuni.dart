import 'package:flutter/material.dart';
import 'package:tubes_pbo/app/modules/roles/pemilik/navigation/views/manage_kost/part_of_detail_penghuni/body_detaiL_penghuni.dart';

import '../../../../../../common/constant/color_value.dart';
import '../../../../../../model/dummy/penghuni_model.dart';
import 'part_of_detail_penghuni/header_detail_penghuni.dart';
import 'part_of_detail_penghuni/riwayat_detail_penghuni.dart';

class DetailPenghuni extends StatelessWidget {
  final PenghuniModel data;
  const DetailPenghuni({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.neutral500,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text("Detail Penghuni", style: TextStyle(fontWeight: FontWeight.w600))),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                HeaderDetailPenghuni(data: data),
                BodyDetailPenghuni(data: data),
                RiwayatDetailPenghuni(data: data),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
