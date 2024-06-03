import 'package:bmi/components/neo_container.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class ActionButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;

  const ActionButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Neumophism(
      color: AppColor.selected,
      radius: 10,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.selected,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          onPressed: onPressed,
          child: SizedBox(
            height: 60,
            width: double.infinity,
            child: Center(
                child: Text(
              title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            )),
          )),
    );
  }
}
