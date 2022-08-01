import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:smartix/core/app_core.dart';
import 'package:smartix/presentation/blocs/device/device_bloc.dart';

class AddNewDeviceButton extends StatelessWidget {
  const AddNewDeviceButton({Key? key, required this.bloc}) : super(key: key);
  final DeviceBloc bloc;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, 'createNewDevice', arguments: bloc),
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
                  'Add New Device',
                  style: TextStyle(color: ThemeColors.secondary, fontSize: 20, fontWeight: FontWeight.w900),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
