import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartix/core/resources/theme/colors.dart';

class ErrorInfoWidget extends StatelessWidget {
  const ErrorInfoWidget({Key? key, required this.title, required this.subtitle}) : super(key: key);
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: ThemeColors.secondary,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(CupertinoIcons.xmark_octagon,size: 75,color: Colors.red,),
            const SizedBox(height: 20,),
            Text(
              title,
              style: const TextStyle(color: ThemeColors.primary, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5,),
            Text(
              subtitle,
              style: const TextStyle(color: ThemeColors.primary, fontSize: 18, fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}
