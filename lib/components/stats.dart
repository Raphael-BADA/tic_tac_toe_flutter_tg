import 'package:flutter/material.dart';
import 'package:tic_tac_toe/utils.dart';
import 'package:tic_tac_toe/widget/equal.dart';
import 'package:tic_tac_toe/widget/pieces/circle.dart';
import 'package:tic_tac_toe/widget/pieces/triangle.dart';

class Stats extends StatelessWidget {
  const Stats(
      {super.key,
      required this.player1WinCount,
      required this.player2WinCount,
      required this.rounds});
  final int player1WinCount;
  final int player2WinCount;
  final int rounds;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            context.vert5,
            Triangle(
              size: context.widthPercent(8),
              color: Colors.green,
            ),
            context.vert1,
            Text(
              player1WinCount.toString(),
              style: TextStyle(
                color: Colors.white70,
                fontSize: context.t0,
              ),
            )
          ],
        ),
        Column(
          children: [
            context.vert5,
            Equal(size: context.widthPercent(8), color: Colors.blue),
            context.vert1,
            Text(
              rounds.toString(),
              style: TextStyle(
                color: Colors.white70,
                fontSize: context.t0,
              ),
            )
          ],
        ),
        Column(
          children: [
            context.vert5,
            Circle(
              size: context.widthPercent(8),
              color: Colors.amber,
            ),
            context.vert1,
            Text(
              player2WinCount.toString(),
              style: TextStyle(
                color: Colors.white70,
                fontSize: context.t0,
              ),
            )
          ],
        )
      ],
    );

    ;
  }
}
