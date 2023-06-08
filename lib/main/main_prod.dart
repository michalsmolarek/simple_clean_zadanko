import 'package:zadanko/main/flavors/flavor.dart';
import 'package:zadanko/main/flavors/flavor_config.dart';
import 'package:zadanko/main/main.dart';

void main() {
  FlavorConfig(
    flavor: Flavor.prod,
    name: "[prod] zadanko",
    bundleID: 'com.example.zadanko',
    appID: 'com.example.zadanko',
    apiUrl: 'API_URL',
  );

  mainCommon();
}
