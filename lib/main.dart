import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_testing/pages/counter/counter_page.dart';
import 'package:riverpod_testing/pages/weather/weather_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const WeatherPage(),
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
            settings: routeSettings,
            builder: (context) {
              switch (routeSettings.name) {
                case CounterPage.routeName:
                  return const CounterPage();

                case WeatherPage.routeName:
                  return const WeatherPage();

                default:
                  return const CounterPage();
              }
            });
      },
    );
  }
}
