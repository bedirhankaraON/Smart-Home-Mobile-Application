import 'package:flutter/material.dart';
import 'package:smartix/core/app_core.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(Localizable.getLocale(context, 'error_screen_description'))),
    );
  }
}
