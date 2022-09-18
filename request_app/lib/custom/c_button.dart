import 'package:flutter/material.dart';

class WCustomButton extends StatelessWidget {
  const WCustomButton(
      {Key? key,
      required this.text,
      required this.press,
      required this.color,
      required this.fontWeight,
      required this.height,
      required this.width})
      : super(key: key);
  final String text;
  final VoidCallback press;
  final double height;
  final double width;
  final double fontWeight;

  final int color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(width, height),
            maximumSize: Size(width, height),
            primary: Color(color),
            onPrimary: Colors.white,
          ),
          onPressed: press,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyle(
                    fontSize: fontWeight, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ));
  }
}
