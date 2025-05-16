import 'package:flutter/material.dart';

import '../../../../../../common/constant/color_value.dart';
import '../../../../../../model/dummy/kost_model.dart';
import 'part_of_detail_kost/body_detail.dart';
import 'part_of_detail_kost/header_detail.dart';
import 'part_of_detail_kost/riwayat_detail.dart';

class DetailKost extends StatelessWidget {
  final KostModel data;
  const DetailKost({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.neutral500,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text("Detail Kost ${data.nama}",
              style: TextStyle(fontWeight: FontWeight.w600))),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            children: [
              HeaderDetail(data: data),
              BodyDetail(data: data),
              RiwayatDetail(data: data),
            ],
          ),
        ),
      ),
    );
  }
}
