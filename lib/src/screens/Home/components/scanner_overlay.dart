import 'package:animate_do/animate_do.dart';
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
        // Pintura del fondo oscuro con hueco
        CustomPaint(size: size, painter: ScannerOverlayPainter()),

        // Contenido superpuesto al CustomPaint
        Positioned.fill(
          child: Column(
            children: [
              const SizedBox(height: 80), // Espacio superior
              Swing(
                infinite: true,
                duration: const Duration(milliseconds: 2000),
                child: Image.asset(
                  'assets/images/rumi.png',
                  width: size.width * 0.7,
                ),
              ),
              const Spacer(),
              Flash(
                infinite: true,
                duration: Duration(milliseconds: 9000),
                child: const Text(
                  "Mueva el buscador sobre un código QR",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 100), // Espacio inferior
            ],
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
          ..color = Colors.tealAccent
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
