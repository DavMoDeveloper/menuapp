import 'package:flutter/material.dart';
import 'package:menuapp/ui/general/colors.dart';

class OurText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight? fontWeight;
  final int? maxLines;
  final Color? color;
  final TextOverflow? textOverflow;
  final double? height;

  OurText({
    required this.text,
    required this.fontSize,
    this.fontWeight,
    this.maxLines,
    this.color,
    this.textOverflow,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: textOverflow,
      style: TextStyle(
        color: color ?? kBrandSecondaryColor.withOpacity(0.90),
        fontSize: fontSize,
        fontWeight: fontWeight,
        height: height,
      ),
    );
  }
}

class H1 extends StatelessWidget {
  final String text;
  final Color? color;

  H1({
    required this.text,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return OurText(
      text: text,
      fontSize: 26,
      fontWeight: FontWeight.bold,
      color: color,
    );
  }
}

class H2 extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final Color? color;

  H2({
    required this.text,
    this.fontWeight,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return OurText(
      text: text,
      fontSize: 24,
      fontWeight: fontWeight,
      color: color,
    );
  }
}

class H3 extends StatelessWidget {
  final String text;

  H3({required this.text});

  @override
  Widget build(BuildContext context) {
    return OurText(
      text: text,
      fontSize: 20,
    );
  }
}

class H4 extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final Color? color;

  H4({
    required this.text,
    this.fontWeight,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return OurText(
      text: text,
      fontSize: 16,
      fontWeight: fontWeight,
      color: color,
    );
  }
}

class H5 extends StatelessWidget {
  final String text;
  final Color? color;
  final double? height;
  final FontWeight? fontWeight;

  H5({
    required this.text,
    this.color,
    this.height,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return OurText(
      text: text,
      fontSize: 14,
      color: color,
      height: height,
      fontWeight: fontWeight,
    );
  }
}

class H6 extends StatelessWidget {
  final String text;
  final int? maxLines;
  final Color? color;
  final TextOverflow? textOverflow;

  H6({
    required this.text,
    this.maxLines,
    this.color,
    this.textOverflow,
  });

  @override
  Widget build(BuildContext context) {
    return OurText(
      text: text,
      fontSize: 13,
      maxLines: maxLines,
      color: color,
      textOverflow: textOverflow,
    );
  }
}