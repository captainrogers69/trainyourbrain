// import 'package:geolocator/geolocator.dart';

extension DistanceExtension on double {
  String distanceFormatter(double distnc) {
    double distanceInMeters = distnc;
    double distanceInKMs = distanceInMeters / 1000;
    if (distanceInKMs < 1) {
      return double.parse((distanceInMeters).toStringAsFixed(2)).toString();
    } else {
      return double.parse((distanceInKMs).toStringAsFixed(2)).toString();
    }
  }
// Future<double> calculateDistance(lat1, lon1, lat2, lon2) async {
//   return Geolocator.distanceBetween(lat1, lon1, lat2, lon2);
// }
}
