import 'package:flutter/material.dart';
import 'package:tubes_pbo/app/common/constant/navigate.dart';
import 'package:tubes_pbo/app/model/dummy/kost_model.dart';
import 'package:tubes_pbo/app/modules/roles/pemilik/navigation/navigation.dart';

import '../../../../../../common/constant/color_value.dart';
import '../../../../../../common/utils/custom_format_currency.dart';
import '../../../../../../common/utils/shared_code.dart';
import '../../../../../../model/api/kost_model.dart';
import '../../../../../../network/configuration/api_service.dart';
import '../../../../../../widgets/custom_form_field.dart';

class EditKost extends StatefulWidget {
  final DataKost data;
  const EditKost({super.key, required this.data});

  @override
  State<EditKost> createState() => _EditKostState();
}

class _EditKostState extends State<EditKost> {
  TextEditingController namaKostController = TextEditingController();
  TextEditingController hargaController = TextEditingController();
  TextEditingController deskripsiController = TextEditingController();
  bool _isLoad = false;

  Future editKost() async {
    setState(() {
      _isLoad = true;
    });
    int harga = int.parse(hargaController.text.replaceAll(RegExp(r'[^0-9]'), ''));
    var response = await ApiService().editKost(idKos: widget.data.id.toString(), namaKos: namaKostController.text, harga: harga, deskripsi: deskripsiController.text);
    setState(() {
      _isLoad = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    namaKostController = TextEditingController(text: widget.data.namaKos);
    hargaController = TextEditingController(text: widget.data.harga.toString());
    deskripsiController = TextEditingController(text: widget.data.deskripsi);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.neutral500,
      appBar: AppBar(backgroundColor: Colors.transparent, title: Text("Edit Kost")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          child: _isLoad
              ? Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomFormField(
                        controller: namaKostController,
                        label: "Nama kost",
                        hintText: "Masukkan nama kost",
                        inputType: TextInputType.name,
                        validate: (value) => SharedCode().nameValidator(value),
                        inputFormat: [],
                      ),
                      SizedBox(height: 20),
                      CustomFormField(
                        controller: hargaController,
                        label: "Harga",
                        hintText: "Rp. / Tahun",
                        inputType: TextInputType.number,
                        inputFormat: [CustomCurrencyFormatter()],
                        validate: (value) => SharedCode().emptyValidator(value),
                      ),
                      SizedBox(height: 20),
                      CustomFormField(
                        controller: deskripsiController,
                        label: "Deskripsi",
                        hintText: "Deskripsi singkat",
                        inputType: TextInputType.multiline,
                        maxLines: 6,
                        validate: (value) => SharedCode().emptyValidator(value),
                        inputFormat: [],
                      ),
                      SizedBox(height: 30),
                      ElevatedButton(
                          onPressed: () async {
                            await editKost();
                            Navigate.navigatorReplacement(context, () => BuildPemilikNavigation());
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: MyColor.mainBlue,
                              minimumSize: Size(double.infinity, 0),
                              padding: EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8)))),
                          child: Text("Edit", style: TextStyle(color: Colors.white, fontSize: 15))),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
