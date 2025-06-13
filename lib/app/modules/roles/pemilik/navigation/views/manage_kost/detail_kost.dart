import 'package:flutter/material.dart';
import 'package:tubes_pbo/app/modules/roles/pemilik/navigation/navigation.dart';
import 'package:tubes_pbo/app/modules/roles/pemilik/navigation/views/manage_kost/kamar_kost.dart';

import '../../../../../../common/constant/color_value.dart';
import '../../../../../../common/constant/navigate.dart';
import '../../../../../../model/api/kost_model.dart';
import '../../../../../../model/dummy/kost_model.dart';
import '../../../../../../network/configuration/api_service.dart';
import 'part_of_detail_kost/body_detail.dart';
import 'part_of_detail_kost/header_detail.dart';
import 'part_of_detail_kost/riwayat_detail.dart';

class DetailKostPenghuni extends StatefulWidget {
  final DataKost data;
  const DetailKostPenghuni({super.key, required this.data});

  @override
  State<DetailKostPenghuni> createState() => _DetailKostPenghuniState();
}

class _DetailKostPenghuniState extends State<DetailKostPenghuni> {
  bool _isLoad = false;

  Future deleteKost() async {
    setState(() {
      _isLoad = true;
    });
    var response = await ApiService().deleteKost(idKos: widget.data.id.toString());
    setState(() {
      _isLoad = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.neutral500,
      appBar: AppBar(backgroundColor: Colors.transparent, title: Text("Detail ${widget.data.namaKos}", style: TextStyle(fontWeight: FontWeight.w600))),
      body: SafeArea(
        child: _isLoad
            ? Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Column(
                  children: [
                    HeaderDetail(
                      data: widget.data,
                      onDelete: () async {
                        await deleteKost();
                        Navigate.navigatorPushAndRemove(context, () => BuildPemilikNavigation());
                      },
                    ),
                    BodyDetail(data: widget.data),
                    // RiwayatDetail(data: data),
                    ElevatedButton(
                        // onPressed: () {},
                        onPressed: () => Navigate.navigatorPush(context, () => KamarKost(data: widget.data)),
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
