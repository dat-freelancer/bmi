import 'package:bmi/components/neo_container.dart';
import 'package:bmi/theme.dart';
import 'package:flutter/material.dart';

class GenderComponent extends StatelessWidget {
  final String icon;
  final String title;
  final Color color;
  final VoidCallback? onSelected;
  bool isSelected;

  GenderComponent({
    super.key,
    required this.icon,
    required this.title,
    required this.color,
    this.isSelected = false,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelected,
      child: AnimatedScale(
        scale: isSelected ? 1.08 : 1.0,
        duration: const Duration(milliseconds: 150),
        child: Neumophism(
          color: AppColor.background,
          radius: 15,
          child: Container(
            constraints: const BoxConstraints(maxHeight: 156, minWidth: 136),
            padding: const EdgeInsets.fromLTRB(20, 35, 20, 20),
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(15)),
            child: Column(
              children: [
                Image.asset(
                  icon,
                  width: 55,
                  height: 55,
                  fit: BoxFit.contain,
                ),
                const Spacer(),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
