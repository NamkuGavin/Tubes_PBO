import 'package:flutter/material.dart';

import '../../../../../common/constant/color_value.dart';
import '../../../../../data/dummy/all_dummy_data.dart';
import '../../../../../widgets/custom_item_kost_penghuni.dart';

class PenghuniKostView extends StatelessWidget {
  const PenghuniKostView({super.key});

  @override
  Widget build(BuildContext context) {
    final kost = AllDummyData.dataKost;

    return Scaffold(
      backgroundColor: MyColor.neutral500,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text("Kost"),
          centerTitle: true,
          automaticallyImplyLeading: false),
      body: SafeArea(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: kost.length,
          itemBuilder: (context, index) {
            final data = kost[index];
            return CustomItemKostPenghuni(dataKost: data);
          },
        ),
      ),
    );
  }
}
