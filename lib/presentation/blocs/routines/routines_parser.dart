// ignore_for_file: avoid_dynamic_calls

import 'package:smartix/data/models/routines.dart';

class RoutinesParser {
  static List<Routines> parse(List<dynamic> list) {
    if (list.isNotEmpty) {
      final _response = <Routines>[];
      for (final element in list) {
        _response.add(
          Routines(
            id: element['id'],
            deviceId: element['deviceId'],
            name: element['name'],
            shortDescription: element['shortDescription'],
            status: element['status'],
            event: element['event'],
            days: element['days'],
            hour: DateTime.parse(element['hour']),
          ),
        );
      }
      return _response;
    }

    return [];
  }
}
