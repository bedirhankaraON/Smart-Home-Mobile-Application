import 'package:flutter/material.dart';
import 'package:smartix/core/resources/theme/colors.dart';

Future showCustomBottomSheet({
  required BuildContext context,
  required Widget child,
  String title = '',
}) {
  return showModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
    ),
    backgroundColor: ThemeColors.secondary,
    enableDrag: true,
    isScrollControlled: true,
    context: context,
    builder: (BuildContext bc) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.6,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(height: 12),
            const _BottomSheetPull(),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(color: ThemeColors.primary, fontSize: 20),
            ),
            const SizedBox(height: 24),
            Expanded(child: child),
            const SizedBox(height: 32),
          ],
        ),
      );
    },
  );
}

class _BottomSheetPull extends StatelessWidget {
  const _BottomSheetPull({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      width: 50,
      decoration: BoxDecoration(
        color: Colors.grey.shade400,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
