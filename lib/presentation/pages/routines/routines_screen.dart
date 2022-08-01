import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartix/core/resources/theme/colors.dart';
import 'package:smartix/presentation/widgets/common/background_decoration.dart';
import 'package:smartix/presentation/widgets/routines/routine_widget.dart';

class RoutinesScreen extends StatelessWidget {
  const RoutinesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: backgroundDecoration,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Routines',
                          style: TextStyle(color: ThemeColors.secondary, fontSize: 30),
                        ),
                        GestureDetector(
                          child: const Icon(
                            CupertinoIcons.multiply,
                            color: ThemeColors.secondary,
                            size: 45,
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        )
                      ],
                    ),
                  ),
                  const RoutineWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
