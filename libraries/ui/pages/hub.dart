import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Hub extends StatelessWidget {
  const Hub({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Hub",
          style: GoogleFonts.inter(),
        ),
      ),
    );
  }
}
