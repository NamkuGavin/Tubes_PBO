import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tubes_pbo/app/common/constant/assets.dart';
import 'package:tubes_pbo/app/data/dummy/all_dummy_data.dart';
import 'package:tubes_pbo/app/model/dummy/penghuni_model.dart';
import 'package:tubes_pbo/app/widgets/custom_simple_item_tile.dart';

import '../../../../../../common/constant/color_value.dart';
import '../../../../../../widgets/custom_text_form_field.dart';

class CariPenghuni extends StatefulWidget {
  const CariPenghuni({super.key});

  @override
  State<CariPenghuni> createState() => _CariPenghuniState();
}

class _CariPenghuniState extends State<CariPenghuni> {
  final searchController = TextEditingController();

  List<PenghuniModel> filterBySearch = [];

  @override
  void initState() {
    // TODO: implement initState
    filterBySearch = AllDummyData.dataPenghuni;

    searchController.addListener(onSearchChanged);
    super.initState();
  }

  void onSearchChanged() {
    final query = searchController.text.toLowerCase();
    setState(() {
      filterBySearch = AllDummyData.dataPenghuni
          .where((penghuni) => penghuni.id.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.neutral500,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text("Cari Penghuni", style: TextStyle(fontWeight: FontWeight.w600))),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            children: [
              CustomTextFormField(
                borderRadius: 8,
                validator: (value) => null,
                hintText: "Masukkan ID Penghuni",
                controller: searchController,
                maxLines: 1,
                textInputType: TextInputType.text,
                inputFormat: [],
              ),
              SizedBox(height: 20),
              Expanded(
                child: filterBySearch.isEmpty
                    ? Center(child: Text("Data tidak ditemukan"))
                    : ListView.builder(
                        itemCount: filterBySearch.length,
                        itemBuilder: (context, index) {
                          final penghuni = filterBySearch[index];
                          return ItemSearchPenghuni(data: penghuni);
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
