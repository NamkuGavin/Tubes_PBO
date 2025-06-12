import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../common/constant/color_value.dart';
import '../../../../../../model/api/kost_model.dart';
import '../../../../../../model/api/penghuni_model.dart';
import '../../../../../../network/configuration/api_service.dart';
import '../../../../../../widgets/custom_simple_item_tile.dart';
import '../../../../../../widgets/custom_text_form_field.dart';

class CariPenghuni extends StatefulWidget {
  final DataKost dataKost;
  final DataKamar dataKamar;
  const CariPenghuni({super.key, required this.dataKost, required this.dataKamar});

  @override
  State<CariPenghuni> createState() => _CariPenghuniState();
}

class _CariPenghuniState extends State<CariPenghuni> {
  final searchController = TextEditingController();

  List<PenghuniModel> filterBySearch = [];
  List<PenghuniModel> dataPenghuni = [];
  bool _isLoad = false;

  Future getPenghuniAll() async {
    setState(() {
      _isLoad = true;
    });
    var response = await ApiService().getPenghuniAll();
    setState(() {
      dataPenghuni = response;
      _isLoad = false;
    });
  }

  Future assignPenghuni(String penghuniId) async {
    setState(() {
      _isLoad = true;
    });
    var response = await ApiService().assignPenghuni(kosId: widget.dataKost.id.toString(), noKamar: widget.dataKamar.noKamar.toString(), penghuniId: penghuniId);
    setState(() {
      _isLoad = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getPenghuniAll();
    searchController.addListener(onSearchChanged);
    super.initState();
  }

  void onSearchChanged() {
    final query = searchController.text.toLowerCase();
    setState(() {
      filterBySearch = dataPenghuni.where((penghuni) {
        final idMatch = penghuni.id.toString().contains(query);
        final namaMatch = penghuni.nama.toLowerCase().contains(query);
        return idMatch || namaMatch;
      }).toList();
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
      appBar: AppBar(backgroundColor: Colors.transparent, title: Text("Cari Penghuni", style: TextStyle(fontWeight: FontWeight.w600))),
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
              _isLoad
                  ? Center(child: CircularProgressIndicator())
                  : dataPenghuni.isEmpty
                      ? Center(child: Text("DATA PENGHUNI KOSONG"))
                      : Expanded(
                          child: searchController.text.isNotEmpty
                              ? (filterBySearch.isEmpty
                                  ? Center(child: Text("Data tidak ditemukan"))
                                  : ListView.builder(
                                      itemCount: filterBySearch.length,
                                      itemBuilder: (context, index) {
                                        final penghuni = filterBySearch[index];
                                        return GestureDetector(
                                            onTap: () async {
                                              await assignPenghuni(penghuni.id.toString());
                                              Navigator.pop(context);
                                            },
                                            child: ItemSearchPenghuni(data: penghuni));
                                      },
                                    ))
                              : ListView.builder(
                                  itemCount: dataPenghuni.length,
                                  itemBuilder: (context, index) {
                                    final penghuni = dataPenghuni[index];
                                    return GestureDetector(
                                        onTap: () async {
                                          await assignPenghuni(penghuni.id.toString());
                                          Navigator.pop(context);
                                        },
                                        child: ItemSearchPenghuni(data: penghuni));
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
