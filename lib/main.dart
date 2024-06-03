import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_testing/pages/counter/counter_page.dart';
import 'package:riverpod_testing/pages/film/film_page.dart';
import 'package:riverpod_testing/pages/person/person_page.dart';
import 'package:riverpod_testing/pages/ticker/ticker_page.dart';
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
      home: const FilmPage(),
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
            settings: routeSettings,
            builder: (context) {
              switch (routeSettings.name) {
                case CounterPage.routeName:
                  return const CounterPage();

                case WeatherPage.routeName:
                  return const WeatherPage();

                case TickerPage.routeName:
                  return const TickerPage();

                case PersonPage.routeName:
                  return const PersonPage();

                case FilmPage.routeName:
                  return const FilmPage();

                default:
                  return const CounterPage();
              }
            });
      },
    );
  }
}
