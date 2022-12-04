import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    Future<void> getCurrentLocationCheckingPermissions() async {
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
          print(Future.error('Location permissions are denied: ' +
              locationPermission.toString()));
          locationPermission = await Geolocator.requestPermission();
        }

        if (LocationPermission.whileInUse == locationPermission ||
            LocationPermission.always == locationPermission) {
          Position position = await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.lowest);
          print('Position: $position');
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
