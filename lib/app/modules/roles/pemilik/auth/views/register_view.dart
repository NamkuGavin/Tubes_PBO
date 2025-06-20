import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tubes_pbo/app/network/configuration/api_service.dart';

import '../../../../../common/constant/color_value.dart';
import '../../../../../common/constant/navigate.dart';
import '../../../../../common/utils/shared_code.dart';
import '../../../../../widgets/custom_text_form_field.dart';
import '../../navigation/navigation.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isNotVisiblePass = true;
  bool _isLoad = false;

  Future register() async {
    setState(() {
      _isLoad = true;
    });
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('namaUser', _usernameController.text);
    var response = await ApiService().registerPemilik(nama: _usernameController.text, email: _emailController.text, password: _passController.text);
    setState(() {
      _isLoad = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.neutral500,
      body: SafeArea(
        child: _isLoad
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
                            "Daftar Akun Pemilik",
                            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 3),
                          Text(
                            "Masukkan form dibawah ini untuk mendaftar",
                            style: TextStyle(fontSize: 12, color: MyColor.neutral900, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 25),
                          CustomTextFormField(
                            borderRadius: 8,
                            validator: (value) => SharedCode().nameValidator(value),
                            hintText: "Masukkan nama lengkap",
                            controller: _usernameController,
                            maxLines: 1,
                            textInputType: TextInputType.name,
                            inputFormat: [],
                          ),
                          SizedBox(height: 12),
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
                                await register();
                                Navigate.navigatorPushAndRemove(context, () => BuildPemilikNavigation());
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: MyColor.mainBlue,
                                  minimumSize: Size(double.infinity, 0),
                                  padding: EdgeInsets.symmetric(vertical: 12),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8)))),
                              child: Text("Daftar", style: TextStyle(color: Colors.white, fontSize: 15))),
                          SizedBox(height: 50),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(text: "Sudah punya akun? ", style: TextStyle(fontSize: 12)),
                                TextSpan(
                                  recognizer: TapGestureRecognizer()..onTap = () => Navigate.navigatorPop(context),
                                  text: "Masuk",
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
