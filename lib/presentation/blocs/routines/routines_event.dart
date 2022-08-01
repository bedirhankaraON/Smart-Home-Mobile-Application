part of 'routines_bloc.dart';

abstract class RoutinesEvent extends Equatable {
  const RoutinesEvent();

  @override
  List<Object?> get props => [];
}

class RoutinesFetched extends RoutinesEvent {
  const RoutinesFetched(this.routinesList);

  final List<Routines> routinesList;

  @override
  List<Object> get props => [routinesList];
}
class HourChanged extends RoutinesEvent {
  const HourChanged(this.hour);

  final DateTime hour;

  @override
  List<Object> get props => [hour];
}
class DaysChanged extends RoutinesEvent {
  const DaysChanged(this.dayList);

  final List<String> dayList;

  @override
  List<Object> get props => [dayList];
}

class RoutinesStateReseted extends RoutinesEvent {}
