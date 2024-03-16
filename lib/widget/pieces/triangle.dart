import 'package:flutter/material.dart';

class Triangle extends StatelessWidget {
  const Triangle({super.key, required this.size, required this.color});
  final double size;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: TrianglePainter(color: color),
    );
  }
}

class TrianglePainter extends CustomPainter {
  TrianglePainter({
    required this.color,
  });
  final Color color;
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    Path path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(TrianglePainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(TrianglePainter oldDelegate) => false;
}
