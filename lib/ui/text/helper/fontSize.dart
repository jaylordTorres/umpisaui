import 'package:flutter/material.dart';

import '../../constants/variables.dart';
import '../../constants/fontSizes.dart';
import '../../UiTheme.dart';

import '../UiTextConstant.dart';

Map<UiSizes, double> uiFontSizes = {
  UiSizes.xl: UiFontSizes.xl,
  UiSizes.lg: UiFontSizes.lg,
  UiSizes.md: UiFontSizes.md,
  UiSizes.none: UiFontSizes.sm,
};

Map<UiTextVariant, double> uiTextVariantFontSizes = {
  UiTextVariant.h1: UiFontSizes.xl,
  UiTextVariant.h2: UiFontSizes.xl - 5.0,
  UiTextVariant.h3: UiFontSizes.lg,
  UiTextVariant.body: UiFontSizes.md,
  UiTextVariant.body2: UiFontSizes.md - 2.0,
  UiTextVariant.none: UiFontSizes.sm,
};

double getUiTextFontSize({
  @required UiTheme theme,
  @required BuildContext context,
  UiTextVariant variant,
  UiSizes textFontSize,
  double value,
}) {
  if (value != null) {
    return value;
  }

  if (textFontSize != UiSizes.none && uiFontSizes.containsKey(textFontSize)) {
    return uiFontSizes[textFontSize];
  }

  if (uiTextVariantFontSizes.containsKey(variant)) {
    return uiTextVariantFontSizes[variant];
  }

  return UiFontSizes.none;
}
