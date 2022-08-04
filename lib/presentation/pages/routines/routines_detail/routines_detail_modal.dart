// ignore_for_file: avoid_dynamic_calls

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:smartix/core/resources/theme/colors.dart';
import 'package:smartix/data/datasources/local/icon_parser.dart';
import 'package:smartix/data/datasources/local/mocked_storage/devices.dart';
import 'package:smartix/data/datasources/local/mocked_storage/routines.dart';
import 'package:smartix/data/models/routines.dart';
import 'package:smartix/presentation/blocs/routines/routines_bloc.dart';
import 'package:smartix/presentation/widgets/common/custom_modal_bottom_sheet.dart';
import 'package:smartix/presentation/widgets/common/info_row_widget.dart';
import 'package:smartix/presentation/widgets/common/on_off_switch_widget.dart';

class RoutinesDetailModal extends StatefulWidget {
  const RoutinesDetailModal({Key? key, required this.routine, required this.bloc}) : super(key: key);
  final Routines routine;
  final RoutinesBloc bloc;

  @override
  State<RoutinesDetailModal> createState() => _RoutinesDetailModalState();
}

class _RoutinesDetailModalState extends State<RoutinesDetailModal> {
  late final device;
  @override
  void initState() {
    super.initState();
    setDevice();
  }

  void setDevice() {
    device = deviceList.firstWhere((element) {
      return element['id'] == widget.routine.deviceId;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RoutinesBloc, RoutinesState>(
      bloc: widget.bloc,
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      border: Border.all(color: ThemeColors.primary),
                      shape: BoxShape.circle,
                    ),
                    child: ParsedIcon.icon(device),
                  ),
                  Column(
                    children: [
                      Row(
                        children: const [
                          Text(
                            'Routine Name',
                            textAlign: TextAlign.right,
                            style: TextStyle(color: ThemeColors.primary, fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            widget.routine.name ?? '',
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                              color: ThemeColors.primary,
                              fontSize: 17,
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              InfoRow(
                title: 'Status',
                info: widget.routine.status ?? '',
              ),
              InfoRow(
                title: 'Days',
                info: widget.routine.days.toString().replaceAll('[', '').replaceAll(']', ''),
              ),
              InfoRow(
                title: 'Hour',
                info: DateFormat.Hm().format(widget.routine.hour!),
              ),
              InfoRow(
                title: 'Event',
                info: widget.routine.event!,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: const Text(
                      'Delete Routine',
                      style: TextStyle(color: Colors.red),
                    ),
                    onPressed: () {
                      routinesList.removeWhere(
                        (element) => element['id'] == widget.routine.id,
                      );
                      widget.bloc.updateRoutinesList(routinesList);
                      Navigator.pop(context);
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        'Off',
                        style: TextStyle(color: ThemeColors.primary, fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      OnOffSwitch(
                        bloc: widget.bloc,
                        routine: widget.routine,
                        type: SwitchType.routine,
                      ),
                      const Text(
                        'On',
                        style: TextStyle(
                          color: ThemeColors.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

Future<dynamic> routineDetailModal(BuildContext context, Routines routine, RoutinesBloc bloc) {
  return showCustomBottomSheet(
    context: context,
    title: routine.shortDescription ?? 'Routine',
    child: RoutinesDetailModal(routine: routine, bloc: bloc),
  );
}
