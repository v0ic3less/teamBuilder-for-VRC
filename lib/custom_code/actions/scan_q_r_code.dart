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

import 'package:qr_bar_code_scanner_dialog/qr_bar_code_scanner_dialog.dart';
import 'dart:async';

Future<String> scanQRCode(BuildContext context) async {
  final qrBarCodeScannerDialogPlugin = QrBarCodeScannerDialog();
  final completer = Completer<String>();

  qrBarCodeScannerDialogPlugin.getScannedQrBarCode(
    context: context,
    onCode: (code) {
      if (code != null) {
        code = code.replaceAll("Code scanned = ", "");
      }
      completer.complete(code ?? 'No QR code scanned');
    },
  );

  return completer.future;
}
