import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tubes_pbo/app/common/constant/assets.dart';
import 'package:tubes_pbo/app/data/dummy/all_dummy_data.dart';
import 'package:tubes_pbo/app/model/dummy/penghuni_model.dart';
import 'package:tubes_pbo/app/widgets/custom_simple_item_tile.dart';

import '../../../../../../common/constant/color_value.dart';
import '../../../../../../common/utils/shared_code.dart';
import '../../../../../../widgets/custom_form_field.dart';
import '../../../../../../widgets/custom_text_form_field.dart';
import '../../../auth/views/penghuni_form_view.dart';

class PenghuniEditProfile extends StatefulWidget {
  const PenghuniEditProfile({super.key});

  @override
  State<PenghuniEditProfile> createState() => _PenghuniEditProfileState();
}

class _PenghuniEditProfileState extends State<PenghuniEditProfile> {
  final nameController = TextEditingController();
  final List<MenuEntry> menuEntries = UnmodifiableListView<MenuEntry>(
    list.map<MenuEntry>((String name) => MenuEntry(value: name, label: name)),
  );
  String dropdownValue = list.first;

  final _umurController = TextEditingController();
  final _pekerjaanController = TextEditingController();
  final _noHandphone = TextEditingController();
  final _noDarurat = TextEditingController();
  final _noPlat = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.neutral500,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text("Edit Profile", style: TextStyle(fontWeight: FontWeight.w600))),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomFormField(
                  controller: nameController,
                  label: "Nama Lengkap",
                  hintText: "Masukkan nama",
                  inputType: TextInputType.name,
                  validate: (value) => SharedCode().nameValidator(value),
                  inputFormat: [],
                ),
                SizedBox(height: 20),
                CustomFormField(
                  controller: _umurController,
                  label: "Umur",
                  hintText: "Masukkan Umur",
                  inputType: TextInputType.number,
                  validate: (value) => SharedCode().emptyValidator(value),
                  inputFormat: [],
                ),
                SizedBox(height: 20),
                CustomFormField(
                  controller: _pekerjaanController,
                  label: "Pekerjaan",
                  hintText: "Masukkan pekerjaan di bidang",
                  inputType: TextInputType.text,
                  validate: (value) => SharedCode().emptyValidator(value),
                  inputFormat: [],
                ),
                SizedBox(height: 20),
                CustomFormField(
                  controller: _noHandphone,
                  label: "No. Handphone",
                  hintText: "Masukkan nomor",
                  inputType: TextInputType.number,
                  validate: (value) => SharedCode().emptyValidator(value),
                  inputFormat: [],
                ),
                SizedBox(height: 20),
                CustomFormField(
                  controller: _noDarurat,
                  label: "No. Darurat",
                  hintText: "Masukkan nomor",
                  inputType: TextInputType.number,
                  validate: (value) => SharedCode().emptyValidator(value),
                  inputFormat: [],
                ),
                SizedBox(height: 20),
                Text("Bawa kendaraan"),
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
                  controller: _noPlat,
                  label: "No. Plat Kendaraan",
                  hintText: "Masukkan nomor",
                  inputType: TextInputType.number,
                  validate: (value) => SharedCode().emptyValidator(value),
                  inputFormat: [],
                ),
                SizedBox(height: 40),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: MyColor.mainBlue,
                        minimumSize: Size(double.infinity, 0),
                        padding: EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)))),
                    child:
                        Text("Edit", style: TextStyle(color: Colors.white, fontSize: 15))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
