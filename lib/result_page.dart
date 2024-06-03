import 'dart:math';
import 'package:bmi/components/action_button.dart';
import 'package:bmi/components/bmi_index_table.dart';
import 'package:bmi/components/neo_container.dart';
import 'package:bmi/components/score_component.dart';
import 'package:bmi/components/summary_row.dart';
import 'package:bmi/domain/bmi_calculator.dart';
import 'package:bmi/domain/bmi_classification.dart';
import 'package:bmi/theme.dart';
import 'package:bmi/viewmodels/result_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'components/summary_item.dart';

class ResultContent extends StatelessWidget {
  const ResultContent({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 2;
    final ResultViewModel viewModel =
        Provider.of<ResultViewModel>(context, listen: false);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ScoreComponent(
              width: width,
              score: viewModel.bmiText,
              type: viewModel.bmiType,
              color: viewModel.bmiColor,
            ),
            const SizedBox(height: 30),
            BMIIndexTable(data: viewModel.bmiTableRows),
            const SizedBox(height: 30),
            SummaryRow(
              children: [
                SummaryItem(
                  title: viewModel.heightTitle,
                  value: viewModel.heightValueText,
                  unit: viewModel.heightUnitText,
                ),
                SummaryItem(
                  title: viewModel.weightTitle,
                  value: viewModel.weightValueText,
                  unit: viewModel.weightUnitText,
                ),
                SummaryItem(
                  title: viewModel.ageTitle,
                  value: viewModel.ageValueText,
                ),
              ],
            ),
            const SizedBox(height: 50),
            ActionButton(
                title: 'RECALCULATE',
                onPressed: () {
                  Navigator.of(context).pop();
                })
          ],
        ),
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  final ResultInputInfo info;

  const ResultPage({
    super.key,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appBarBackground,
      appBar: AppBar(
        title: const Text('Result',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 35)),
        backgroundColor: AppColor.appBarBackground,
      ),
      body: ChangeNotifierProvider(
          create: (context) => ResultViewModel(
                inputInfo: info,
                calculator: BmiCalculator(),
                classification: BmiClassification(),
              ),
          child: const ResultContent()),
    );
  }
}

class BorderPainter extends CustomPainter {
  final double currentState;

  BorderPainter({required this.currentState});

  @override
  void paint(Canvas canvas, Size size) {
    double strokeWidth = 50;
    Rect rect = const Offset(0, 0) & Size(size.width, size.height);

    var paint = Paint()
      ..color = Colors.red
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    List<Color> colors = [
      const Color(0xff8a0101),
      const Color(0xffbc2020),
      const Color(0xffd38888),
      const Color(0xffffe400),
      const Color(0xff008137),
      const Color(0xffffe400),
      const Color(0xffd38888),
      const Color(0xffbc2020),
    ];

    List<double> diff = [16, 1, 1.5, 6.5, 5, 5, 5, 20]..reversed;
    double startAngle = 0;

    for (var i = 0; i < 8; i++) {
      canvas.drawArc(rect, startAngle, -diff[i] * pi / 60, false,
          paint..color = colors[i]);
      startAngle = startAngle + (-(diff[i] * pi / 60));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class Canv extends StatelessWidget {
  const Canv({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TweenAnimationBuilder(
          tween: Tween(begin: 0.0, end: 1.0),
          duration: const Duration(seconds: 5),
          builder: (context, value, child) {
            return CustomPaint(
                painter: BorderPainter(currentState: value),
                child: Container(
                  width: 250,
                  height: 250,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                ));
          }),
    );
  }
}
