// ignore_for_file: avoid_dynamic_calls

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smartix/data/datasources/local/mocked_storage/devices.dart';
import 'package:smartix/data/datasources/local/mocked_storage/hive_helper.dart';
import 'package:smartix/data/datasources/local/mocked_storage/mocked_status.dart';
import 'package:smartix/data/models/device.dart';
import 'package:smartix/data/models/device_type.dart';
import 'package:smartix/presentation/blocs/device/device_parser.dart';

part 'device_event.dart';
part 'device_state.dart';

class DeviceBloc extends Bloc<DeviceEvent, DeviceState> {
  DeviceBloc() : super(const DeviceState.initial()) {
    on<DeviceEvent>((event, emit) {});
    on<DeviceFetched>(_onDeviceFetched);
  }
  Future<void> _onDeviceFetched(DeviceFetched event, Emitter<DeviceState> emit) async => emit(
        state.copyWith(
          deviceList: event.deviceList,
        ),
      );

  Future<bool> saveDevice(String? name, String? description, DeviceType? deviceType, String? deviceModel) async {
    final id = (HiveHelper.shared.getValue('lastDeviceId') ?? 5) + 1;
    deviceList.add(
      Device(
        id: id,
        name: name,
        description: description,
        deviceType: deviceType,
        deviceModel: deviceModel,
        status: mockedStatus(deviceType!.type),
      ).toJson(),
    );
    HiveHelper.shared.save(key: 'deviceList', value: deviceList);
    HiveHelper.shared.save(key: 'lastDeviceId', value: id);
    add(DeviceFetched(DeviceParser.parse(deviceList)));
    return true;
  }

  Future<void> getDevices() async {
    add(DeviceFetched(DeviceParser.parse(deviceList)));
  }

  Future<void> updateDeviceList(List<dynamic> updatedList) async {
    HiveHelper.shared.save(key: 'deviceList', value: updatedList);
    add(DeviceFetched(DeviceParser.parse(deviceList)));
  }
}
