import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartix/core/resources/theme/colors.dart';
import 'package:smartix/data/datasources/local/device_types.dart';
import 'package:smartix/data/models/device_type.dart';
import 'package:smartix/presentation/blocs/device/device_bloc.dart';
import 'package:smartix/presentation/widgets/common/background_decoration.dart';
import 'package:smartix/presentation/widgets/common/custom_modal_bottom_sheet.dart';
import 'package:smartix/presentation/widgets/common/textfield.dart';

class CreateNewDeviceScreen extends StatefulWidget {
  const CreateNewDeviceScreen({Key? key, required this.bloc}) : super(key: key);
  final DeviceBloc bloc;
  @override
  State<CreateNewDeviceScreen> createState() => _CreateNewDeviceScreenState();
}

class _CreateNewDeviceScreenState extends State<CreateNewDeviceScreen> {
  final name = TextEditingController();
  final description = TextEditingController();
  final deviceTypeController = TextEditingController();
  final deviceModel = TextEditingController();
  DeviceType? deviceType;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeviceBloc, DeviceState>(
      bloc: widget.bloc,
      listener: (context, state) {},
      builder: (context, state) {
        return DecoratedBox(
          decoration: backgroundDecoration,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Add New Device',
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
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    BaseTextField(
                      textEditingController: name,
                      placeholder: 'Name',
                    ),
                    BaseTextField(
                      textEditingController: description,
                      placeholder: 'Description',
                    ),
                    BaseTextField(
                      placeholder: 'Type',
                      readOnly: true,
                      textEditingController: deviceTypeController,
                      onPress: () {
                        showCustomBottomSheet(
                          context: context,
                          title: 'Select a Type',
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: ListView.separated(
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  onTap: () {
                                    deviceType = deviceTypes[index];
                                    deviceTypeController.text = deviceTypes[index].type;
                                    Navigator.pop(context);
                                  },
                                  contentPadding: EdgeInsets.zero,
                                  title: Text(
                                    deviceTypes[index].type,
                                    style: const TextStyle(
                                      color: ThemeColors.primary,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18,
                                    ),
                                  ),
                                  leading: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: ThemeColors.primary),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Icon(
                                      IconData(
                                        deviceTypes[index].icon,
                                        fontFamily: deviceTypes[index].fontFamily,
                                        fontPackage: deviceTypes[index].fontFamily.contains('Cupertino')
                                            ? 'cupertino_icons'
                                            : null,
                                      ),
                                      size: deviceTypes[index].iconSize ?? 20,
                                      color: ThemeColors.primary,
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const Divider(
                                  color: ThemeColors.primary,
                                );
                              },
                              itemCount: deviceTypes.length,
                            ),
                          ),
                        );
                      },
                    ),
                    BaseTextField(
                      textEditingController: deviceModel,
                      placeholder: 'Device Model',
                    ),
                    GestureDetector(
                      onTap: () async {
                        final response =
                            await widget.bloc.saveDevice(name.text, description.text, deviceType, deviceModel.text);
                        if (response) {
                          Navigator.pop(context);
                        }
                      },
                      child: SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            border: Border.all(color: ThemeColors.secondary, width: 2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Save',
                                style:
                                    TextStyle(color: ThemeColors.secondary, fontSize: 20, fontWeight: FontWeight.w900),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
