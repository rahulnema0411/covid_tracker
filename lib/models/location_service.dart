import 'package:geolocator/geolocator.dart';

class LocationService {
  double _latitude;
  double _longitude;

  String _city;
  String _state;
  String _country;

  double get latitude => _latitude;

  double get longitude => _longitude;

  String get city => _city;

  String get state => _state;

  String get country => _country;

  LocationService();

  Future<void> getLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    _latitude = position.latitude;
    _longitude = position.longitude;
    print('latitude$_latitude');
    print('longitude$_longitude');
    print(position);
  }

  Future<void> getAddress() async {
    print('getting Address');
    List<Placemark> placemark =
        await Geolocator().placemarkFromCoordinates(_latitude, _longitude);

    _city = placemark[0].subAdministrativeArea;
    _state = placemark[0].administrativeArea;
    _country = placemark[0].country;

    print('$_city $_state $_country');
  }
}
