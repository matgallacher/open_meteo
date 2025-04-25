import 'package:flutter/widgets.dart';
import 'package:open_meteo/location/location.dart';
import 'package:open_meteo/open_meteo/air_quality.dart';
import 'package:open_meteo/open_meteo/forecast.dart';

class HomeScreenDependencies extends InheritedWidget {
  final Location? location;
  final Future<void> Function() setCurrentLocation;
  final void Function(Location location) setLocation;
  final Future<Forecast> Function() dailyForecast;
  final Future<AirQuality> Function() airQuality;
  final Future<List<Location>> Function(String name) search;
  final void Function({required BuildContext context}) showDetails;

  const HomeScreenDependencies({
    super.key,
    this.location,
    required this.setCurrentLocation,
    required this.setLocation,
    required this.dailyForecast,
    required this.airQuality,
    required this.showDetails,
    required this.search,
    required super.child,
  });

  static HomeScreenDependencies of(BuildContext context) {
    final HomeScreenDependencies? result =
        context.dependOnInheritedWidgetOfExactType<HomeScreenDependencies>();
    assert(result != null, 'No HomeScreenDependencies found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(HomeScreenDependencies oldWidget) =>
      location != oldWidget.location;
}
