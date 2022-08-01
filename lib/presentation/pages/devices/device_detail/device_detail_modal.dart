import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:smartix/core/resources/theme/colors.dart';
import 'package:smartix/data/datasources/local/mocked_storage/devices.dart';
import 'package:smartix/data/datasources/local/mocked_storage/mocked_status.dart';
import 'package:smartix/data/models/device.dart';
import 'package:smartix/presentation/blocs/device/device_bloc.dart';
import 'package:smartix/presentation/widgets/common/custom_modal_bottom_sheet.dart';

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
                    fontPackage: widget.device.deviceType!.fontFamily.contains('Cupertino') ? 'cupertino_icons' : null,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Device Status',
                style: TextStyle(color: ThemeColors.primary, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                widget.device.status ?? widget.device.description ?? '',
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
                  deviceList.removeAt(widget.device.id);
                  widget.bloc.updateDeviceList(deviceList);
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
                    device: widget.device,
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
  const OnOffSwitch({Key? key, required this.device, required this.bloc}) : super(key: key);
  final Device device;
  final DeviceBloc bloc;

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
    status = !(widget.device.status?.contains('Off') ?? false);
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: status,
      onChanged: (v) {
        if (v) {
          widget.device.status = mockedStatus(widget.device.deviceType!.type);
        } else {
          widget.device.status = 'Turned Off';
        }

        deviceList[widget.device.id] = widget.device.toJson();
        widget.bloc.updateDeviceList(deviceList);
        setState(() {
          status = v;
        });
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
