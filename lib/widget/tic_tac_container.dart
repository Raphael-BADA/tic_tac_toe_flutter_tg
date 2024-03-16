import 'package:flutter/material.dart';
import 'package:tic_tac_toe/utils.dart';
import 'package:tic_tac_toe/widget/pieces/circle.dart';
import 'package:tic_tac_toe/widget/pieces/triangle.dart';

enum Piece { circle, triangle, empty }

class TicTacToeContainer extends StatefulWidget {
  const TicTacToeContainer({super.key, required this.piece, this.borderColor});
  final Piece piece;
  final Color? borderColor;
  @override
  State<TicTacToeContainer> createState() => _TicTacToeContainerState();
}

class _TicTacToeContainerState extends State<TicTacToeContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.widthPercent(30),
      width: context.widthPercent(30),
      decoration: BoxDecoration(
          color: const Color(0xFF121212),
          borderRadius: AppRadius.radius5,
          boxShadow: [
            BoxShadow(
              color: widget.borderColor ?? Colors.black,
              blurRadius: 1,
              spreadRadius: 1,
            ),
          ]),
      child: pieceContainer(),
    );
  }

  pieceContainer() {
    return widget.piece == Piece.triangle
        ? Center(
            child:
                Triangle(size: context.widthPercent(20), color: Colors.green))
        : widget.piece == Piece.circle
            ? Center(
                child:
                    Circle(size: context.widthPercent(20), color: Colors.amber))
            : Center();
  }
}
