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

Future<List<DocumentReference>> findBlockedUsers(
  List<DocumentReference> blockedUsers,
  List<DocumentReference> chatUsers,
) async {
  // create an action that finds all the document references that are in both the blockedUsers list and the chatUsers list, and then returns the new list

  List<DocumentReference> commonUsers = [];

  for (DocumentReference user in blockedUsers) {
    if (chatUsers.contains(user)) {
      commonUsers.add(user);
    }
  }

  return commonUsers;
}
