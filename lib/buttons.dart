import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final textColor;
  final textname;
  final color;
  final buttonTapped;
  const Buttons(this.color, this.textColor, this.textname, this.buttonTapped,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: color,
            child: Center(
              child: Text(
                textname,
                style: TextStyle(color: textColor, fontSize: 17),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
