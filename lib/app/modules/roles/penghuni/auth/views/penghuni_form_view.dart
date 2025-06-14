import 'dart:collection';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tubes_pbo/app/common/constant/assets.dart';
import 'package:tubes_pbo/app/modules/roles/penghuni/navigation/navigation_penghuni.dart';
import 'package:tubes_pbo/app/network/configuration/api_service.dart';
import 'package:tubes_pbo/app/widgets/custom_form_field.dart';

import '../../../../../common/constant/color_value.dart';
import '../../../../../common/constant/navigate.dart';
import '../../../../../common/utils/shared_code.dart';
import '../../../../../widgets/custom_text_form_field.dart';

enum Kelamin { lakiLaki, perempuan }

List<String> list = ['Tidak bawa', 'Mobil', 'Motor'];

class PenghuniFormView extends StatefulWidget {
  final String username;
  final String email;
  final String pass;
  const PenghuniFormView({super.key, required this.username, required this.email, required this.pass});

  @override
  State<PenghuniFormView> createState() => _PenghuniFormViewState();
}

typedef MenuEntry = DropdownMenuEntry<String>;

class _PenghuniFormViewState extends State<PenghuniFormView> {
  Kelamin? jenisKelamin = Kelamin.lakiLaki;
  final List<MenuEntry> menuEntries = UnmodifiableListView<MenuEntry>(
    list.map<MenuEntry>((String name) => MenuEntry(value: name, label: name)),
  );
  String dropdownValue = list.first;
  PlatformFile? _ktpImage;
  PlatformFile? _stnkImage;
  bool isLoad = false;

  final _umurController = TextEditingController();
  final _pekerjaanController = TextEditingController();
  final _noHandphone = TextEditingController();
  final _noDarurat = TextEditingController();
  final _noPlat = TextEditingController();

  String getJenisKelaminAsString(Kelamin? kelamin) {
    switch (kelamin) {
      case Kelamin.lakiLaki:
        return "Laki-laki";
      case Kelamin.perempuan:
        return "Perempuan";
      default:
        return "Laki-laki"; // default fallback
    }
  }

  Future registerPenghuni() async {
    setState(() {
      isLoad = true;
    });
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userPenghuni', widget.username);
    var response = await ApiService().registerPenghuni(
        username: widget.username,
        jenisKelamin: getJenisKelaminAsString(jenisKelamin),
        usia: int.parse(_umurController.text),
        pekerjaan: _pekerjaanController.text,
        noHp: _noHandphone.text,
        noDarurat: _noDarurat.text,
        jenisKendaraan: dropdownValue,
        plat: _noPlat.text,
        email: widget.email,
        pass: widget.pass);
    setState(() {
      isLoad = false;
    });
  }

  Future _selectKTP() async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png'],
    );

    if (result != null) {
      setState(() {
        _ktpImage = result.files.first;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: const Text('Tidak ada gambar yang dipilih')),
      );
    }
  }

  Future _selectSTNK() async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png'],
    );

    if (result != null) {
      setState(() {
        _stnkImage = result.files.first;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: const Text('Tidak ada gambar yang dipilih')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.neutral500,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Tambah Data Penghuni"),
      ),
      body: SafeArea(
        child: isLoad
            ? Center(child: CircularProgressIndicator())
            : Padding(
                padding: EdgeInsets.all(12),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Jenis Kelamin"),
                      _pilihKelamin(),
                      SizedBox(height: 12),
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
                        inputType: TextInputType.text,
                        validate: (value) => SharedCode().emptyValidator(value),
                        inputFormat: [],
                      ),
                      // SizedBox(height: 20),
                      // Text("Dokumen persyaratan kost"),
                      // SizedBox(height: 8),
                      // _isiDokumen(),
                      SizedBox(height: 40),
                      ElevatedButton(
                          onPressed: () async {
                            await registerPenghuni();
                            Navigate.navigatorPushAndRemove(context, () => BuildPenghuniNavigation());
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: MyColor.mainBlue,
                              minimumSize: Size(double.infinity, 0),
                              padding: EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8)))),
                          child: Text("Simpan", style: TextStyle(color: Colors.white, fontSize: 15))),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Widget _pilihKelamin() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: ListTile(
            horizontalTitleGap: 1,
            contentPadding: EdgeInsets.zero,
            title: const Text(
              'Laki-laki',
              style: TextStyle(fontSize: 12),
            ),
            leading: Radio<Kelamin>(
              value: Kelamin.lakiLaki,
              groupValue: jenisKelamin,
              onChanged: (Kelamin? value) {
                setState(() {
                  jenisKelamin = value;
                });
              },
            ),
          ),
        ),
        Expanded(
          child: ListTile(
            horizontalTitleGap: 1,
            contentPadding: EdgeInsets.zero,
            title: const Text(
              'Perempuan',
              style: TextStyle(fontSize: 12),
            ),
            leading: Radio<Kelamin>(
              value: Kelamin.perempuan,
              groupValue: jenisKelamin,
              onChanged: (Kelamin? value) {
                setState(() {
                  jenisKelamin = value;
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _isiDokumen() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            _ktpImage != null
                ? InkWell(
                    onTap: _selectKTP,
                    child: Image.file(
                      File(_ktpImage!.path!),
                      height: 100,
                      width: 175,
                    ),
                  )
                : InkWell(
                    onTap: _selectKTP,
                    child: Container(
                      color: Colors.white,
                      child: DottedBorder(
                          color: Colors.grey.shade500,
                          strokeWidth: 1.25,
                          dashPattern: [8, 4],
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                            child: Column(
                              children: [
                                SvgPicture.asset(IconAssets.camera, height: 30),
                                Text("Upload disini"),
                              ],
                            ),
                          )),
                    ),
                  ),
            SizedBox(height: 12),
            Text("Foto KTP"),
          ],
        ),
        Column(
          children: [
            _stnkImage != null
                ? InkWell(
                    onTap: _selectSTNK,
                    child: Image.file(
                      File(_stnkImage!.path!),
                      height: 100,
                      width: 175,
                    ),
                  )
                : InkWell(
                    onTap: _selectSTNK,
                    child: Container(
                      color: Colors.white,
                      child: DottedBorder(
                          color: Colors.grey.shade500,
                          strokeWidth: 1.25,
                          dashPattern: [8, 4],
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                            child: Column(
                              children: [
                                SvgPicture.asset(IconAssets.camera, height: 30),
                                Text("Upload disini"),
                              ],
                            ),
                          )),
                    ),
                  ),
            SizedBox(height: 12),
            Text("Foto STNK"),
          ],
        ),
      ],
    );
  }
}
