import 'package:flutter/material.dart';

import '../../constants/fontWeight.dart';
import '../../constants/variables.dart';
import '../../UiTheme.dart';

import '../UiTextConstant.dart';

Map<UiTextFontWeight, FontWeight> uiFontWeights = {
  UiTextFontWeight.xl: UiFontWeights.xl,
  UiTextFontWeight.lg: UiFontWeights.lg,
  UiTextFontWeight.md: UiFontWeights.md,
  UiTextFontWeight.sm: UiFontWeights.sm,
  UiTextFontWeight.xs: UiFontWeights.xs,
};

Map<UiTextVariant, FontWeight> uiTextVariantFontWeights = {
  UiTextVariant.h1: UiFontWeights.xl,
  UiTextVariant.h2: UiFontWeights.xl,
  UiTextVariant.h3: UiFontWeights.xl,
  UiTextVariant.body: UiFontWeights.sm,
  UiTextVariant.none: UiFontWeights.none,
};

FontWeight getUiTextFontWeight({
  @required UiTheme theme,
  @required BuildContext context,
  UiTextVariant variant,
  UiTextFontWeight textFontWeight,
  FontWeight value,
}) {
  if (value != null) {
    return value;
  }

  if (textFontWeight != null && uiFontWeights.containsKey(textFontWeight)) {
    return uiFontWeights[textFontWeight];
  }

  if (uiTextVariantFontWeights.containsKey(variant)) {
    return uiTextVariantFontWeights[variant];
  }

  return UiFontWeights.none;
}
