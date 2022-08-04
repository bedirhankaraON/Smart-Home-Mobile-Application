// ignore_for_file: avoid_dynamic_calls

import 'package:flutter/material.dart';
import 'package:smartix/data/datasources/local/mocked_storage/devices.dart';
import 'package:smartix/data/datasources/local/mocked_storage/mocked_status.dart';
import 'package:smartix/data/datasources/local/mocked_storage/routines.dart';
import 'package:smartix/data/models/device.dart';
import 'package:smartix/data/models/routines.dart';

enum SwitchType { routine, device }

class OnOffSwitch extends StatefulWidget {
  const OnOffSwitch({Key? key, this.device, this.routine, required this.bloc, required this.type}) : super(key: key);
  final Routines? routine;
  final Device? device;
  final dynamic bloc;
  final SwitchType type;

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
    status = widget.type == SwitchType.routine
        ? !(widget.routine!.status?.contains('Passive') ?? false)
        : !(widget.device!.status?.contains('Off') ?? false);
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: status,
      onChanged: (v) {
        if (widget.type == SwitchType.routine) {
          if (v) {
            widget.routine!.status = 'Active';
          } else {
            widget.routine!.status = 'Passive';
          }
          final id = routinesList.indexWhere((element) => element['id'] == widget.routine!.id);
          routinesList[id] = widget.routine!.toJson();
          widget.bloc.updateRoutinesList(routinesList);
          setState(() {
            status = v;
          });
        } else {
          if (v) {
            widget.device!.status = mockedStatus(widget.device!.deviceType!.type);
          } else {
            widget.device!.status = 'Turned Off';
          }
          deviceList[widget.device!.id] = widget.device!.toJson();
          widget.bloc.updateDeviceList(deviceList);
          setState(() {
            status = v;
          });
        }
      },
    );
  }
}
