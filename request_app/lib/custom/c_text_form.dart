import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class WCustomContainerTextFormField extends StatefulWidget {
  final ValueChanged<String> valueName;
  const WCustomContainerTextFormField(
      {Key? key,
      required this.name,
      required this.valueName,
      required this.type,
      required this.obscure})
      : super(key: key);
  final String name;
  final TextInputType type;
  final bool obscure;

  @override
  WCustomContainerTextFormFieldState createState() =>
      WCustomContainerTextFormFieldState();
}

class WCustomContainerTextFormFieldState
    extends State<WCustomContainerTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 176, 145, 145),
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      height: 5.h,
      child: Column(children: [
        SizedBox(
          height: 5.h,
          width: 25.w,
          child: TextFormField(
              obscureText: widget.obscure,
              keyboardType: widget.type,
              onChanged: (value) {
                widget.valueName(value);
              },
              decoration: InputDecoration(
                hintText: widget.name,
                filled: true,
                fillColor: const Color.fromARGB(255, 236, 233, 233),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromARGB(255, 236, 233, 233), width: 1.0),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromARGB(255, 236, 233, 233), width: 1.0),
                ),
              )),
        )
      ]),
    );
  }
}
