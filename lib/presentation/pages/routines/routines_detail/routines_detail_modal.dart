// ignore_for_file: avoid_dynamic_calls

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smartix/core/resources/theme/colors.dart';
import 'package:smartix/data/datasources/local/mocked_storage/devices.dart';
import 'package:smartix/data/datasources/local/mocked_storage/mocked_status.dart';
import 'package:smartix/data/datasources/local/mocked_storage/routines.dart';
import 'package:smartix/data/models/device.dart';
import 'package:smartix/data/models/routines.dart';
import 'package:smartix/presentation/blocs/device/device_bloc.dart';
import 'package:smartix/presentation/blocs/routines/routines_bloc.dart';
import 'package:smartix/presentation/widgets/common/custom_modal_bottom_sheet.dart';

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
                child: Icon(
                  IconData(
                    device['deviceType']['icon'],
                    fontFamily: device['deviceType']['fontFamily'],
                    fontPackage: device['deviceType']['fontFamily'].contains('Cupertino') ? 'cupertino_icons' : null,
                  ),
                  size: device['deviceType']['iconSize'] ?? 50,
                  color: ThemeColors.primary,
                ),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Status',
                style: TextStyle(color: ThemeColors.primary, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                widget.routine.status ?? '',
                style: const TextStyle(
                  color: ThemeColors.primary,
                  fontSize: 17,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Days',
                style: TextStyle(color: ThemeColors.primary, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                widget.routine.days.toString().replaceAll('[', '').replaceAll(']', ''),
                style: const TextStyle(
                  color: ThemeColors.primary,
                  fontSize: 17,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Hour',
                style: TextStyle(color: ThemeColors.primary, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                DateFormat.Hm().format(widget.routine.hour!),
                style: const TextStyle(
                  color: ThemeColors.primary,
                  fontSize: 17,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
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
  }
}

class OnOffSwitch extends StatefulWidget {
  const OnOffSwitch({Key? key, required this.routine, required this.bloc}) : super(key: key);
  final Routines routine;
  final RoutinesBloc bloc;

  @override
  State<OnOffSwitch> createState() => _OnOffSwitchState();
}

class _OnOffSwitchState extends State<OnOffSwitch> {
  bool status = false;

  @override
  void initState() {
    super.initState();
    setCurrent();
  }

  void setCurrent() {
    status = !(widget.routine.status?.contains('Passive') ?? false);
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: status,
      onChanged: (v) {
        if (v) {
          widget.routine.status = 'Active';
        } else {
          widget.routine.status = 'Passive';
        }

        final id = routinesList.indexWhere((element) => element['id'] == widget.routine.id);
        routinesList[id] = widget.routine.toJson();
        widget.bloc.updateRoutinesList(routinesList);
        setState(() {
          status = v;
        });
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
