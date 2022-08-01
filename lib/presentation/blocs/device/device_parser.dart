// ignore_for_file: avoid_dynamic_calls

import 'package:smartix/data/models/device.dart';
import 'package:smartix/data/models/device_type.dart';

class DeviceParser {
  static List<Device> parse(List<dynamic> list) {
    if (list.isNotEmpty) {
      final _response = <Device>[];
      for (final element in list) {
        _response.add(
          Device(
            id: element['id'],
            name: element['name'],
            description: element['description'],
            status: element['status'],
            deviceModel: element['deviceModel'],
            deviceType: DeviceType(
              fontFamily: element['deviceType']['fontFamily'],
              iconSize: element['deviceType']['iconSize'],
              icon: element['deviceType']['icon'],
              type: element['deviceType']['type'],
            ),
          ),
        );
      }
      return _response;
    }

    return [];
  }
}
