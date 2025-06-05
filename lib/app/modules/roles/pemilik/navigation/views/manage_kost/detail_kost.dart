import 'package:flutter/material.dart';
import 'package:tubes_pbo/app/modules/roles/pemilik/navigation/views/manage_kost/kamar_kost.dart';

import '../../../../../../common/constant/color_value.dart';
import '../../../../../../common/constant/navigate.dart';
import '../../../../../../model/dummy/kost_model.dart';
import 'part_of_detail_kost/body_detail.dart';
import 'part_of_detail_kost/header_detail.dart';
import 'part_of_detail_kost/riwayat_detail.dart';

class DetailKostPenghuni extends StatelessWidget {
  final KostPenghuniModel data;
  const DetailKostPenghuni({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.neutral500,
      appBar: AppBar(backgroundColor: Colors.transparent, title: Text("Detail Kost ${data.nama}", style: TextStyle(fontWeight: FontWeight.w600))),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            children: [
              HeaderDetail(data: data),
              BodyDetail(data: data),
              // RiwayatDetail(data: data),
              ElevatedButton(
                  onPressed: () => Navigate.navigatorPush(context, KamarKost(data: data)),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: MyColor.mainBlue,
                      minimumSize: Size(double.infinity, 0),
                      padding: EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8)))),
                  child: Text("Lihat Kamar", style: TextStyle(color: Colors.white, fontSize: 15))),
            ],
          ),
        ),
      ),
    );
  }
}
