import 'package:flutter/material.dart';
import 'package:tubes_pbo/app/modules/roles/pemilik/auth/views/login_view.dart';
import 'package:tubes_pbo/app/modules/roles/pemilik/navigation/views/profile/edit_profile.dart';

import '../../../../../common/constant/color_value.dart';
import '../../../../../widgets/card_info/build_card_info.dart';
import 'profile/profile_item.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.neutral500,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
          child: Column(
            children: [
              ProfileItem(),
              SizedBox(height: 16),
              Divider(color: Colors.black.withOpacity(0.05), thickness: 1),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: BuildCardInfo(),
              ),
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
            _button(
                onPress: () => Navigator.push(
                    context, MaterialPageRoute(builder: (context) => EditProfile())),
                icon: Icons.person,
                title: 'Edit Profil'),
            SizedBox(height: 16),
            _button(
                onPress: () => Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => PemilikLoginView(),
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
            Text(title,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: isLogout ? Colors.red : Colors.black)),
            Spacer(),
            Icon(Icons.navigate_next_sharp)
          ],
        ),
      ),
    );
  }
}
