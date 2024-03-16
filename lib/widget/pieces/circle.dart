import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:tic_tac_toe/utils.dart';

class Circle extends StatefulWidget {
  const Circle({super.key, required this.size, required this.color});
  final double size;
  final Color color;
  @override
  State<Circle> createState() => _CircleState();
}

class _CircleState extends State<Circle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size,
      width: widget.size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(width: context.widthPercent(1), color: widget.color),
      ),
    );
  }
}
