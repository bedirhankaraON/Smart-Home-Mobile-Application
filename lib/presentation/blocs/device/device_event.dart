part of 'device_bloc.dart';

abstract class DeviceEvent extends Equatable {
  const DeviceEvent();

  @override
  List<Object> get props => [];
}

class DeviceFetched extends DeviceEvent {
  const DeviceFetched(this.deviceList);

  final List<Device> deviceList;

  @override
  List<Object> get props => [deviceList];
}
