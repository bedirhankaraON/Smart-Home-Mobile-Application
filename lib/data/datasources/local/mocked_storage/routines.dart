import 'package:smartix/data/datasources/local/mocked_storage/hive_helper.dart';
import 'package:smartix/data/models/routines.dart';

List<dynamic> routinesList = HiveHelper.shared.getValue('routinesList') ?? [];

List<Routines> initialRoutinesForTest = [
  Routines(
    id: 0,
    deviceId: 2,
    name: 'Movie Preset',
    shortDescription: 'Movie',
    status: 'Active',
    days: ['Mon', 'Fri'],
    hour: DateTime(2022, 8, 1, 20, 30),
    event: 'Open Netflix',
  ),
  Routines(
    id: 1,
    deviceId: 1,
    name: 'Relax Preset',
    shortDescription: 'Relax',
    status: 'Active',
    days: ['Tue', 'Sat'],
    hour: DateTime(2022, 8, 1, 12, 30),
    event: 'Open Netflix',
  ),
  Routines(
    id: 2,
    deviceId: 4,
    name: 'Feed Preset',
    shortDescription: 'Feed',
    status: 'Active',
    days: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
    hour: DateTime(2022, 8, 1, 12),
    event: 'Feed the pet',
  ),
  Routines(
    id: 3,
    deviceId: 3,
    name: 'Party Preset',
    shortDescription: 'Party',
    status: 'Active',
    days: ['Sun', 'Sat'],
    hour: DateTime(2022, 8, 1, 22, 30),
    event: 'Play music',
  ),
  Routines(
    id: 4,
    deviceId: 0,
    name: 'Cold Preset',
    shortDescription: 'Cold',
    status: 'Active',
    days: ['Mon', 'Fri'],
    hour: DateTime(2022, 8, 1, 20, 30),
    event: 'Open the Air Conditioner and set it to 19°C',
  ),
];
