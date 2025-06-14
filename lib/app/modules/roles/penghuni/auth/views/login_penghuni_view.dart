import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tubes_pbo/app/network/configuration/api_service.dart';

import '../../../../../common/constant/color_value.dart';
import '../../../../../common/constant/navigate.dart';
import '../../../../../common/utils/shared_code.dart';
import '../../../../../widgets/custom_text_form_field.dart';
import '../../../pemilik/navigation/navigation.dart';
import '../../navigation/navigation_penghuni.dart';
import 'register_penghuni_view.dart';

class PenghuniLoginView extends StatefulWidget {
  const PenghuniLoginView({super.key});

  @override
  State<PenghuniLoginView> createState() => _PenghuniLoginViewState();
}

class _PenghuniLoginViewState extends State<PenghuniLoginView> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isNotVisiblePass = true;
  bool isLoad = false;

  Future loginPenghuni() async {
    setState(() {
      isLoad = true;
    });
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // if (prefs.getString('userPenghuni') == null) {
    //   await prefs.setString('userPenghuni', "Gavin");
    // }
    var response = await ApiService().loginPenghuni(email: _emailController.text, password: _passController.text);
    setState(() {
      isLoad = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.neutral500,
      body: SafeArea(
        child: isLoad
            ? Center(child: CircularProgressIndicator())
            : Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Selamat Datang Penghuni",
                            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 3),
                          Text(
                            "Masukkan email dan password untuk masuk",
                            style: TextStyle(fontSize: 12, color: MyColor.neutral900, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 25),
                          CustomTextFormField(
                            borderRadius: 8,
                            validator: (value) => SharedCode().emailValidator(value),
                            hintText: "Masukkan email",
                            controller: _emailController,
                            maxLines: 1,
                            textInputType: TextInputType.emailAddress,
                            inputFormat: [],
                          ),
                          SizedBox(height: 12),
                          CustomTextFormField(
                            obscureText: _isNotVisiblePass,
                            borderRadius: 8,
                            validator: (value) => SharedCode().passwordValidator(value),
                            hintText: "Masukkan password",
                            controller: _passController,
                            maxLines: 1,
                            textInputType: TextInputType.visiblePassword,
                            inputFormat: [],
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isNotVisiblePass = !_isNotVisiblePass;
                                  });
                                },
                                icon: Icon(_isNotVisiblePass ? Icons.visibility_off_rounded : Icons.remove_red_eye_rounded)),
                          ),
                          SizedBox(height: 50),
                          ElevatedButton(
                              onPressed: () async {
                                await loginPenghuni();
                                Navigate.navigatorPush(context, () => BuildPenghuniNavigation());
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: MyColor.mainBlue,
                                  minimumSize: Size(double.infinity, 0),
                                  padding: EdgeInsets.symmetric(vertical: 12),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8)))),
                              child: Text("Masuk", style: TextStyle(color: Colors.white, fontSize: 15))),
                          SizedBox(height: 50),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(text: "Belum punya akun? ", style: TextStyle(fontSize: 12)),
                                TextSpan(
                                  recognizer: TapGestureRecognizer()..onTap = () => Navigate.navigatorPush(context, () => RegisterPenghuniView()),
                                  text: "Daftar",
                                  style: TextStyle(fontSize: 12, color: MyColor.mainBlue),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
