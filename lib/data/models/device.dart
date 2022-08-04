import 'package:json_annotation/json_annotation.dart';
import 'package:smartix/data/models/device_type.dart';

part 'device.g.dart';

@JsonSerializable()
class Device {
  Device({this.description, required this.id, this.status, this.deviceModel, this.deviceType, this.name});
  factory Device.fromJson(final Map<String, dynamic> json) {
    return _$DeviceFromJson(json);
  }
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'deviceType')
  DeviceType? deviceType;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'status')
  String? status;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'deviceModel')
  String? deviceModel;

  Map<String, dynamic> toJson() => _$DeviceToJson(this);
}
