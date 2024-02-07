import 'package:flutter/material.dart';

class ContentButtons extends StatelessWidget {
  const ContentButtons({required this.icons, required this.text , required this.onPressed});

  final icons;
  final text;
  final onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
          ),
          onPressed: onPressed,
          child: Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Color(0xff00c897), width: 2.0),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Icon(icons,
                      size: 80.0, color: Color(0xff00c897)),
                  Text(
                    text,
                    style: TextStyle(color: Color(0xff00c897)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
