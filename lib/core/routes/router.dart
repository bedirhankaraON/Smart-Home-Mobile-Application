import 'package:flutter/material.dart';
import 'package:smartix/presentation/blocs/device/device_bloc.dart';
import 'package:smartix/presentation/blocs/routines/routines_bloc.dart';
import 'package:smartix/presentation/pages/dashboard/dashboard_screen.dart';
import 'package:smartix/presentation/pages/devices/create_device/create_new_device_screen.dart';
import 'package:smartix/presentation/pages/devices/devices_screen.dart';
import 'package:smartix/presentation/pages/error_screen/error_screen.dart';
import 'package:smartix/presentation/pages/menu/menu_screen.dart';
import 'package:smartix/presentation/pages/routines/create_routines/create_routines_screen.dart';
import 'package:smartix/presentation/pages/routines/routines_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case 'dashboard':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const DashboardScreen(),
        );
      case 'menuScreen':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const MenuScreen(),
        );
      case 'devices':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const DevicesScreen(),
        );
      case 'createNewDevice':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => CreateNewDeviceScreen(
            bloc: args! as DeviceBloc,
          ),
        );
      case 'routines':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const RoutinesScreen(),
        );
      case 'createNewRoutine':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => CreateRoutinesScreen(
            bloc: args! as RoutinesBloc,
          ),
        );

      default:
        return MaterialPageRoute(builder: (_) => const ErrorScreen());
    }
  }
}
