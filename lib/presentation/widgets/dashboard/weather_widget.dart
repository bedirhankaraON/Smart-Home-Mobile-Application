import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smartix/core/resources/theme/colors.dart';
import 'package:smartix/presentation/blocs/weather/weather_bloc.dart';

class WeatherWidget extends StatefulWidget {
  const WeatherWidget({Key? key}) : super(key: key);

  @override
  State<WeatherWidget> createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  final bloc = WeatherBloc();
  @override
  void initState() {
    super.initState();
    bloc.getCurrentWeather();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherBloc, WeatherState>(
      bloc: bloc,
      listener: (context, state) {},
      builder: (context, state) {
        if (state.weatherStatus == WeatherStatus.initial) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Shimmer.fromColors(
              baseColor: Colors.grey,
              highlightColor: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                  Column(
                    children: List.generate(
                      3,
                      (index) => Padding(
                        padding: const EdgeInsets.all(3),
                        child: Container(
                          width: 150,
                          height: 20,
                          color: ThemeColors.primary,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }
        return Stack(
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '${state.weather?.temp}°C',
                        style: const TextStyle(color: ThemeColors.secondary, fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${state.weather?.description}',
                        style: const TextStyle(
                          color: ThemeColors.secondary,
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        '${state.weather?.name}, ${state.weather?.country}',
                        style: const TextStyle(
                          color: ThemeColors.secondary,
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Image.network(
              state.weather?.icon ?? 'http://openweathermap.org/img/wn/01d@4x.png',
              height: 85,
              fit: BoxFit.fitHeight,
            ),
          ],
        );
      },
    );
  }
}
