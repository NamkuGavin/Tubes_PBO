import 'package:flutter/material.dart';

import 'app/modules/roles/views/role_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TUBES PBO',
      home: RoleView(),
    );
  }
}
