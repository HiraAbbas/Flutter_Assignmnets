import 'package:flutter/material.dart';
import 'package:flutter_weather_app/services/api_services.dart';
import 'package:geolocator/geolocator.dart';

class MainController {
  late bool isDark = false;
  late dynamic currentWeatherData;
  late dynamic hourlyWeatherData;
  late double latitude;
  late double longitude;
  late bool isLoaded;

  Future<void> onInit() async {
    await getUserLocation();
    currentWeatherData = getCurrentWeather(latitude, longitude);
    hourlyWeatherData = getHourlyWeather(latitude, longitude);
  }

  void changeTheme() {
    isDark = !isDark;
    // Update the theme mode accordingly
  }

  Future<void> getUserLocation() async {
    bool isLocationEnabled;
    LocationPermission userPermission;

    isLocationEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isLocationEnabled) {
      throw Exception("Location is not enabled");
    }

    userPermission = await Geolocator.checkPermission();
    if (userPermission == LocationPermission.deniedForever) {
      throw Exception("Permission is denied forever");
    } else if (userPermission == LocationPermission.denied) {
      userPermission = await Geolocator.requestPermission();
      if (userPermission == LocationPermission.denied) {
        throw Exception("Permission is denied");
      }
    }

    final position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    latitude = position.latitude;
    longitude = position.longitude;
    isLoaded = true;
  }
}
