import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';
import 'package:vualtwear_mobile_app/src/screens/Content/screens/content_screen.dart';
import 'package:vualtwear_mobile_app/src/screens/Content/view_model/content_viewmodel.dart';
import 'package:vualtwear_mobile_app/src/screens/Home/components/scanner_overlay.dart';
import 'package:vualtwear_mobile_app/src/screens/Home/view_model/home_viewmodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MobileScannerController scannerController;

  @override
  void initState() {
    super.initState();
    scannerController = MobileScannerController(
      detectionSpeed: DetectionSpeed.normal,
      facing: CameraFacing.back,
      formats: [BarcodeFormat.qrCode],
    );
  }

  @override
  void dispose() {
    scannerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ContentViewmodel contentViewmodel = context.read<ContentViewmodel>();
    return Scaffold(
      body: MobileScanner(
        controller: scannerController,
        onDetect: (capture) {
          final List<Barcode> barcodes = capture.barcodes;
          final String rawValue = barcodes.first.rawValue ?? '';
          if (rawValue.isEmpty) return;

          final detailCode = extractOrderDetailCode(rawValue);
          if (detailCode.isEmpty) return;
          scannerController.stop();
          log("QR $rawValue");

          contentViewmodel.loadNextPage(detailCode);

          if (!mounted) return;
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const ContentScreen()),
          );
        },
        overlayBuilder: (_, __) => const ScannerOverlay(),

        placeholderBuilder:
            (context) => const Center(
              child: CircularProgressIndicator(color: Colors.white),
            ),
      ),
    );
  }

  String extractOrderDetailCode(String url) {
    Uri uri = Uri.parse(url);
    return uri.queryParameters['orderDetailCode'] ?? '';
  }
}
