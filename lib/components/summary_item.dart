import 'package:flutter/material.dart';

import '../theme.dart';

class SummaryItem extends StatelessWidget {
  final String title;
  final String value;
  final String? unit;

  const SummaryItem({
    super.key,
    required this.title,
    required this.value,
    this.unit,
  });

  @override
  Widget build(BuildContext context) {
    const TextStyle titleStyle = TextStyle(
        color: AppColor.text, fontSize: 18, fontWeight: FontWeight.w500);

    const TextStyle valueStyle = TextStyle(
        color: AppColor.text, fontSize: 18, fontWeight: FontWeight.w700);

    const TextStyle unitStyle = TextStyle(
        color: AppColor.text, fontSize: 16, fontWeight: FontWeight.w500);

    return Column(
      children: [
        Text(title, style: titleStyle),
        const SizedBox(height: 10),
        Container(
          width: 80,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          decoration: BoxDecoration(
              color: AppColor.appBarBackground,
              borderRadius: BorderRadius.circular(8),
              boxShadow: const [
                BoxShadow(
                  color: Color(0xff161a2e),
                  offset: Offset(6, 6),
                  blurRadius: 12,
                  spreadRadius: 1,
                ),
                BoxShadow(
                  color: Color(0xff1e2442),
                  offset: Offset(-6, -6),
                  blurRadius: 12,
                  spreadRadius: 1,
                ),
              ]),
          child: Center(
            child: RichText(
                text: TextSpan(children: [
              TextSpan(text: value, style: valueStyle),
              if (unit != null) TextSpan(text: unit!, style: unitStyle)
            ])),
          ),
        )
      ],
    );
  }
}
