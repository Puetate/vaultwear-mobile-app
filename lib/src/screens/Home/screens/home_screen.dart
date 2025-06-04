import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';
import 'package:vualtwear_mobile_app/src/screens/Content/screens/content_screen.dart';
import 'package:vualtwear_mobile_app/src/screens/Home/components/scanner_overlay.dart';
import 'package:vualtwear_mobile_app/src/screens/Home/view_model/home_viewmodel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeViewModel homeViewModel = context.watch<HomeViewModel>();
    return Scaffold(
      body: MobileScanner(
        controller: MobileScannerController(
          detectionSpeed: DetectionSpeed.normal,
        ),
        onDetect: (capture) {
          final List<Barcode> barcodes = capture.barcodes;
          String detailCode = extractOrderDetailCode(
            barcodes.first.rawValue.toString(),
          );
          log("QR ${barcodes.first.rawValue.toString()}");
          homeViewModel.getOrderContent(detailCode);
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => ContentScreen()));
          // if (homeViewModel.orderContentModel != null) {
          // } else {
          //   log("No se pudo obtener el contenido del pedido");
          // }
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
