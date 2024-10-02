// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:geocoding/geocoding.dart';

Future<DateTime?> getTimeFromCoords(
  double? lat,
  double? long,
) async {
  // Add your function code here!
  if (lat == null || long == null) {
    return null;
  }

  // Initialize the time zone data
  tz.initializeTimeZones();

  try {
    // Use Geocoding to get the address from the latitude and longitude
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);

    if (placemarks.isEmpty) {
      return null;
    }

    var first = placemarks.first;

    // Use country name or other location information to find the timezone
    String? timeZoneId;

    // You can use different fields depending on the accuracy required
    if (first.administrativeArea != null && first.isoCountryCode != null) {
      timeZoneId = tz.timeZoneDatabase.locations.keys.firstWhere(
          (id) =>
              id.contains(first.isoCountryCode!) &&
              id.contains(first.administrativeArea!),
          orElse: () => 'UTC');
    } else if (first.isoCountryCode != null) {
      timeZoneId = tz.timeZoneDatabase.locations.keys.firstWhere(
          (id) => id.contains(first.isoCountryCode!),
          orElse: () => 'UTC');
    }

    // Get the timezone location
    final location = tz.getLocation(timeZoneId ?? 'UTC');

    // Return the current time in the specified location, automatically adjusted for DST
    return tz.TZDateTime.now(location);
  } catch (e) {
    print('Error: $e');
    return null;
  }
}
