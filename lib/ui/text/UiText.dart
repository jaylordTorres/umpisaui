import 'package:flutter/material.dart';
export 'UiTextConstant.dart';

import '../UiTheme.dart';
import '../constants/variables.dart';

import 'UiTextConstant.dart';
import 'helper/color.dart';
import 'helper/fontSize.dart';
import 'helper/fontWeight.dart';

class UiText extends StatelessWidget {
  static String name = 'UiText';

  final String title;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final TextStyle style;
  final UiTextVariant variant;
  final UiSizes textFontSize;
  final UiTextColor textColor;
  final UiTextFontWeight textFontWeight;

  UiText({
    this.title = '',
    this.fontSize,
    this.fontWeight,
    this.style,
    this.color,
    this.variant = UiTextVariant.none,
    this.textColor = UiTextColor.none,
    this.textFontSize = UiSizes.none,
    this.textFontWeight = UiTextFontWeight.sm,
  });

  @override
  Widget build(BuildContext context) {
    // will use by provider
    UiTheme theme = UiTheme();

    return Text(this.title,
        style: this.style ??
            TextStyle(
              fontSize: getUiTextFontSize(
                theme: theme,
                context: context,
                variant: this.variant,
                value: this.fontSize,
                textFontSize: this.textFontSize,
              ),
              color: getUiTextColor(
                theme: theme,
                context: context,
                variant: this.variant,
                value: this.color,
                textColor: this.textColor,
              ),
              fontWeight: getUiTextFontWeight(
                theme: theme,
                context: context,
                variant: this.variant,
                value: this.fontWeight,
                textFontWeight: this.textFontWeight,
              ),
            ));
  }
}
