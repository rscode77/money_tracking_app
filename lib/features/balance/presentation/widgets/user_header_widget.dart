import 'package:flutter/material.dart';

class UserHeaderWidget extends StatelessWidget {
  final Function()? menuPressed;
  const UserHeaderWidget({
    Key? key,
    required this.menuPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: menuPressed,
      child: const Icon(Icons.menu_rounded),
    );
  }
}
