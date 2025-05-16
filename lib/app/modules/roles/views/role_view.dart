import 'package:flutter/material.dart';
import 'package:tubes_pbo/app/modules/roles/penghuni/auth/views/login_penghuni_view.dart';

import '../../../common/constant/assets.dart';
import '../../../common/constant/color_value.dart';
import '../../../common/constant/navigate.dart';
import '../../../widgets/roles/roles_card.dart';
import '../pemilik/auth/views/login_view.dart';

class RoleView extends StatelessWidget {
  const RoleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.neutral500,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Selamat Datang",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 3),
              Text(
                "Silahkan pilih ingin login sebagai",
                style: TextStyle(
                    fontSize: 15, color: MyColor.neutral900, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 30),
              RolesCard(
                image: ImageAssets.pemilikLogo,
                text: "Pemilik",
                onTap: () => Navigate.navigatorPush(context, PemilikLoginView()),
              ),
              SizedBox(height: 10),
              RolesCard(
                image: ImageAssets.penghuniLogo,
                text: "Penghuni",
                onTap: () => Navigate.navigatorPush(context, PenghuniLoginView()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
