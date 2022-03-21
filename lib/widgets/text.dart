import 'package:flutter/material.dart';
import 'package:webtoonz_mobile/utils/config.dart';

Text accessHeader(String title) {
  return Text(
    title,
    style: TextStyle(
      color: const Color(0xFF54ACEC),
      fontSize: getWidth(24),
      fontWeight: FontWeight.w700,
    ),
  );
}