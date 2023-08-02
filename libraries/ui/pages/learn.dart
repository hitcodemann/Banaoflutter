import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Learn extends StatelessWidget {
  const Learn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Learn",
          style: GoogleFonts.inter(),
        ),
      ),
    );
  }
}
