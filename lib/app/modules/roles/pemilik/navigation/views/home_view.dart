import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tubes_pbo/app/common/constant/assets.dart';
import 'package:tubes_pbo/app/data/dummy/all_dummy_data.dart';
import 'package:tubes_pbo/app/widgets/card_info/build_card_info.dart';
import 'package:tubes_pbo/app/widgets/custom_item_tile.dart';

import '../../../../../common/constant/color_value.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final pembayaran = AllDummyData.dataPembayaran;
    final sortedPembayaran = pembayaran.toList()..sort((a, b) => a.isLunas ? 1 : -1);

    return Scaffold(
      backgroundColor: MyColor.neutral500,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hai, Kennata", style: TextStyle(fontSize: 20)),
              Text("Informasi kos kamu",
                  style: TextStyle(fontSize: 15, color: MyColor.neutral900)),
              SizedBox(height: 12),
              BuildCardInfo(),
              SizedBox(height: 15),
              Row(
                children: [
                  Center(
                    child: SvgPicture.asset(IconAssets.history,
                        color: MyColor.mainBlue, height: 20),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Pembayaran",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                        Text("Beberapa informasi pembayaran penghuni kos kamu",
                            style: TextStyle(fontSize: 10)),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: sortedPembayaran.length,
                itemBuilder: (context, index) {
                  final data = sortedPembayaran[index];
                  return CustomItemTile(
                    icon: SvgPicture.asset(
                      IconAssets.bill,
                      color: Colors.white,
                      height: 20,
                    ),
                    colorItem: data.isLunas ? MyColor.mainGreen : MyColor.mainRed,
                    name: data.name,
                    kost: data.kost,
                    currency: data.currency,
                    date: data.date,
                    lunas: data.isLunas,
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
