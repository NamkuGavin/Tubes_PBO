import 'package:flutter/material.dart';

import '../../../../../../common/constant/color_value.dart';
import '../../../../../../model/api/kost_by_penghuni.dart';
import 'part_of_detail_penghuni_transaksi/body_detail_transaksi_penghuni.dart';
import 'part_of_detail_penghuni_transaksi/header_detail_transaksi_penghuni.dart';
import 'part_of_detail_penghuni_transaksi/riwayat_detail_transaksi_penghuni.dart';

class DetailTransaksi extends StatelessWidget {
  final RiwayatPembayaran data;
  final KostbyPenghuniModel dataKost;
  const DetailTransaksi({super.key, required this.dataKost, required this.data});

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
              HeaderDetailTransaksi(data: data, dataKost: dataKost),
              BodyDetailTransaksi(data: data, dataKost: dataKost),
              RiwayatDetailTransaksi(dataKost: dataKost),
            ],
          ),
        ),
      ),
    );
  }
}
