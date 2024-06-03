import 'package:bmi/components/neo_container.dart';
import 'package:bmi/theme.dart';
import 'package:flutter/material.dart';

typedef SliderOnChanged = void Function(double);

class HeightComponent extends StatelessWidget {
  final double value;
  final double minValue;
  final double maxValue;
  final String title;
  final String unit;
  final SliderOnChanged? onChanged;
  const HeightComponent({
    super.key,
    required this.value,
    required this.minValue,
    required this.maxValue,
    required this.title,
    required this.unit,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Neumophism(
      color: AppColor.background,
      radius: 15,
      child: Container(
        constraints: const BoxConstraints(minHeight: 189),
        decoration: BoxDecoration(
          color: AppColor.appBarBackground,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: AppColor.text)),
                Text(unit,
                    style: const TextStyle(fontSize: 10, color: AppColor.text))
              ],
            ),
            const SizedBox(height: 50),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                thumbShape: const _ThumbShape(),
                valueIndicatorShape: SliderComponentShape.noOverlay,
                valueIndicatorColor: AppColor.selected,
              ),
              child: Slider(
                value: value,
                min: minValue,
                max: maxValue,
                label: value.toStringAsFixed(0),
                divisions: maxValue.toInt() - minValue.toInt(),
                onChanged: onChanged,
                inactiveColor: AppColor.inactiveTrack,
                activeColor: AppColor.activeTrack,
              ),
            )
          ]),
        ),
      ),
    );
  }
}

class _ThumbShape extends RoundSliderThumbShape {
  final _indicatorShape = const PaddleSliderValueIndicatorShape();

  const _ThumbShape();

  @override
  void paint(PaintingContext context, Offset center,
      {required Animation<double> activationAnimation,
      required Animation<double> enableAnimation,
      required bool isDiscrete,
      required TextPainter labelPainter,
      required RenderBox parentBox,
      required SliderThemeData sliderTheme,
      required TextDirection textDirection,
      required double value,
      required double textScaleFactor,
      required Size sizeWithOverflow}) {
    super.paint(
      context,
      center,
      activationAnimation: activationAnimation,
      enableAnimation: enableAnimation,
      sliderTheme: sliderTheme,
      value: value,
      textScaleFactor: textScaleFactor,
      sizeWithOverflow: sizeWithOverflow,
      isDiscrete: isDiscrete,
      labelPainter: labelPainter,
      parentBox: parentBox,
      textDirection: textDirection,
    );
    _indicatorShape.paint(
      context,
      center,
      activationAnimation: const AlwaysStoppedAnimation(1),
      enableAnimation: const AlwaysStoppedAnimation(1),
      labelPainter: labelPainter,
      parentBox: parentBox,
      sliderTheme: sliderTheme,
      value: value,
      textScaleFactor: 1,
      sizeWithOverflow: sizeWithOverflow,
      isDiscrete: isDiscrete,
      textDirection: textDirection,
    );
  }
}
