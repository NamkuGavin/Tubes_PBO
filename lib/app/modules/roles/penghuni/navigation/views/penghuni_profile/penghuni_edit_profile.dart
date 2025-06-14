import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tubes_pbo/app/modules/roles/penghuni/navigation/navigation_penghuni.dart';

import '../../../../../../common/constant/color_value.dart';
import '../../../../../../common/constant/navigate.dart';
import '../../../../../../common/utils/shared_code.dart';
import '../../../../../../model/api/user_model.dart';
import '../../../../../../model/api/user_penghuni_model.dart';
import '../../../../../../network/configuration/api_service.dart';
import '../../../../../../widgets/custom_form_field.dart';
import '../../../../../../widgets/custom_text_form_field.dart';
import '../../../auth/views/penghuni_form_view.dart';

class PenghuniEditProfile extends StatefulWidget {
  final UserPenghuniModel dataUser;
  const PenghuniEditProfile({super.key, required this.dataUser});

  @override
  State<PenghuniEditProfile> createState() => _PenghuniEditProfileState();
}

class _PenghuniEditProfileState extends State<PenghuniEditProfile> {
  TextEditingController nameController = TextEditingController();
  final List<MenuEntry> menuEntries = UnmodifiableListView<MenuEntry>(
    list.map<MenuEntry>((String name) => MenuEntry(value: name, label: name)),
  );
  String dropdownValue = list.first;

  TextEditingController umurController = TextEditingController();
  TextEditingController pekerjaanController = TextEditingController();
  TextEditingController noHandphone = TextEditingController();
  TextEditingController noDarurat = TextEditingController();
  TextEditingController noPlat = TextEditingController();

  bool _isLoad = false;

  Future editProfile() async {
    setState(() {
      _isLoad = true;
    });
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userPenghuni', nameController.text);
    var response = await ApiService().editProfilePenghuni(
        penghuniId: widget.dataUser.id.toString(),
        nama: nameController.text,
        usia: int.parse(umurController.text),
        pekerjaan: pekerjaanController.text,
        nomorHp: noHandphone.text,
        kontakDarurat: noDarurat.text,
        jenisKendaraan: dropdownValue,
        platKendaraan: noPlat.text);
    setState(() {
      _isLoad = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    nameController = TextEditingController(text: widget.dataUser.nama);
    umurController = TextEditingController(text: widget.dataUser.usia.toString());
    pekerjaanController = TextEditingController(text: widget.dataUser.pekerjaan);
    noHandphone = TextEditingController(text: widget.dataUser.nomorHp);
    noDarurat = TextEditingController(text: widget.dataUser.kontakDarurat);
    noPlat = TextEditingController(text: widget.dataUser.platKendaraan);
    dropdownValue = widget.dataUser.jenisKendaraan;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.neutral500,
      appBar: AppBar(backgroundColor: Colors.transparent, title: Text("Edit Profile", style: TextStyle(fontWeight: FontWeight.w600))),
      body: SafeArea(
        child: _isLoad
            ? Center(child: CircularProgressIndicator())
            : Padding(
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
                        controller: umurController,
                        label: "Umur",
                        hintText: "Masukkan Umur",
                        inputType: TextInputType.number,
                        validate: (value) => SharedCode().emptyValidator(value),
                        inputFormat: [],
                      ),
                      SizedBox(height: 20),
                      CustomFormField(
                        controller: pekerjaanController,
                        label: "Pekerjaan",
                        hintText: "Masukkan pekerjaan di bidang",
                        inputType: TextInputType.text,
                        validate: (value) => SharedCode().emptyValidator(value),
                        inputFormat: [],
                      ),
                      SizedBox(height: 20),
                      CustomFormField(
                        controller: noHandphone,
                        label: "No. Handphone",
                        hintText: "Masukkan nomor",
                        inputType: TextInputType.number,
                        validate: (value) => SharedCode().emptyValidator(value),
                        inputFormat: [],
                      ),
                      SizedBox(height: 20),
                      CustomFormField(
                        controller: noDarurat,
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
                        initialSelection: dropdownValue,
                        onSelected: (String? value) {
                          setState(() {
                            dropdownValue = value!;
                          });
                        },
                        dropdownMenuEntries: menuEntries,
                      ),
                      SizedBox(height: 20),
                      CustomFormField(
                        controller: noPlat,
                        label: "No. Plat Kendaraan",
                        hintText: "Masukkan nomor",
                        inputType: TextInputType.number,
                        validate: (value) => SharedCode().emptyValidator(value),
                        inputFormat: [],
                      ),
                      SizedBox(height: 40),
                      ElevatedButton(
                          onPressed: () async {
                            await editProfile();
                            Navigate.navigatorPushAndRemove(context, () => BuildPenghuniNavigation());
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
