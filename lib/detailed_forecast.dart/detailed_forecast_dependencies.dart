import 'package:flutter/widgets.dart';
import 'package:open_meteo/location/location.dart';
import 'package:open_meteo/open_meteo/daily_forecast.dart';
import 'package:open_meteo/open_meteo/hourly_forecast.dart';

class DetailedForecastDependencies extends InheritedWidget {
  final Location location;
  final Future<HourlyForecast> Function() fetchHourlyForecast;
  final Future<DailyForecast> Function() fetch7DayForecast;

  const DetailedForecastDependencies({
    super.key,
    required this.location,
    required this.fetchHourlyForecast,
    required this.fetch7DayForecast,
    required super.child,
  });

  static DetailedForecastDependencies of(BuildContext context) {
    final DetailedForecastDependencies? result =
        context
            .dependOnInheritedWidgetOfExactType<DetailedForecastDependencies>();
    assert(result != null, 'No DetailedForecastDependencies found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(DetailedForecastDependencies oldWidget) =>
      location != oldWidget.location;
}
