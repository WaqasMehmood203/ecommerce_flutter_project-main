import 'package:flutter/material.dart';
import 'package:flutterproject/utils/constants/colors.dart';

class AShadowStyle {
  static final vericalProductShadow = BoxShadow(
    // ignore: deprecated_member_use
    color: AColors.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );

  static final horizontalProductShadow = BoxShadow(
    // ignore: deprecated_member_use
    color: AColors.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );
}
