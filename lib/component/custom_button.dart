import 'package:flutter/material.dart';
import 'package:webtoonz_mobile/utils/constants/color_resources.dart';

/// Customize button for app
///
/// [text] button text
/// [textColor] button text color
/// [onClick] button onClick event
/// [backgroundColor] button background color
/// [borderColor] button border color
class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    required this.onClick,
    this.backgroundColor = ColorResources.green,
    this.borderColor = ColorResources.green,
    this.textColor = ColorResources.white
  }) : super(key: key);

  final String text;
  final GestureTapCallback onClick;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
        ),
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.0),
              side: BorderSide(
                color: borderColor,
                width: 1,
              )),
        ),
        backgroundColor: MaterialStateProperty.all(backgroundColor),
      ),
      onPressed: onClick,
    );
  }
}
