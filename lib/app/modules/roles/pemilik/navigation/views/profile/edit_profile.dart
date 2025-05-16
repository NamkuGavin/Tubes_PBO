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

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final nameController = TextEditingController();

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
          child: Column(
            children: [
              CustomFormField(
                controller: nameController,
                label: "Nama Lengkap",
                hintText: "Masukkan nama",
                inputType: TextInputType.name,
                validate: (value) => SharedCode().nameValidator(value),
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
                  child: Text("Edit", style: TextStyle(color: Colors.white, fontSize: 15))),
            ],
          ),
        ),
      ),
    );
  }
}
