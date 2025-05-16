import 'package:flutter/material.dart';
import 'package:tubes_pbo/app/model/dummy/kost_model.dart';
import 'package:tubes_pbo/app/modules/roles/pemilik/navigation/views/manage_kost/part_of_detail_transaksi/header_detail_transaksi_penghuni.dart';

import '../../../../../../common/constant/color_value.dart';
import '../../../../../../model/dummy/penghuni_model.dart';
import 'part_of_detail_transaksi/body_detail_transaksi_penghuni.dart';
import 'part_of_detail_transaksi/riwayat_detail_transaksi_penghuni.dart';

class DetailPembayaran extends StatelessWidget {
  final RiwayatPembayaran data;
  final KostModel dataKost;
  const DetailPembayaran({super.key, required this.dataKost, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.neutral500,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text("Detail Pembayaran", style: TextStyle(fontWeight: FontWeight.w600))),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            children: [
              HeaderDetailTransaksiPenghuni(data: data, dataKost: dataKost),
              BodyDetailTransaksiPenghuni(data: data, dataKost: dataKost),
              RiwayatDetailTransaksiPenghuni(data: data, dataKost: dataKost),
            ],
          ),
        ),
      ),
    );
  }
}
