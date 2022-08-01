part of 'device_bloc.dart';

class DeviceState extends Equatable {
  const DeviceState._({
    this.description,
    this.status,
    this.deviceModel,
    this.deviceType,
    this.name,
    this.deviceList,
  });

  const DeviceState.initial() : this._();

  final String? description;
  final String? status;
  final String? deviceModel;
  final DeviceType? deviceType;
  final String? name;
  final List<Device>? deviceList;

  DeviceState copyWith({
    String? description,
    String? status,
    String? deviceModel,
    DeviceType? deviceType,
    String? name,
    List<Device>? deviceList,
  }) =>
      DeviceState._(
        description: description ?? this.description,
        status: status ?? this.status,
        deviceModel: deviceModel ?? this.deviceModel,
        deviceType: deviceType ?? this.deviceType,
        name: name ?? this.name,
        deviceList: deviceList ?? this.deviceList,
      );

  @override
  List<Object?> get props => [
        description,
        status,
        deviceModel,
        deviceType,
        name,
        deviceList,
      ];
}
