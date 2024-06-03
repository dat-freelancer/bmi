import 'package:bmi/components/bmi_type_row.dart';
import 'package:flutter/material.dart';

class BMIRowInfo {
  final String type;
  final String range;
  final bool isSelected;

  BMIRowInfo({
    required this.type,
    required this.range,
    this.isSelected = false,
  });
}

class BMIIndexTable extends StatelessWidget {
  final List<BMIRowInfo> data;

  const BMIIndexTable({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: _rows());
  }

  List<BMIIndexRow> _rows() {
    return data.map((e) {
      return BMIIndexRow(
          name: e.type, range: e.range, isSelected: e.isSelected);
    }).toList();
  }
}
