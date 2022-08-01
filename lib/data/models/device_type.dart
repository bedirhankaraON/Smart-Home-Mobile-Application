import 'package:json_annotation/json_annotation.dart';

part 'device_type.g.dart';

@JsonSerializable()
class DeviceType {
  DeviceType({this.iconSize,required this.fontFamily, required this.icon, required this.type});
  factory DeviceType.fromJson(final Map<String, dynamic> json) {
    return _$DeviceTypeFromJson(json);
  }
  @JsonKey(name: 'icon')
  final int icon;

  @JsonKey(name: 'fontFamily')
  final String fontFamily;

  @JsonKey(name: 'type')
  final String type;

  @JsonKey(name: 'iconSize')
  final double? iconSize;

  Map<String, dynamic> toJson() => _$DeviceTypeToJson(this);

}
