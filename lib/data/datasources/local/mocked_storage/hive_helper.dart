import 'package:hive_flutter/hive_flutter.dart';
import 'package:smartix/data/datasources/local/mocked_storage/devices.dart';
import 'package:smartix/data/datasources/local/mocked_storage/routines.dart';

class HiveHelper {
  static HiveHelper shared = HiveHelper();
  static const boxName = 'local_storage';

  Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox(boxName);
    //for dev purposes 
    if (getValue('firstTime') == null) {
      var index = 0;
      while (index < 5) {
        deviceList.add(initialDevicesForTest[index].toJson());
        routinesList.add(initialRoutinesForTest[index].toJson());
        index++;
      }
      save(key: 'deviceList', value: deviceList);
      save(key: 'routinesList', value: routinesList);
      save(key: 'firstTime', value: 'false');
    }
    //end
  }

  void save({required String key, required dynamic value}) {
    Hive.box(boxName).put(key, value);
  }

  dynamic getValue(dynamic value) {
    final box = Hive.box(boxName);
    return box.get(value);
  }

  void delete(String key) {
    Hive.box(boxName).delete(key);
  }
}
