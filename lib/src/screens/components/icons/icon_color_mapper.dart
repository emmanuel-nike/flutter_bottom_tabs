import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconColorMapper extends ColorMapper {
  const IconColorMapper({required this.subColor});

  final Color subColor;

  @override
  Color substitute(
    String? id,
    String elementName,
    String attributeName,
    Color color,
  ) {
    if (color == const Color(0xFF6F6E7C)) {
      return subColor;
    }
    return color;
  }
}
