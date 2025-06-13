import 'package:flutter/material.dart';

import '../../modules/roles/pemilik/navigation/navigation.dart';

class Navigate {
  static void navigatorPush(BuildContext context, Widget Function() builder) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => builder()));
  }

  static void navigatorReplacement(BuildContext context, Widget Function() builder) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => builder()));
  }

  static void navigatorPushAndRemove(BuildContext context, Widget Function() builder) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => builder()),
      (route) => false,
    );
  }

  static void navigatorPop(BuildContext context) {
    Navigator.pop(context);
  }

  static final navigatorKey = GlobalKey<NavigatorState>();

  static void pushAndRemoveToHome() {
    navigatorKey.currentState?.pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const BuildPemilikNavigation()),
      (route) => false,
    );
  }
}
