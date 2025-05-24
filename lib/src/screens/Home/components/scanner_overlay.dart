import 'package:flutter/material.dart';
import 'package:vualtwear_mobile_app/src/utils/app_layout.dart';

class ScannerOverlay extends StatelessWidget {
  const ScannerOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = AppLayout.getSize(context);
    return Stack(
      children: [
        // Fondo con hueco transparente
        Positioned.fill(child: CustomPaint(painter: ScannerOverlayPainter())),

        // Ícono informativo sobre el recuadro
        Positioned(
          top: size.height * 0.5,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/images/rumi.png', width: 120, height: 120),
                const SizedBox(height: 16),
                const Text(
                  "Apunta al código QR dentro del recuadro",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ScannerOverlayPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = Colors.black45
          ..style = PaintingStyle.fill;

    final borderPaint =
        Paint()
          ..color = Colors.white
          ..strokeWidth = 4
          ..style = PaintingStyle.stroke;

    final borderRadius = 16.0;
    final scanRect = Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      width: 275,
      height: 275,
    );

    // Dibujar fondo opaco con hueco
    final overlayPath =
        Path()
          ..addRect(Rect.fromLTWH(0, 0, size.width, size.height))
          ..addRRect(
            RRect.fromRectAndRadius(scanRect, Radius.circular(borderRadius)),
          )
          ..fillType = PathFillType.evenOdd;
    canvas.drawPath(overlayPath, paint);

    // Dibujar bordes blancos del recuadro
    canvas.drawRRect(
      RRect.fromRectAndRadius(scanRect, Radius.circular(borderRadius)),
      borderPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
