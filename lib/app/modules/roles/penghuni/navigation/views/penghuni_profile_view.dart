import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tubes_pbo/app/modules/roles/pemilik/auth/views/login_view.dart';
import 'package:tubes_pbo/app/modules/roles/pemilik/navigation/views/profile/edit_profile.dart';
import 'package:tubes_pbo/app/modules/roles/penghuni/navigation/views/penghuni_profile/penghuni_edit_profile.dart';
import 'package:tubes_pbo/app/modules/roles/views/role_view.dart';

import '../../../../../common/constant/color_value.dart';
import '../../../../../model/api/user_model.dart';
import '../../../../../model/api/user_penghuni_model.dart';
import '../../../../../network/configuration/api_service.dart';
import '../../../../../widgets/card_info/build_card_info.dart';
import '../../../pemilik/navigation/views/profile/profile_item.dart';
import 'penghuni_profile/penghuni_profile_item.dart';

class PenghuniProfileView extends StatefulWidget {
  const PenghuniProfileView({super.key});

  @override
  State<PenghuniProfileView> createState() => _PenghuniProfileViewState();
}

class _PenghuniProfileViewState extends State<PenghuniProfileView> {
  UserPenghuniModel? data;
  bool _isLoad = false;

  Future getProfilePemilik() async {
    setState(() {
      _isLoad = true;
    });
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var namaUser = prefs.getString('userPenghuni');
    var response = await ApiService().getProfilePenghuni(namaUser: namaUser.toString());
    setState(() {
      data = response;
      _isLoad = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getProfilePemilik();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.neutral500,
      body: SafeArea(
        child: _isLoad
            ? Center(child: CircularProgressIndicator())
            : Padding(
                padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: Column(
                  children: [
                    PenghuniProfileItem(dataUser: data!),
                    SizedBox(height: 16),
                    Divider(color: Colors.black.withOpacity(0.05), thickness: 1),
                    SizedBox(height: 32),
                    _menuProfile(),
                  ],
                ),
              ),
      ),
    );
  }

  Widget _menuProfile() {
    return Expanded(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 28, vertical: 30),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(1),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: Column(
          children: [
            _button(onPress: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PenghuniEditProfile(dataUser: data!))), icon: Icons.person, title: 'Edit Profil'),
            SizedBox(height: 16),
            _button(
                onPress: () => Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => RoleView(),
                      ),
                      (Route<dynamic> route) => false,
                    ),
                icon: Icons.logout,
                title: 'Keluar',
                isLogout: true),
          ],
        ),
      ),
    );
  }

  Widget _button({
    required void Function() onPress,
    required IconData icon,
    required String title,
    bool isLogout = false,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPress,
        borderRadius: BorderRadius.circular(12.5),
        child: Row(
          children: [
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.all(Radius.circular(12.5)),
              ),
              child: Center(child: Icon(icon, color: isLogout ? Colors.red : Colors.black)),
            ),
            SizedBox(width: 15),
            Text(title, style: TextStyle(fontWeight: FontWeight.w600, color: isLogout ? Colors.red : Colors.black)),
            Spacer(),
            Icon(Icons.navigate_next_sharp)
          ],
        ),
      ),
    );
  }
}
