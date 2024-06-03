import 'package:bmi/theme.dart';
import 'package:flutter/material.dart';

class BMIIndexRow extends StatelessWidget {
  final String name;
  final String range;
  final bool isSelected;

  const BMIIndexRow({
    super.key,
    required this.name,
    required this.range,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle normalStyle = const TextStyle(
      color: AppColor.text,
      fontSize: 18,
      fontWeight: FontWeight.w500,
    );
    TextStyle selectedStyle =
        normalStyle.copyWith(fontSize: 19, fontWeight: FontWeight.w700);
    return Container(
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
          color: isSelected ? AppColor.appBarBackground : Colors.transparent,
          borderRadius: BorderRadius.circular(isSelected ? 8 : 0),
          boxShadow: isSelected
              ? const [
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
                ]
              : null),
      child: Row(
        children: [
          Expanded(
            child: Text(name, style: isSelected ? selectedStyle : normalStyle),
          ),
          Text(':', style: normalStyle),
          Expanded(
            child: Center(
              child:
                  Text(range, style: isSelected ? selectedStyle : normalStyle),
            ),
          ),
        ],
      ),
    );
  }
}
