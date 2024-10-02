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

import 'package:qr_code_scanner/qr_code_scanner.dart';

Future<String?> scanQRCodeMobile(BuildContext context) async {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  String? qrCodeResult;

  final qrScanner = QRView(
    key: qrKey,
    onQRViewCreated: (QRViewController controller) {
      controller.scannedDataStream.listen((scanData) {
        qrCodeResult = scanData.code;
        controller.dispose(); // Stop scanning after getting the result
        Navigator.pop(context); // Close the scanner screen
      });
    },
  );

  // Navigate to the QR scanner screen
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => Scaffold(body: qrScanner),
    ),
  );

  // Return the scanned QR code
  return qrCodeResult;
}
