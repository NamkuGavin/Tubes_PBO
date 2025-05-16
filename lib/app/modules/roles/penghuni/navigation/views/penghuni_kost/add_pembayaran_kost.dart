import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../common/constant/color_value.dart';
import '../../../../../../common/utils/custom_format_currency.dart';
import '../../../../../../common/utils/shared_code.dart';
import '../../../../../../widgets/custom_form_field.dart';

class AddPembayaranKost extends StatefulWidget {
  AddPembayaranKost({super.key});

  @override
  State<AddPembayaranKost> createState() => _AddPembayaranKostState();
}

class _AddPembayaranKostState extends State<AddPembayaranKost> {
  final hargaController = TextEditingController();
  final dateController = TextEditingController();

  Future _selectDate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now());

    if (picked != null) {
      dateController.text = DateFormat('d MMM yyyy').format(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.neutral500,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text("Tambah Pembayaran", style: TextStyle(fontWeight: FontWeight.w600))),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomFormField(
                controller: hargaController,
                label: "Harga",
                hintText: "Rp. ",
                inputType: TextInputType.number,
                inputFormat: [CustomCurrencyFormatter()],
                validate: (value) => SharedCode().emptyValidator(value),
              ),
              SizedBox(height: 12),
              Text("Tanggal"),
              SizedBox(height: 8),
              InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () async {
                    await _selectDate();
                  },
                  child: IgnorePointer(
                      child: _textForm(
                          hint: "Masukkan tanggal",
                          controller: dateController,
                          withIcon: true,
                          validator: (value) => SharedCode().emptyValidator(value)))),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: MyColor.mainBlue,
                      minimumSize: Size(double.infinity, 0),
                      padding: EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)))),
                  child:
                      Text("Tambah", style: TextStyle(color: Colors.white, fontSize: 15))),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textForm({
    required String hint,
    required TextEditingController controller,
    TextInputType textInputType = TextInputType.text,
    String? Function(String?)? validator,
    int? maxLength,
    bool withIcon = false,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: TextStyle(fontSize: 12),
      maxLength: maxLength,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.black45),
            borderRadius: BorderRadius.circular(8)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.black45),
            borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Color(0xFF5EC57E)),
            borderRadius: BorderRadius.circular(8)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.redAccent),
            borderRadius: BorderRadius.circular(8)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.redAccent),
            borderRadius: BorderRadius.circular(8)),
        hintText: hint,
        hintStyle: TextStyle(fontWeight: FontWeight.w600, color: Colors.black26),
        prefixIcon:
            withIcon ? Icon(Icons.date_range_outlined, color: Color(0xFF5EC57E)) : null,
        contentPadding: EdgeInsets.symmetric(vertical: 17, horizontal: 16),
      ),
    );
  }
}
