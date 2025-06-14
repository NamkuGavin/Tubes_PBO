import 'package:flutter/material.dart';

import '../../../../../../common/utils/shared_code.dart';
import '../../../../../../model/api/user_penghuni_model.dart';

class PenghuniProfileItem extends StatelessWidget {
  final UserPenghuniModel dataUser;
  const PenghuniProfileItem({super.key, required this.dataUser});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.black12,
          radius: 50,
          child: Text(
            SharedCode().getInitials(dataUser.nama),
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
        SizedBox(height: 24),
        Text(dataUser.nama, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20), textAlign: TextAlign.center),
        Text(dataUser.email, style: TextStyle(), textAlign: TextAlign.center),
      ],
    );
  }
}
