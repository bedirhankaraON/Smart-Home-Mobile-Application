// ignore_for_file: avoid_dynamic_calls

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartix/core/resources/theme/colors.dart';
import 'package:smartix/data/datasources/local/mocked_storage/devices.dart';
import 'package:smartix/data/datasources/local/mocked_storage/routines.dart';
import 'package:smartix/data/models/device.dart';
import 'package:smartix/presentation/blocs/device/device_bloc.dart';
import 'package:smartix/presentation/widgets/common/custom_modal_bottom_sheet.dart';
import 'package:smartix/presentation/widgets/common/error_info_widget.dart';
import 'package:smartix/presentation/widgets/common/info_row_widget.dart';
import 'package:smartix/presentation/widgets/common/on_off_switch_widget.dart';

class DeviceDetailModal extends StatefulWidget {
  const DeviceDetailModal({Key? key, required this.device, required this.bloc}) : super(key: key);
  final Device device;
  final DeviceBloc bloc;

  @override
  State<DeviceDetailModal> createState() => _DeviceDetailModalState();
}

class _DeviceDetailModalState extends State<DeviceDetailModal> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeviceBloc, DeviceState>(
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
                    child: Icon(
                      IconData(
                        widget.device.deviceType!.icon,
                        fontFamily: widget.device.deviceType!.fontFamily,
                        fontPackage:
                            widget.device.deviceType!.fontFamily.contains('Cupertino') ? 'cupertino_icons' : null,
                      ),
                      size: widget.device.deviceType!.iconSize ?? 50,
                      color: ThemeColors.primary,
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        children: const [
                          Text(
                            'Device Type',
                            textAlign: TextAlign.right,
                            style: TextStyle(color: ThemeColors.primary, fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            widget.device.deviceType?.type ?? '',
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
                title: 'Device Status',
                info: widget.device.status ?? widget.device.description ?? '',
              ),
              if (widget.device.deviceType!.type.contains('Conditioner'))
                AirConditionerSlider(
                  device: widget.device,
                  bloc: widget.bloc,
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
                      'Delete Device',
                      style: TextStyle(color: Colors.red),
                    ),
                    onPressed: () {
                      final deletable =
                          routinesList.where((element) => element['deviceId'] == widget.device.id).toList().isEmpty;
                      if (deletable) {
                        Navigator.pop(context);
                        widget.bloc.updateDeviceList(deviceList);
                        deviceList.removeAt(widget.device.id);
                      } else {
                        Navigator.pop(context);
                        showDialog(
                          context: context,
                          builder: (context) => const ErrorInfoWidget(
                            title: 'Unable to delete',
                            subtitle: 'A routine using this device.',
                          ),
                        );
                      }
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
                        device: widget.device,
                        type: SwitchType.device,
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

class AirConditionerSlider extends StatefulWidget {
  const AirConditionerSlider({Key? key, required this.device, required this.bloc}) : super(key: key);
  final Device device;
  final DeviceBloc bloc;

  @override
  State<AirConditionerSlider> createState() => _AirConditionerSliderState();
}

class _AirConditionerSliderState extends State<AirConditionerSlider> {
  double _currentValue = 20;
  @override
  void initState() {
    super.initState();
    setCurrent();
  }

  void setCurrent() {
    _currentValue = double.tryParse(widget.device.status!.replaceAll(RegExp('[^0-9]'), '')) ?? 18;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Slider(
                value: _currentValue,
                min: 18,
                max: 30,
                divisions: 12,
                onChanged: (v) {
                  widget.device.status = 'Working ${v.round()}°C';
                  deviceList[widget.device.id] = widget.device.toJson();
                  widget.bloc.updateDeviceList(deviceList);
                  setState(() {
                    _currentValue = v;
                  });
                },
              ),
            ),
            Text(
              '$_currentValue °C',
              style: const TextStyle(color: ThemeColors.primary, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        )
      ],
    );
  }
}

Future<dynamic> deviceDetailModal(BuildContext context, Device device, DeviceBloc bloc) {
  return showCustomBottomSheet(
    context: context,
    title: device.name ?? 'Device',
    child: DeviceDetailModal(device: device, bloc: bloc),
  );
}
