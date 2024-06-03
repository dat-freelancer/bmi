import 'package:flutter/material.dart';

class SummaryRow extends StatelessWidget {
  final List<Widget> children;

  const SummaryRow({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: children,
    );
  }
}
