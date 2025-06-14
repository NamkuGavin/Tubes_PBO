import 'package:flutter/material.dart';

import '../../../../../../common/constant/color_value.dart';
import '../../../../../../model/api/kost_by_penghuni.dart';
import 'part_of_detail_penghuni_kost/body_detail_kost_penghuni.dart';
import 'part_of_detail_penghuni_kost/header_detail_kost_penghuni.dart';
import 'part_of_detail_penghuni_kost/riwayat_detail_kost_penghuni.dart';

class DetailKost extends StatelessWidget {
  final KostbyPenghuniModel data;
  const DetailKost({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.neutral500,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text("Detail Kost ${data.namaKos}",
              style: TextStyle(fontWeight: FontWeight.w600))),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderDetailKostPenghuni(data: data),
              BodyDetailKostPenghuni(data: data),
              // RiwayatDetailKostPenghuni(data: data),
            ],
          ),
        ),
      ),
    );
  }
}
