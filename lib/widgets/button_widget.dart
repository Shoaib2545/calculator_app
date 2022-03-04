import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String? text;
  final int? buttonColor;
  final int? textColor;
  final double? textSize;
  final Function? callbackFunction;

  const CalculatorButton({
    Key? key,
    this.text,
    this.buttonColor,
    this.textColor = 0xFFFFFFFF,
    this.textSize = 28,
    this.callbackFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: (){callbackFunction!(text);}, child: Container(
          margin: const EdgeInsets.all(10),
          width: 65,
          height: 65,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            color: buttonColor != null ? Color(buttonColor!) : null,
          ),
          child: Center(child: Text(
                text!,
                style: TextStyle(
                    fontSize: textSize,
                    color: Color(textColor!),
                  ),
              ),),
        ),);
  }
}
