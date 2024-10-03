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

import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> unsubFromTeamPushNotifs(String teamNum) async {
  print('Attempting to subscribe to topic: $teamNum');
  try {
    // Subscribing the user to the specified topic
    await FirebaseMessaging.instance.unsubscribeFromTopic(teamNum);
    print('Successfully subscribed to topic: $teamNum');
  } catch (e) {
    print('Failed to subscribe to topic: $e');
  }
}
