import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextUI extends StatelessWidget {
  const TextUI({
    super.key,
    required this.label,
    this.size,
    this.weight,
    this.color,
  });

  final String label;
  final double? size;
  final FontWeight? weight;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: GoogleFonts.nunito(
        fontSize: size,
        fontWeight: weight,
        color: color,
      ),
    );
  }
}
