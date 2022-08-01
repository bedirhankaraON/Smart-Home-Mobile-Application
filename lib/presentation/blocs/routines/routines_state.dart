part of 'routines_bloc.dart';

class RoutinesState extends Equatable {
  const RoutinesState._({
    this.description,
    this.status,
    this.routinesList,
    this.hour,
    this.dayList,
  });

  const RoutinesState.initial() : this._();

  final String? description;
  final String? status;
  final List<String>? dayList;
  final List<Routines>? routinesList;
  final DateTime? hour;

  RoutinesState copyWith({
    String? description,
    String? status,
    List<Routines>? routinesList,
    DateTime? hour,
    List<String>? dayList,
  }) =>
      RoutinesState._(
        description: description ?? this.description,
        status: status ?? this.status,
        routinesList: routinesList ?? this.routinesList,
        hour: hour ?? this.hour,
        dayList: dayList ?? this.dayList,
      );

  @override
  List<Object?> get props => [description, status, routinesList, hour];
}
