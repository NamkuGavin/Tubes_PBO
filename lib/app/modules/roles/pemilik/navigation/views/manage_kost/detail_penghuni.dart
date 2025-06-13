import 'package:flutter/material.dart';
import 'package:tubes_pbo/app/common/constant/navigate.dart';
import 'package:tubes_pbo/app/modules/roles/pemilik/navigation/navigation.dart';
import 'package:tubes_pbo/app/modules/roles/pemilik/navigation/views/manage_kost/part_of_detail_penghuni/body_detaiL_penghuni.dart';

import '../../../../../../common/constant/color_value.dart';
import '../../../../../../model/api/kost_model.dart';
import '../../../../../../model/api/penghuni_model.dart';
import '../../../../../../network/configuration/api_service.dart';
import 'part_of_detail_penghuni/header_detail_penghuni.dart';
import 'part_of_detail_penghuni/riwayat_detail_penghuni.dart';

class DetailPenghuni extends StatefulWidget {
  final DataKost dataKost;
  final DataKamar dataKamar;
  const DetailPenghuni({super.key, required this.dataKost, required this.dataKamar});

  @override
  State<DetailPenghuni> createState() => _DetailPenghuniState();
}

class _DetailPenghuniState extends State<DetailPenghuni> {
  PenghuniModel? data;
  bool _isLoad = false;

  Future getPenghuniByKamar() async {
    setState(() {
      _isLoad = true;
    });
    var response = await ApiService().getPenghuniByKamar(kosId: widget.dataKost.id.toString(), noKamar: widget.dataKamar.noKamar.toString());
    setState(() {
      data = response;
      _isLoad = false;
    });
  }

  Future kosonginKamar() async {
    setState(() {
      _isLoad = true;
    });
    var response = await ApiService().kosongKamar(kosId: widget.dataKost.id.toString(), noKamar: widget.dataKamar.noKamar.toString());
    setState(() {
      _isLoad = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getPenghuniByKamar();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.neutral500,
      appBar: AppBar(backgroundColor: Colors.transparent, title: Text("Detail Penghuni", style: TextStyle(fontWeight: FontWeight.w600))),
      body: SafeArea(
        child: _isLoad
            ? Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      HeaderDetailPenghuni(
                          data: data!,
                          onKosongin: () async {
                            await kosonginKamar();
                            Navigate.navigatorPushAndRemove(context, () => BuildPemilikNavigation());
                          }),
                      BodyDetailPenghuni(data: data!, dataKamar: widget.dataKamar),
                      RiwayatDetailPenghuni(data: data!, dataKost: widget.dataKost),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
