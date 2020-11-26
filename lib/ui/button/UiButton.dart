import 'package:flutter/material.dart';

// import '../constants/variables.dart';
import '../UiTheme.dart';
import '../text/UiText.dart';

import 'helper/backgroundColor.dart';
import 'helper/color.dart';
import 'helper/margin.dart';
import 'helper/padding.dart';
import 'helper/shape.dart';
import 'helper/size.dart';
import 'UiButtonConstant.dart';

export 'UiButtonConstant.dart';

class UiButton extends StatelessWidget {
  static String name = 'UiButton';
  final String title;
  final Function onPressed;
  final UiButtonColor color;
  final UiButtonVariant variant;
  final UiButtonSize size;
  final double textFontSize;
  final ShapeBorder borderShape;
  final UiButtonShape shape;
  final EdgeInsetsGeometry boxPadding;
  final EdgeInsetsGeometry boxMargin;
  final UiButtonPaddding padding;
  final UiButtonMargin margin;
  // final bool fullWidth;
  // final AlignmentGeometry alignment;

  UiButton(
      {this.title = '',
      this.textFontSize,
      this.borderShape,
      this.boxPadding,
      this.boxMargin,
      this.onPressed,
      // this.alignment, wip
      // this.fullWidth, wip
      this.color = UiButtonColor.secondary,
      this.padding = UiButtonPaddding.xs,
      this.variant = UiButtonVariant.none,
      this.shape = UiButtonShape.squared,
      this.margin = UiButtonMargin.md,
      this.size = UiButtonSize.sm});

  @override
  Widget build(BuildContext context) {
    // will use by provider
    UiTheme theme = UiTheme();
    Color hColor = getUiButtonBackgroundColor(
        theme: theme,
        context: context,
        variant: this.variant,
        color: this.color);

    return Container(
      margin: getUiButtonMargin(
        theme: theme,
        context: context,
        value: this.boxMargin,
        boxMargin: this.margin,
      ),
      child: FlatButton(
        onPressed: this.onPressed,
        color: hColor,
        shape: getUiButtonShape(
          theme: theme,
          context: context,
          buttonShape: this.shape,
          value: this.borderShape,
          variant: this.variant,
          color: this.color,
        ),
        padding: getUiButtonPadding(
          theme: theme,
          context: context,
          value: this.boxPadding,
          boxPadding: this.padding,
        ),
        minWidth: 1,
        child: UiText(
          title: this.title,
          textColor: getUiButtonTextColor(
            theme: theme,
            context: context,
            variant: this.variant,
            color: this.color,
          ),
          fontSize: getUiButtonTextFontSize(
              theme: theme,
              context: context,
              value: this.textFontSize,
              buttonTextFontSize: this.size),
        ),
      ),
    );
  }
}
