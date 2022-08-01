import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:smartix/core/app_core.dart';
import 'package:smartix/core/routes/router.dart';
import 'package:smartix/data/datasources/local/mocked_storage/hive_helper.dart';
import 'package:smartix/presentation/blocs/device/device_bloc.dart';
import 'package:smartix/presentation/blocs/routines/routines_bloc.dart';
import 'package:smartix/presentation/blocs/weather/weather_bloc.dart';
import 'package:smartix/presentation/pages/dashboard/dashboard_screen.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  await HiveHelper().init();
  runApp(App());
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);
  final _navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WeatherBloc>(
          create: (BuildContext context) => WeatherBloc(),
        ),
        BlocProvider<DeviceBloc>(
          create: (BuildContext context) => DeviceBloc(),
        ),
        BlocProvider<RoutinesBloc>(
          create: (BuildContext context) => RoutinesBloc(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: ThemeColors.primary,
        ),
        navigatorKey: _navigatorKey,
        home: const DashboardScreen(),
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
