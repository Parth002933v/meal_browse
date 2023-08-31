import 'package:flutter/material.dart';

import '../main.dart';

class MealItemtrait extends StatelessWidget {
  const MealItemtrait({
    Key? key,
    required this.icon,
    required this.lable,
  }) : super(key: key);

  final IconData icon;
  final String lable;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.white),
        SizedBox(width: mq.width * .005),
        Text(lable,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500)),
      ],
    );
  }
}
