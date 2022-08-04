import 'package:flutter/cupertino.dart';
import 'package:smartix/core/resources/theme/colors.dart';

class InfoRow extends StatelessWidget {
  const InfoRow({Key? key, required this.title, required this.info}) : super(key: key);
  final String title;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(color: ThemeColors.primary, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Flexible(
            child: Text(
              info,
              textAlign: TextAlign.end,
              style: const TextStyle(
                color: ThemeColors.primary,
                fontSize: 17,
              ),
            ),
          )
        ],
      ),
    );
  }
}
