import 'package:flutter/material.dart';
import 'package:smartix/core/resources/theme/colors.dart';
import 'package:smartix/data/models/device.dart';
import 'package:smartix/presentation/blocs/device/device_bloc.dart';
import 'package:smartix/presentation/pages/devices/device_detail/device_detail_modal.dart';

class DashboardStatusRow extends StatelessWidget {
  const DashboardStatusRow({
    Key? key,
    required this.device,
    required this.bloc,
  }) : super(key: key);
  final Device device;
  final DeviceBloc bloc;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        deviceDetailModal(context, device, bloc);
      },
      contentPadding: EdgeInsets.zero,
      leading: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          border: Border.all(color: ThemeColors.secondary),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Icon(
          IconData(
            device.deviceType!.icon,
            fontFamily: device.deviceType!.fontFamily,
            fontPackage: device.deviceType!.fontFamily.contains('Cupertino') ? 'cupertino_icons' : null,
          ),
          size: device.deviceType!.iconSize,
          color: ThemeColors.secondary,
        ),
      ),
      title: Row(
        children: <Widget>[
          Text(
            device.name ?? device.deviceType?.type ?? '',
            style: const TextStyle(color: ThemeColors.secondary, fontSize: 20, fontWeight: FontWeight.w900),
          ),
          const SizedBox(
            width: 5,
          ),
        ],
      ),
      subtitle: Text(
        device.status ?? device.description ?? '',
        style: const TextStyle(color: ThemeColors.secondary, fontSize: 18),
      ),
    );
  }
}
