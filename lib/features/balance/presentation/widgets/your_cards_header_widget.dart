import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class YourCardsHeaderWidget extends StatelessWidget {
  const YourCardsHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Your cards',
      style: GoogleFonts.darkerGrotesque(
        fontSize: 18,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
