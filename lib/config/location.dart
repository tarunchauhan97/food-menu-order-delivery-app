import 'package:url_launcher/url_launcher.dart';

class Location {
  static Future<void> openMap(double latitude, double longitude) async {
    Uri googleUrl =
        Uri.parse("google.navigation:q=$latitude,$longitude&mode=d");
    if (await canLaunchUrl(googleUrl)) {
      await launchUrl(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }
}
