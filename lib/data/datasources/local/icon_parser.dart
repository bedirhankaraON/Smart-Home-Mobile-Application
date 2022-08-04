// ignore_for_file: avoid_dynamic_calls

import 'package:flutter/material.dart';
import 'package:smartix/core/resources/theme/colors.dart';

class ParsedIcon {
  static Icon icon(dynamic device, {Color? color, double? size}) => Icon(
        IconData(
          device['deviceType']['icon'],
          fontFamily: device['deviceType']['fontFamily'],
          fontPackage: device['deviceType']['fontFamily'].contains('Cupertino') ? 'cupertino_icons' : null,
        ),
        size: device['deviceType']['iconSize'] ?? size ?? 50,
        color: color ?? ThemeColors.primary,
      );
}
