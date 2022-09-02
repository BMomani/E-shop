import 'dart:ui';

import 'package:flutter/material.dart';

class BehaviorManager {
  static final ScrollBehavior _appScrollBehavior = AppScrollBehavior();

  static ScrollBehavior getAppScrollBehavior() {
    return _appScrollBehavior;
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
