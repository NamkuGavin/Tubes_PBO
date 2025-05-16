import 'package:flutter/material.dart';
import 'package:tubes_pbo/app/data/dummy/all_dummy_data.dart';
import 'package:tubes_pbo/app/modules/roles/pemilik/navigation/views/manage_kost/add_kost_view.dart';

import '../../../../../common/constant/color_value.dart';
import '../../../../../widgets/custom_item_kost.dart';

class ManageKostView extends StatelessWidget {
  const ManageKostView({super.key});

  @override
  Widget build(BuildContext context) {
    final kost = AllDummyData.dataKostPenghuni;

    return Scaffold(
      backgroundColor: MyColor.neutral500,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text("Kost Kamu"),
          centerTitle: true,
          automaticallyImplyLeading: false),
      body: SafeArea(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: kost.length,
          itemBuilder: (context, index) {
            final data = kost[index];
            return CustomItemKost(data: data);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: MyColor.mainBlue,
        shape: CircleBorder(),
        onPressed: () =>
            Navigator.push(context, MaterialPageRoute(builder: (context) => AddKostView())),
        child: const Icon(Icons.add, color: Colors.white, size: 35),
      ),
    );
  }
}
