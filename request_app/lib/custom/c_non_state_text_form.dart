import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class WCustomNonStateContainer extends StatelessWidget {
  WCustomNonStateContainer(
      {Key? key,
      required this.value,
      required this.description,
      required this.valueColor,
      required this.height,
      required this.fontsize,
      required this.width})
      : super(key: key);
  final String value;
  final String description;
  final int valueColor;
  final double fontsize;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Color(valueColor) ?? Color(0xFFECE9E9), // default 0xFFECE9E9
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 1.h,
            ),
            SizedBox(
              width: width,
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                SizedBox(
                  width: 8,
                ),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: fontsize ?? 12,
                    color: Color(0xFF1d2758),
                  ),
                ),
                Flexible(
                  child: Text(
                    value,
                    style: TextStyle(
                        fontSize: fontsize ?? 12,
                        color: Color(0xFF1d2758),
                        fontWeight: FontWeight.bold),
                  ),
                )
              ]),
            ),
            SizedBox(
              height: 1.h,
            ),
          ],
        ));
  }
}
