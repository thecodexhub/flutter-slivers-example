import 'package:flutter/material.dart';

extension TextExtension on Text {
  Text fontSize([double fontSize = 16]) {
    return Text(data!,
        style: style == null
            ? TextStyle(fontSize: fontSize)
            : style?.copyWith(fontSize: fontSize));
  }

  Text get italics {
    return Text(data!,
        style: style == null
            ? const TextStyle(fontStyle: FontStyle.italic)
            : style?.copyWith(fontStyle: FontStyle.italic));
  }

  Text fontWeight([FontWeight fontWeight = FontWeight.normal]) {
    return Text(data!,
        style: style == null
            ? TextStyle(fontWeight: fontWeight)
            : style?.copyWith(fontWeight: fontWeight));
  }

  Text get bold {
    return Text(data!,
        style: style == null
            ? const TextStyle(fontWeight: FontWeight.w600)
            : style?.copyWith(fontWeight: FontWeight.w600));
  }

  Text color([Color color = Colors.white]) {
    return Text(data!,
        style: style == null
            ? TextStyle(color: color)
            : style?.copyWith(color: color));
  }
}
