// ignore_for_file: avoid_dynamic_calls

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smartix/data/datasources/local/mocked_storage/hive_helper.dart';
import 'package:smartix/data/datasources/local/mocked_storage/routines.dart';
import 'package:smartix/data/models/routines.dart';
import 'package:smartix/presentation/blocs/routines/routines_parser.dart';

part 'routines_event.dart';
part 'routines_state.dart';

class RoutinesBloc extends Bloc<RoutinesEvent, RoutinesState> {
  RoutinesBloc() : super(const RoutinesState.initial()) {
    on<RoutinesEvent>((event, emit) {});
    on<RoutinesFetched>(_onRoutinesFetched);
    on<HourChanged>(_onHourChanged);
    on<DaysChanged>(_onDaysChanged);
  }
  Future<void> _onRoutinesFetched(RoutinesFetched event, Emitter<RoutinesState> emit) async => emit(
        state.copyWith(
          routinesList: event.routinesList,
        ),
      );
  Future<void> _onHourChanged(HourChanged event, Emitter<RoutinesState> emit) async => emit(
        state.copyWith(
          hour: event.hour,
        ),
      );
  Future<void> _onDaysChanged(DaysChanged event, Emitter<RoutinesState> emit) async => emit(
        state.copyWith(
          dayList: event.dayList,
        ),
      );
  Future<bool> saveRoutines(String? name, String? shortDescription, int deviceId, String? event) async {
    final id = (HiveHelper.shared.getValue('lastRoutineId') ?? 5) + 1;
    routinesList.add(
      Routines(
        id: id,
        name: name,
        shortDescription: shortDescription,
        deviceId: deviceId,
        event: event,
        hour: state.hour,
        status: 'Active',
        days: state.dayList ?? [],
      ).toJson(),
    );
    HiveHelper.shared.save(key: 'routinesList', value: routinesList);
    HiveHelper.shared.save(key: 'lastRoutineId', value: id);
    add(RoutinesFetched(RoutinesParser.parse(routinesList)));
    return true;
  }

  Future<void> changeHour(DateTime hour) async {
    add(HourChanged(hour));
  }

  Future<void> changeDays(List<String> dayList) async {
    add(DaysChanged(dayList));
  }

  Future<void> getRoutines() async {
    add(RoutinesFetched(RoutinesParser.parse(routinesList)));
  }

  Future<void> updateRoutinesList(List<dynamic> updatedList) async {
    HiveHelper.shared.save(key: 'routinesList', value: updatedList);
    add(RoutinesFetched(RoutinesParser.parse(routinesList)));
  }
}
