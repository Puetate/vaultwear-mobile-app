import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:vualtwear_mobile_app/src/screens/Home/components/scanner_overlay.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MobileScanner(
        controller: MobileScannerController(
          detectionSpeed: DetectionSpeed.noDuplicates,
        ),
        onDetect: (capture) {
          final List<Barcode> barcodes = capture.barcodes;
          log("QR ${barcodes.first.rawValue.toString()}");
        },
        overlayBuilder: (_, __) => const ScannerOverlay(),

        placeholderBuilder:
            (context) => const Center(
              child: CircularProgressIndicator(color: Colors.white),
            ),
      ),
    );
  }
}
