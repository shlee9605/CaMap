import 'package:geolocator/geolocator.dart';
// import '../custom_class/custom_location.dart';

class LocationService {
  // static const LocationClass initLocation =
  //     LocationClass(latitude: 37.545150, longitude: 126.922929);

  Future<LocationPermission> hasLocationPermission() async =>
      await Geolocator.checkPermission();

  Future<bool> isLocationEnabled() async =>
      await Geolocator.isLocationServiceEnabled();

  Future<LocationPermission> requestLocation() async =>
      await Geolocator.requestPermission();

  // Future<LocationClass> currentLocation() async {
  //   final Position position = await Geolocator.getCurrentPosition();
  //   return LocationClass(
  //       latitude: position.latitude, longitude: position.longitude);
  // }

  Future<bool> canGetCurrentLocation() async {
    final LocationPermission permission = await hasLocationPermission();
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      final bool enabled = await isLocationEnabled();
      if (enabled) return true;
    }
    return false;
  }
}
