import 'package:flutter/material.dart';
import 'package:smartix/core/resources/localization/localization.dart';

class Localizable {
  Localizable._();

  static String getLocale(BuildContext context, String? key) {
    return Localization.of(context)!.translate(key) ?? '';
  }
}
