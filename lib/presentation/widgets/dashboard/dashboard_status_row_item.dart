import 'package:flutter/material.dart';
import 'package:smartix/core/resources/theme/colors.dart';

class RoutinesRowItem extends StatelessWidget {
  const RoutinesRowItem({Key? key, required this.icon, this.iconSize, required this.name}) : super(key: key);
  final Icon icon;
  final String name;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24),
      child: Column(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              border: Border.all(color: ThemeColors.secondary),
              borderRadius: BorderRadius.circular(25),
            ),
            child: icon,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              name,
              style: const TextStyle(color: ThemeColors.secondary, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
