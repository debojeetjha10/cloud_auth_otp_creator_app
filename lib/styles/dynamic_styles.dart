// ignore_for_file: file_names

import 'package:flutter/material.dart';

class DynamicStyles {
  static DynamicSize of(BuildContext context) {
    return DynamicSize(context);
  }
}

class DynamicSize {
  BuildContext context;
  double? screenHeight;
  double? screenWidth;

  DynamicSize(this.context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    dynamic padding = MediaQuery.of(context).padding;
    screenHeight = screenHeight! - (padding.top + padding.bottom);
  }

  double fromHeight(double percentage) {
    return (screenHeight! * percentage) / 100;
  }

  double fromWidth(double percentage) {
    return (screenWidth! * percentage) / 100;
  }
}
