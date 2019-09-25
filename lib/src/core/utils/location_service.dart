import 'package:geolocator/geolocator.dart';
import 'package:location_permissions/location_permissions.dart';

class LocationService {
  Future<Position> getLocation() async {
    var isEnabled = await _checkPermission();
    if (isEnabled) {
      return await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    } else
      return null;
  }

  Future<bool> _checkPermission() async {
    PermissionStatus permission =
        await LocationPermissions().checkPermissionStatus();
    switch (permission) {
      case PermissionStatus.granted:
        return true;
        break;
      default:
        PermissionStatus permission =
            await LocationPermissions().requestPermissions();
        if (permission == PermissionStatus.granted) {
          return true;
        } else {
          return false;
        }
    }
  }
}
