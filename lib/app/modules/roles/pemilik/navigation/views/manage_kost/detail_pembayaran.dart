import 'package:flutter/material.dart';
import 'package:tubes_pbo/app/model/dummy/kost_model.dart';
import 'package:tubes_pbo/app/modules/roles/pemilik/navigation/views/manage_kost/part_of_detail_transaksi/header_detail_transaksi_penghuni.dart';

import '../../../../../../common/constant/color_value.dart';
import '../../../../../../model/api/kost_model.dart';
import '../../../../../../model/api/penghuni_model.dart';
import 'part_of_detail_transaksi/body_detail_transaksi_penghuni.dart';
import 'part_of_detail_transaksi/riwayat_detail_transaksi_penghuni.dart';

class DetailPembayaran extends StatelessWidget {
  final DataKost dataKost;
  final RiwayatPembayaran dataPembayaran;
  final List<DataTransaksi> dataTransaksi;
  const DetailPembayaran({super.key, required this.dataKost, required this.dataPembayaran, required this.dataTransaksi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.neutral500,
      appBar: AppBar(backgroundColor: Colors.transparent, title: Text("Detail Pembayaran", style: TextStyle(fontWeight: FontWeight.w600))),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            children: [
              HeaderDetailTransaksiPenghuni(dataPembayaran: dataPembayaran, dataKost: dataKost),
              BodyDetailTransaksiPenghuni(dataPembayaran: dataPembayaran, dataKost: dataKost, dataTransaksi: dataTransaksi),
              RiwayatDetailTransaksiPenghuni(dataTransaksi: dataTransaksi),
            ],
          ),
        ),
      ),
    );
  }
}
