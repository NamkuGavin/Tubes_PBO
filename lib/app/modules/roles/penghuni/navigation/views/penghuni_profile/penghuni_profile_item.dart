import 'package:flutter/material.dart';

import '../../../../../../common/utils/shared_code.dart';

class PenghuniProfileItem extends StatelessWidget {
  const PenghuniProfileItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.black12,
          radius: 50,
          child: Text(
            SharedCode().getInitials("Muhammad Gavin Arasyi"),
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
        SizedBox(height: 24),
        Text("Muhammad Gavin Arasyi",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            textAlign: TextAlign.center),
        Text("m.gavin10@gmail.com", style: TextStyle(), textAlign: TextAlign.center),
      ],
    );
  }
}
