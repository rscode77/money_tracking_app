import 'package:flutter/material.dart';

class YourCardsHeaderWidget extends StatelessWidget {
  const YourCardsHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Your cards',
      style: TextStyle(
        fontFamily: 'DarkGrotesque',
        fontSize: 18,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
