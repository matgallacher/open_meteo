import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:open_meteo/detailed_forecast/detailed_forecast.dart';
import 'package:open_meteo/detailed_forecast/detailed_forecast_dependencies.dart';
import 'package:open_meteo/home/home_screen.dart';
import 'package:open_meteo/home/home_screen_dependencies.dart';
import 'package:open_meteo/location/location_service.dart';
import 'package:open_meteo/open_meteo/air_quality.dart';
import 'package:open_meteo/open_meteo/daily_forecast.dart';
import 'package:open_meteo/open_meteo/forecast.dart';
import 'package:open_meteo/open_meteo/hourly_forecast.dart';
import 'package:provider/provider.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return Consumer<LocationService>(
          builder: (context, location, _) {
            return HomeScreenDependencies(
              location: location.value,
              setLocation: (loc) => location.value = loc,
              setCurrentLocation: location.setCurrentPosition,
              dailyForecast:
                  () => Forecast.fetch(
                    location.value!.latitude,
                    location.value!.longitude,
                  ),
              airQuality:
                  () => AirQuality.fetch(
                    location.value!.latitude,
                    location.value!.longitude,
                  ),
              search: (name) => location.search(name),
              showDetails: ({required BuildContext context}) {
                final latlng =
                    '${location.value!.latitude},${location.value!.longitude}';
                GoRouter.of(context).push('/details/$latlng');
              },
              child: const HomeScreen(),
            );
          },
        );
      },
      routes: [
        GoRoute(
          path: 'details/:latlng',
          builder: (context, state) {
            return Consumer<LocationService>(
              builder: (context, location, _) {
                return DetailedForecastDependencies(
                  location: location.value!,
                  fetchHourlyForecast:
                      () => HourlyForecast.fetch(
                        location.value!.latitude,
                        location.value!.longitude,
                      ),
                  fetch7DayForecast:
                      () => DailyForecast.fetch(
                        location.value!.latitude,
                        location.value!.longitude,
                      ),
                  child: DetailedForecast(),
                );
              },
            );
          },
        ),
      ],
    ),
  ],
);
