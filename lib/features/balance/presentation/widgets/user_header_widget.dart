import 'package:flutter/material.dart';

class UserHeaderWidget extends StatelessWidget {
  const UserHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Icon(Icons.menu_rounded),
        Icon(Icons.person_outline_rounded),
      ],
    );
  }
}
