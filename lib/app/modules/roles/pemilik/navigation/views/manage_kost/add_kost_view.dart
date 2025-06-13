import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:tubes_pbo/app/common/constant/navigate.dart';
import 'package:tubes_pbo/app/modules/roles/pemilik/navigation/navigation.dart';

import '../../../../../../common/constant/color_value.dart';
import '../../../../../../common/utils/custom_format_currency.dart';
import '../../../../../../common/utils/shared_code.dart';
import '../../../../../../network/configuration/api_service.dart';
import '../../../../../../widgets/custom_form_field.dart';

List<String> list = ['Laki-laki', 'Perempuan', 'Campuran'];

class AddKostView extends StatefulWidget {
  AddKostView({super.key});

  @override
  State<AddKostView> createState() => _AddKostViewState();
}

typedef MenuEntry = DropdownMenuEntry<String>;

class _AddKostViewState extends State<AddKostView> {
  final List<MenuEntry> menuEntries = UnmodifiableListView<MenuEntry>(
    list.map<MenuEntry>((String name) => MenuEntry(value: name, label: name)),
  );
  String dropdownValue = list.first;

  final namaKostController = TextEditingController();
  final jumKamarController = TextEditingController();
  final hargaController = TextEditingController();
  final lokasiController = TextEditingController();
  final deskripsiController = TextEditingController();

  bool _isLoad = false;

  Future createKost() async {
    setState(() {
      _isLoad = true;
    });

    int harga = int.parse(hargaController.text.replaceAll(RegExp(r'[^0-9]'), ''));
    var response = await ApiService().createKost(
      namaKos: namaKostController.text,
      jumlahKamar: int.parse(jumKamarController.text),
      harga: harga,
      alamat: lokasiController.text,
      deskripsi: deskripsiController.text,
      tipeKos: dropdownValue,
    );

    setState(() {
      _isLoad = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.neutral500,
      appBar: AppBar(backgroundColor: Colors.transparent, title: Text("Tambah Kost")),
      body: SafeArea(
        child: _isLoad
            ? Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                      Text("Jenis Kos"),
                      SizedBox(height: 8),
                      DropdownMenu<String>(
                        width: double.infinity,
                        textStyle: TextStyle(fontSize: 15),
                        initialSelection: list.first,
                        onSelected: (String? value) {
                          setState(() {
                            dropdownValue = value!;
                          });
                        },
                        dropdownMenuEntries: menuEntries,
                      ),
                      SizedBox(height: 20),
                      CustomFormField(
                        controller: jumKamarController,
                        label: "Jumlah kamar",
                        hintText: "Masukkan jumlah kamar",
                        inputType: TextInputType.number,
                        validate: (value) => SharedCode().emptyValidator(value),
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
                        controller: lokasiController,
                        label: "Lokasi",
                        hintText: "Masukkan lokasi kost",
                        inputType: TextInputType.streetAddress,
                        validate: (value) => SharedCode().emptyValidator(value),
                        inputFormat: [],
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
                            await createKost();
                            Navigate.navigatorPushAndRemove(context, () => BuildPemilikNavigation());
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: MyColor.mainBlue,
                              minimumSize: Size(double.infinity, 0),
                              padding: EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8)))),
                          child: Text("Tambah", style: TextStyle(color: Colors.white, fontSize: 15))),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
