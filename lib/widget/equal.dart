import 'package:flutter/material.dart';
import 'package:tic_tac_toe/utils.dart';

class Equal extends StatelessWidget {
  const Equal({Key? key, required this.size, required this.color})
      : super(key: key);

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: size,
      // width: size,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "ROUNDS",
            style: TextStyle(
              color: Colors.white70,
              fontSize: context.t2,
            ),
          ),
          // Container(
          //   height: size / 4,
          //   width: size,
          //   color: color,
          // ),
          // Container(
          //   height: size / 4,
          //   width: size,
          //   color: color,
          // ),
        ],
      ),
    );
  }
}
