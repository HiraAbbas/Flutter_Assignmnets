import 'package:geolocator/geolocator.dart';

class Location {
  late double latitude;
  late double longitude;
  String apiKey = '672a25fc14f82103a5c8f312fbbc5e0f';
  late int status;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
