import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longitude;

  Future<void> getCurrentLocation() async {
    try {
      bool serviceEnabled;
      LocationPermission locationPermission;

      // Test if location services are enabled.
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        // Location services are not enabled don't continue
        // accessing the position and request users of the
        // App to enable the location services.
        return Future.error(
            'Location services are disabled. Please activate them.');
      } else {
        locationPermission = await Geolocator.checkPermission();
        if (LocationPermission.unableToDetermine == locationPermission) {
          return Future.error(
              'Unable to determine if location permissions are enabled.');
        } else if (LocationPermission.denied == locationPermission ||
            LocationPermission.deniedForever == locationPermission) {
          print(Future.error(
              'Location permissions are denied: $locationPermission'));
          locationPermission = await Geolocator.requestPermission();
        } else if (LocationPermission.whileInUse == locationPermission ||
            LocationPermission.always == locationPermission) {
          // Geolocator package has issues
          // Position position = await Geolocator.getCurrentPosition(
          //     desiredAccuracy: LocationAccuracy.lowest);
          // longitude = position.longitude ?? 11.576124;
          // latitude = position.latitude ?? 48.137154;
          longitude = 11.576124;
          latitude = 48.137154;
        }
        // }
      }
    } catch (e) {
      print(e);
    }
  }
}
