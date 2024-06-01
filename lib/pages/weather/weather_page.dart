import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/**
 * State Provider
 * Future Provider
 */

enum City {
  bago,
  yangon,
  mandalay,
  taungyi,
}

typedef WeatherEmoji = String;

// to read and write
var cityProvider = StateProvider<City?>((ref) => null);

const unknownEmoji = '🚫';

Future<String> getWeather(City city) {
  return Future.delayed(
    const Duration(seconds: 2),
    () =>
        {
          City.bago: '⛄',
          City.yangon: '🌧️',
          City.mandalay: '⛅',
        }[city] ??
        unknownEmoji,
  );
}

// to read only
var weatherProvider = FutureProvider<WeatherEmoji>((ref) {
  var city = ref.watch(cityProvider);
  if (city != null) {
    return getWeather(city);
  } else {
    return unknownEmoji;
  }
});

class WeatherPage extends ConsumerWidget {
  static const routeName = 'weather_page';
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var selectedWeather = ref.watch(weatherProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
      ),
      body: Column(
        children: [
          selectedWeather.when(data: (data) {
            return Text(data);
          }, error: (error, stackTrace) {
            return Text(error.toString());
          }, loading: () {
            return const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(),
            );
          }),
          Expanded(
            child: ListView.builder(
              itemCount: City.values.length,
              itemBuilder: (context, index) {
                var city = City.values[index];
                var isSelected = ref.watch(cityProvider) == city;
                return ListTile(
                  title: Text(
                    city.toString(),
                  ),
                  trailing: isSelected ? const Icon(Icons.check) : null,
                  onTap: () {
                    ref.read(cityProvider.notifier).state = city;
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
