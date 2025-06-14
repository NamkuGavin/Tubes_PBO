import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tubes_pbo/app/common/constant/navigate.dart';
import 'package:tubes_pbo/app/network/configuration/api_service.dart';

import '../../../../../common/constant/assets.dart';
import '../../../../../common/constant/color_value.dart';
import '../../../../../common/utils/shared_code.dart';
import '../../../../../data/dummy/all_dummy_data.dart';
import '../../../../../model/api/kost_by_penghuni.dart';
import '../../../../../widgets/custom_item_tile.dart';
import 'penghuni_kost/detail_penghuni_kost.dart';

class PenghuniHomeView extends StatefulWidget {
  const PenghuniHomeView({super.key});

  @override
  State<PenghuniHomeView> createState() => _PenghuniHomeViewState();
}

class _PenghuniHomeViewState extends State<PenghuniHomeView> {
  KostbyPenghuniModel? data;
  List<RiwayatPembayaran>? riwayatPembayaran;
  bool isLoad = false;
  String username = "NULL";

  Future getData() async {
    setState(() {
      isLoad = true;
    });
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    username = prefs.getString('userPenghuni').toString();
    var response = await ApiService().getDataKostbyPenghuni(username: username);
    setState(() {
      data = response;
      riwayatPembayaran = response.riwayatPembayaran;
      isLoad = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.neutral500,
      body: SafeArea(
          child: isLoad
              ? Center(child: CircularProgressIndicator())
              : Padding(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Hai, $username", style: TextStyle(fontSize: 20)),
                        Text("Informasi pembayaran kos kamu", style: TextStyle(fontSize: 15, color: MyColor.neutral900)),
                        data?.message == "Penghuni terdaftar"
                            ? Column(
                                children: [
                                  SizedBox(height: 15),
                                  GestureDetector(
                                    onTap: () => Navigate.navigatorPush(context, () => DetailKost(data: data!)),
                                    child: Container(
                                      margin: EdgeInsets.symmetric(vertical: 8),
                                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: Color(0xFFBABABA))),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(15, 15, 30, 5),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    SvgPicture.asset(IconAssets.kost, color: MyColor.mainBlue, height: 40),
                                                    SizedBox(width: 12),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text("${data?.namaKos}", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                                                        Text(
                                                          "${data?.tipeKos}",
                                                          style: TextStyle(fontSize: 13, color: Color(0xFF8C8C8C), fontWeight: FontWeight.w600),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                SvgPicture.asset(IconAssets.arrowRight, height: 30),
                                              ],
                                            ),
                                          ),
                                          Divider(color: Color(0xFFBABABA), thickness: 1),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(15, 5, 30, 10),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text("Harga", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                                                    Text(
                                                      "${SharedCode().convertToIdr(data?.harga, 0)} / Tahun",
                                                      style: TextStyle(fontSize: 13, color: MyColor.mainBlue, fontWeight: FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text("Pembayaran", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                                                    Text(
                                                      data!.riwayatPembayaran!.where((e) => e.status == "Belum Lunas").isEmpty
                                                          ? "SEMUA LUNAS"
                                                          : "${data!.riwayatPembayaran!.where((e) => e.status == "Belum Lunas").length} BELUM LUNAS",
                                                      // "BELUM LUNAS",
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          color: data!.riwayatPembayaran!.where((e) => e.status == "Belum Lunas").isEmpty ? MyColor.mainGreen : MyColor.mainRed,
                                                          // color: MyColor.mainRed,
                                                          fontWeight: FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : Container(),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Center(
                              child: SvgPicture.asset(IconAssets.history, color: MyColor.mainBlue, height: 20),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Pembayaran", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                                  Text(data == null ? "Beberapa informasi pembayaran kos kamu" : "Beberapa informasi pembayaran kos ${data?.namaKos}", style: TextStyle(fontSize: 10)),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        riwayatPembayaran == null
                            ? Center(child: Text("BELUM ADA DATA RIWAYAT PEMBAYARAN"))
                            : ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: riwayatPembayaran?.length,
                                itemBuilder: (context, index) {
                                  final data = riwayatPembayaran?[index];
                                  return CustomItemTile(
                                    icon: SvgPicture.asset(
                                      IconAssets.bill,
                                      color: Colors.white,
                                      height: 20,
                                    ),
                                    colorItem: data?.status == "Lunas" ? MyColor.mainGreen : MyColor.mainRed,
                                    name: data!.status,
                                    kost: "",
                                    currency: data.nominalPembayaran,
                                    date: data.tanggalAkhir,
                                    lunas: data.status == "Lunas",
                                  );
                                },
                              )
                      ],
                    ),
                  ),
                )),
    );
  }
}
