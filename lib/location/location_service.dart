import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:open_meteo/location/location.dart';
import 'package:open_meteo/open_meteo/search.dart';

class LocationService extends ValueNotifier<Location?> {
  LocationService() : super(null);

  Future<bool> requestPermission() async {
    if (!await Geolocator.isLocationServiceEnabled()) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    var permission = await Geolocator.checkPermission();
    if (permission.isGranted) return true;
    permission = await Geolocator.requestPermission();
    return permission.isGranted;
  }

  Future<void> setCurrentPosition() async {
    if (!await requestPermission()) {
      return Future.error('Location permission denied.');
    }

    final position = await Geolocator.getCurrentPosition();
    value = Location(
      latitude: position.latitude,
      longitude: position.longitude,
      name: 'Current Location',
    );
  }

  Future<List<Location>> search(String name) async {
    final searchResults = await Search.fetch(name);
    return searchResults.map((result) {
      return Location(
        latitude: result.latitude,
        longitude: result.longitude,
        name: result.name,
        description:
            result.admin1.isNotEmpty
                ? '${result.admin1}, ${result.country}'
                : result.country,
      );
    }).toList();
  }
}

extension LocationPermissionExtension on LocationPermission {
  bool get isGranted =>
      this == LocationPermission.always ||
      this == LocationPermission.whileInUse;
  bool get isDenied =>
      this == LocationPermission.denied ||
      this == LocationPermission.deniedForever;
}
