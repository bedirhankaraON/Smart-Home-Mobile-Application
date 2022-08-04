import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartix/core/app_core.dart';
import 'package:smartix/presentation/blocs/device/device_bloc.dart';
import 'package:smartix/presentation/blocs/routines/routines_bloc.dart';
import 'package:smartix/presentation/widgets/common/background_decoration.dart';
import 'package:smartix/presentation/widgets/common/devices_widget.dart';
import 'package:smartix/presentation/widgets/dashboard/routines_row.dart';
import 'package:smartix/presentation/widgets/dashboard/weather_widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

final dashboardDevicesBloc = DeviceBloc();
final dashboardRoutinesBloc = RoutinesBloc();

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: backgroundDecoration,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            DateTime.now().toString().substring(0, 10),
                            style: const TextStyle(color: ThemeColors.secondary),
                          ),
                          const Text(
                            'Welcome!',
                            style: TextStyle(color: ThemeColors.secondary, fontWeight: FontWeight.bold, fontSize: 30),
                          ),
                        ],
                      ),
                      GestureDetector(
                        child: const Icon(
                          CupertinoIcons.bars,
                          color: ThemeColors.secondary,
                          size: 45,
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, 'menuScreen');
                        },
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const WeatherWidget(),
                  const RoutinesRow(),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      children: const [
                        Text(
                          'Devices',
                          style: TextStyle(color: ThemeColors.secondary, fontSize: 24),
                        ),
                      ],
                    ),
                  ),
                  const DevicesWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
