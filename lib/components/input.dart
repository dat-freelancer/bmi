import 'package:bmi/components/neo_container.dart';
import 'package:bmi/theme.dart';
import 'package:flutter/material.dart';

class InputComponent extends StatelessWidget {
  final String title;
  final String value;
  final VoidCallback? onPlusPressed;
  final VoidCallback? onSubtractPressed;

  const InputComponent({
    super.key,
    required this.title,
    required this.value,
    this.onPlusPressed,
    this.onSubtractPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Neumophism(
      color: AppColor.background,
      radius: 15,
      child: Container(
        padding: const EdgeInsets.all(16),
        constraints: const BoxConstraints(maxHeight: 159, maxWidth: 139),
        decoration: BoxDecoration(
          color: AppColor.appBarBackground,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                  color: AppColor.text,
                  fontSize: 24,
                  fontWeight: FontWeight.w700),
            ),
            const Spacer(),
            Text(
              value,
              style: const TextStyle(
                  color: AppColor.text,
                  fontSize: 30,
                  fontWeight: FontWeight.w700),
            ),
            const Spacer(),
            Row(
              children: [
                IconButton(
                    onPressed: onSubtractPressed,
                    icon: Image.asset('images/subtract.png')),
                const Spacer(),
                IconButton(
                    onPressed: onPlusPressed,
                    icon: Image.asset('images/plus.png')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
