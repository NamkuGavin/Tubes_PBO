import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tubes_pbo/app/common/constant/assets.dart';
import 'package:tubes_pbo/app/common/utils/shared_code.dart';
import 'package:tubes_pbo/app/modules/roles/pemilik/navigation/views/manage_kost/part_of_detail_kost/body_detail.dart';
import 'package:tubes_pbo/app/modules/roles/pemilik/navigation/views/manage_kost/part_of_detail_kost/header_detail.dart';
import 'package:tubes_pbo/app/widgets/custom_title_subtitle.dart';

import '../../../../../../common/constant/color_value.dart';
import '../../../../../../model/dummy/kost_model.dart';
import '../../../../../../widgets/custom_item_tile.dart';

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Penghuni", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("+ Tambah Penghuni",
                      style: TextStyle(fontWeight: FontWeight.bold, color: MyColor.mainBlue))
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: data.dataPenghuni.length,
                  itemBuilder: (context, penghuniIndex) {
                    final penghuni = data.dataPenghuni[penghuniIndex];

                    return ExpansionTile(
                      tilePadding: EdgeInsets.symmetric(horizontal: 10),
                      backgroundColor: Colors.white,
                      title: Text(
                        penghuni.nama,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text("Kamar ${penghuni.noKamar} • ${penghuni.jenisKelamin}"),
                      children: penghuni.riwayatPembayaran.map((pembayaran) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 4),
                          child: CustomItemTile(
                            icon: SvgPicture.asset(
                              IconAssets.bill,
                              color: Colors.white,
                              height: 20,
                            ),
                            colorItem:
                                pembayaran.isLunas ? MyColor.mainGreen : MyColor.mainRed,
                            name: pembayaran.isLunas ? "LUNAS" : "BELUM LUNAS",
                            kost: penghuni.pekerjaan,
                            currency: pembayaran.currency,
                            date: pembayaran.date,
                            lunas: pembayaran.isLunas,
                          ),
                        );
                      }).toList(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
