// ignore_for_file: avoid_dynamic_calls

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartix/core/resources/theme/colors.dart';
import 'package:smartix/data/datasources/local/icon_parser.dart';
import 'package:smartix/data/datasources/local/mocked_storage/devices.dart';
import 'package:smartix/presentation/blocs/routines/routines_bloc.dart';
import 'package:smartix/presentation/pages/dashboard/dashboard_screen.dart';
import 'package:smartix/presentation/pages/routines/routines_detail/routines_detail_modal.dart';

class RoutineWidget extends StatefulWidget {
  const RoutineWidget({Key? key}) : super(key: key);

  @override
  State<RoutineWidget> createState() => _RoutineWidgetState();
}

class _RoutineWidgetState extends State<RoutineWidget> {
  final bloc = dashboardRoutinesBloc;
  @override
  void initState() {
    super.initState();
    bloc.getRoutines();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RoutinesBloc, RoutinesState>(
      bloc: bloc,
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          children: [
            Column(
              children: List.generate(
                state.routinesList?.length ?? 0,
                (index) {
                  final routine = state.routinesList![index];
                  final device = deviceList.firstWhere((element) {
                    return element['id'] == routine.deviceId;
                  });
                  return ListTile(
                    onTap: () {
                      routineDetailModal(context, routine, bloc);
                    },
                    contentPadding: EdgeInsets.zero,
                    leading: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: ThemeColors.secondary),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: ParsedIcon.icon(device, color: ThemeColors.secondary, size: 35),
                    ),
                    title: Row(
                      children: <Widget>[
                        Text(
                          routine.name ?? '',
                          style:
                              const TextStyle(color: ThemeColors.secondary, fontSize: 20, fontWeight: FontWeight.w900),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                    subtitle: Text(
                      routine.status ?? '',
                      style: const TextStyle(color: ThemeColors.secondary, fontSize: 18),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: GestureDetector(
                onTap: () => Navigator.pushNamed(context, 'createNewRoutine', arguments: bloc),
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(12),
                  color: ThemeColors.secondary,
                  strokeWidth: 2,
                  dashPattern: const [9, 3],
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    child: SizedBox(
                      height: 50,
                      width: double.maxFinite,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            IconData(0xf489, fontFamily: 'CupertinoIcons', fontPackage: 'cupertino_icons'),
                            color: ThemeColors.secondary,
                          ),
                          Text(
                            'Add New Routine',
                            style: TextStyle(color: ThemeColors.secondary, fontSize: 20, fontWeight: FontWeight.w900),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
