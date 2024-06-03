import 'package:flutter/material.dart';
import '../theme.dart';

class ScoreComponent extends StatelessWidget {
  final double width;
  final String score;
  final String type;
  final Color color;

  const ScoreComponent({
    super.key,
    required this.width,
    required this.score,
    required this.type,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 35),
      width: width,
      height: width,
      decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          boxShadow: const [
            BoxShadow(
                color: AppColor.background, blurRadius: 8, offset: Offset(8, 8))
          ]),
      child: Column(
        children: [
          const Text(
            'BMI',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: AppColor.text),
          ),
          const SizedBox(height: 10),
          Text(
            score,
            style: const TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.w700,
                color: AppColor.text),
          ),
          const Spacer(),
          Text(
            type,
            style: const TextStyle(
                color: AppColor.text,
                fontSize: 23,
                fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }
}
