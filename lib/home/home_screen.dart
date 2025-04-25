import 'package:flutter/material.dart';
import 'package:open_meteo/home/basic_forecast.dart';
import 'package:open_meteo/home/home_screen_dependencies.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final deps = HomeScreenDependencies.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(deps.location?.name ?? 'Open Meteo')),
      body: Column(
        children: [
          ListTile(
            title: SearchAnchor.bar(
              barHintText: 'Search Locations',
              suggestionsBuilder: (context, controller) async {
                final results = await deps.search(controller.text);
                if (results.isEmpty) {
                  return const [ListTile(title: Text('No results found'))];
                }

                return [
                  for (final result in results)
                    ListTile(
                      title: Text(result.name),
                      subtitle:
                          result.description != null
                              ? Text(result.description!)
                              : null,
                      onTap: () {
                        deps.setLocation(result);
                        controller.clear();
                        Navigator.pop(context);
                      },
                    ),
                ];
              },
            ),
          ),
          ListTile(
            title: const Text('Current Location'),
            trailing: const Icon(Icons.my_location),
            onTap: () => deps.setCurrentLocation(),
          ),
          SizedBox(height: 32),
          if (deps.location != null)
            FutureBuilder(
              future: deps.dailyForecast(),
              builder: (context, forecast) {
                if (forecast.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (forecast.hasError || forecast.data == null) {
                  return const Center(child: Text('Error fetching weather'));
                }

                return FutureBuilder(
                  future: deps.airQuality(),
                  builder: (context, airQuality) {
                    if (airQuality.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (airQuality.hasError || airQuality.data == null) {
                      return const Center(
                        child: Text('Error fetching weather'),
                      );
                    }
                    return Expanded(
                      child: BasicForecast(
                        temperature: forecast.data!.data.temperature2M,
                        temperatureUnits: forecast.data!.units.temperature2M,
                        precipitation: forecast.data!.data.precipitation,
                        precipitationUnits: forecast.data!.units.precipitation,
                        uvIndex: airQuality.data!.data.uvIndex,
                        pollenCount: airQuality.data!.data.grassPollen,
                        airQuality: airQuality.data!.data.pm10,
                        isDaytime: forecast.data!.data.isDay,
                        onMoreDetails: () => deps.showDetails(context: context),
                      ),
                    );
                  },
                );
              },
            ),
        ],
      ),
    );
  }
}
