import 'package:flutter/material.dart';
import 'package:tic_tac_toe/utils.dart';

class Players extends StatelessWidget {
  const Players(
      {super.key,
      required this.player1WinCount,
      required this.player2WinCount});
  final int player1WinCount;
  final int player2WinCount;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ...[1, 2].map(
          (e) => Column(
            children: [
              Container(
                width: context.widthPercent(40),
                height: context.heightPercent(7),
                decoration: BoxDecoration(
                  borderRadius: AppRadius.radius20,
                  color: Color(0xFF121212),
                ),
                child: Center(
                  child: Text(
                    "PLAYER $e",
                    style:
                        TextStyle(color: Colors.white70, fontSize: context.t4),
                  ),
                ),
              ),
              context.vert1,
              Stack(
                children: [
                  Icon(
                    Icons.person_2_outlined,
                    color: e == 1 ? Colors.green : Colors.amber,
                    size: context.widthPercent(13),
                  ),
                  Positioned(
                    child: Text(
                      e == 1
                          ? player1WinCount.toString()
                          : player2WinCount.toString(),
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: context.t2,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
