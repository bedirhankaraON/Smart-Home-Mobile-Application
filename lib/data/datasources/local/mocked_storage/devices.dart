import 'package:smartix/data/datasources/local/mocked_storage/hive_helper.dart';
import 'package:smartix/data/models/device.dart';
import 'package:smartix/data/models/device_type.dart';

List<dynamic> deviceList = HiveHelper.shared.getValue('deviceList') ?? [];

List<Device> initialDevicesForTest = [
  Device(
    id: 0,
    name: 'My Smart Conditioner',
    description: 'Bedroom',
    status: 'Working 19°C',
    deviceType: DeviceType(fontFamily: 'CupertinoIcons', icon: 0xf7e7, type: 'Air Conditioner'),
    deviceModel: 'Daikin',
  ),
  Device(
    id: 1,
    name: 'Lights',
    description: 'Living Room',
    status: 'Dim Light Mode',
    deviceType: DeviceType(fontFamily: 'CupertinoIcons', icon: 0xf6dd, type: 'Smart Bulb'),
    deviceModel: 'Alexa',
  ),
  Device(
    id: 2,
    name: 'Samsung Smart TV',
    description: 'Living Room',
    status: 'Watching Netflix',
    deviceType: DeviceType(fontFamily: 'CupertinoIcons', icon: 0xf881, type: 'Smart TV'),
    deviceModel: 'Samsung',
  ),
  Device(
    id: 3,
    name: 'My Soundbar',
    description: 'Living Room',
    status: 'Playing: Radiohead - Creep',
    deviceType: DeviceType(fontFamily: 'CupertinoIcons', icon: 0xf46c, type: 'Soundbar'),
    deviceModel: 'Sony',
  ),
  Device(
    id: 4,
    name: 'My Pet Feeder',
    description: 'Kitchen',
    status: 'Last fed 1 hour ago',
    deviceType: DeviceType(fontFamily: 'CupertinoIcons', icon: 0xf479, type: 'Smart Pet Feeder'),
    deviceModel: 'Xiaomi',
  ),
];
