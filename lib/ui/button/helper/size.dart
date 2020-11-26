import 'package:flutter/material.dart';

import '../../constants/fontSizes.dart';
import '../../UiTheme.dart';
import '../UiButtonConstant.dart';

Map<UiButtonSize, double> uiButtonTextFontSizes = {
  UiButtonSize.lg: UiFontSizes.md,
  UiButtonSize.md: UiFontSizes.sm,
  UiButtonSize.sm: UiFontSizes.xs
};

double getUiButtonTextFontSize({
  @required UiTheme theme,
  @required BuildContext context,
  UiButtonVariant variant,
  UiButtonSize buttonTextFontSize,
  double value,
}) {
  if (value != null) {
    return value;
  }

  if (buttonTextFontSize != null &&
      uiButtonTextFontSizes.containsKey(buttonTextFontSize)) {
    return uiButtonTextFontSizes[buttonTextFontSize];
  }

  return UiFontSizes.none;
}
