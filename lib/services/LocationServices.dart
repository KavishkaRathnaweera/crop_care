import 'dart:async';
import 'package:geolocator/geolocator.dart';


class LocationService implements Exception {

  static Future<dynamic> getPosition(String serviceName) async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      throw LocationServiceDisabledException();
      //return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        //return Future.error('Location permissions are denied');
        throw PermissionDeniedException('Permission denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      //return Future.error('Location permissions are permanently denied, we cannot request permissions.');
      throw DeniedForeverException('Location access denied Forever');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    if (serviceName == "Current") {
      try {
        return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best,
            timeLimit: Duration(seconds: 20));
      } catch (exception) {
        throw exception;
      }
    } else if (serviceName == "Last") {
      try {
        return await Geolocator.getLastKnownPosition();
      } catch (exception) {
        throw exception;
      }
      //TimeoutException, PermissionDeniedException,LocationServiceDisabledException
    }
  }

  static Future<dynamic> getCurrentPosition() async {
    var initLocation;
    try {
      initLocation =
      await LocationService.getPosition("Current");
      return initLocation;
    } catch (e) {
      print(e);
    }
  }

  void getPositionStream() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    Position pos;
    try {
      Geolocator.getPositionStream().listen((Position position) {
        pos = position;
      });
    } catch (e) {}
  }

  static double getDistance(double startLatitude, double startLongitude,
      double endLatitude, double endLongitude) {
    if (startLatitude > -90 &&
        startLatitude < 90 &&
        startLongitude > -180 &&
        startLongitude < 180 &&
        endLatitude > -90 &&
        endLatitude < 90 &&
        endLongitude > -180 &&
        endLongitude < 180 &&
        isNumeric(startLatitude) &&
        isNumeric(startLongitude) &&
        isNumeric(endLatitude) &&
        isNumeric(endLongitude)) {
      return Geolocator.distanceBetween(
          startLatitude, startLongitude, endLatitude, endLongitude)
          .roundToDouble();
    } else {
      return 0.0;
    }
  }

  static bool isNumeric(d) {
    String s = d.toString();
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }
}

//LocationPermission permission = await Geolocator.checkPermission();
//LocationPermission permission = await Geolocator.requestPermission();

class DeniedForeverException implements Exception {
  String cause;
  DeniedForeverException(this.cause);
}
