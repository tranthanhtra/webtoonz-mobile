import 'package:flutter/material.dart';
import 'package:webtoonz_mobile/utils/constants/color_resources.dart';

/// Customize badge for app
///
/// [text] text label
/// [backgroundColor] color of badge
/// [textColor] color of text, default value is white
class Badge extends StatelessWidget {
  const Badge({
    Key? key, required this.text, required this.backgroundColor, this.textColor = ColorResources.white,
  }) : super(key: key);

  final String text;
  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}