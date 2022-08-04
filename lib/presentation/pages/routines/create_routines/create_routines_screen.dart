// ignore_for_file: avoid_dynamic_calls

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:smartix/core/resources/theme/colors.dart';
import 'package:smartix/data/datasources/local/mocked_storage/devices.dart';
import 'package:smartix/presentation/blocs/routines/routines_bloc.dart';
import 'package:smartix/presentation/widgets/common/background_decoration.dart';
import 'package:smartix/presentation/widgets/common/custom_modal_bottom_sheet.dart';
import 'package:smartix/presentation/widgets/common/textfield.dart';
import 'package:smartix/presentation/widgets/routines/days_widget.dart';

class CreateRoutinesScreen extends StatefulWidget {
  const CreateRoutinesScreen({Key? key, required this.bloc}) : super(key: key);
  final RoutinesBloc bloc;
  @override
  State<CreateRoutinesScreen> createState() => _CreateRoutinesScreenState();
}

class _CreateRoutinesScreenState extends State<CreateRoutinesScreen> {
  final name = TextEditingController();
  final shortDescription = TextEditingController();
  final event = TextEditingController();
  final device = TextEditingController();
  int? deviceId;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RoutinesBloc, RoutinesState>(
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
                            'Add New Routine',
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
                      textEditingController: shortDescription,
                      placeholder: 'Short Description',
                    ),
                    BaseTextField(
                      placeholder: 'Device',
                      readOnly: true,
                      textEditingController: device,
                      onPress: () {
                        showCustomBottomSheet(
                          context: context,
                          title: 'Select a Device',
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: ListView.separated(
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  onTap: () {
                                    device.text = deviceList[index]['name'];
                                    deviceId = deviceList[index]['id'];
                                    Navigator.pop(context);
                                  },
                                  contentPadding: EdgeInsets.zero,
                                  title: Text(
                                    deviceList[index]['name'],
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
                                        deviceList[index]['deviceType']['icon'],
                                        fontFamily: deviceList[index]['deviceType']['fontFamily'],
                                        fontPackage: deviceList[index]['deviceType']['fontFamily'].contains('Cupertino')
                                            ? 'cupertino_icons'
                                            : null,
                                      ),
                                      size: deviceList[index]['deviceType']['iconSize'] ?? 20,
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
                              itemCount: deviceList.length,
                            ),
                          ),
                        );
                      },
                    ),
                    BaseTextField(
                      textEditingController: event,
                      placeholder: 'Event',
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: const [
                        Text(
                          'Repeat:',
                          style: TextStyle(color: ThemeColors.secondary, fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DayWidget(day: 'Mon', bloc: widget.bloc),
                        DayWidget(day: 'Tue', bloc: widget.bloc),
                        DayWidget(day: 'Wed', bloc: widget.bloc),
                        DayWidget(day: 'Thu', bloc: widget.bloc),
                        DayWidget(day: 'Fri', bloc: widget.bloc),
                        DayWidget(day: 'Sat', bloc: widget.bloc),
                        DayWidget(day: 'Sun', bloc: widget.bloc),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        showCustomBottomSheet(
                          context: context,
                          child: CupertinoDatePicker(
                            initialDateTime: state.hour ?? DateTime.now(),
                            mode: CupertinoDatePickerMode.time,
                            onDateTimeChanged: (v) {
                              widget.bloc.changeHour(v);
                            },
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Hour:',
                            style: TextStyle(color: ThemeColors.secondary, fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            height: 50,
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: ThemeColors.secondary),
                            ),
                            child: Center(
                              child: Text(
                                DateFormat.Hm().format(state.hour ?? DateTime.now()),
                                style: const TextStyle(
                                  color: ThemeColors.secondary,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () async {
                        final response =
                            await widget.bloc.saveRoutines(name.text, shortDescription.text, deviceId!, event.text);
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
