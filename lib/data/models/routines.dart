import 'package:json_annotation/json_annotation.dart';

part 'routines.g.dart';

@JsonSerializable()
class Routines {
  Routines({
    this.shortDescription,
    required this.id,
    this.status,
    this.days,
    this.hour,
    this.event,
    required this.deviceId,
    this.name,
  });
  factory Routines.fromJson(final Map<String, dynamic> json) {
    return _$RoutinesFromJson(json);
  }
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'deviceId')
  int deviceId;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'status')
  String? status;
  @JsonKey(name: 'shortDescription')
  String? shortDescription;
  @JsonKey(name: 'days')
  List<String>? days;
  @JsonKey(name: 'hour')
  DateTime? hour;
  @JsonKey(name: 'event')
  String? event;

  Map<String, dynamic> toJson() => _$RoutinesToJson(this);
}
