import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../UiTheme.dart';
import '../UiButtonConstant.dart';

Map<UiButtonShape, ShapeBorder> uiButtonShapes = {
  UiButtonShape.circular:
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(999.0)),
  UiButtonShape.rounded:
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
  UiButtonShape.squared: null
};

Map<UiButtonShape, ShapeBorder> uiButtonShapesOutlined = {
  UiButtonShape.circular: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(999.0),
      side:
          BorderSide(color: Colors.red, style: BorderStyle.solid, width: 2.0)),
  UiButtonShape.rounded: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
      side:
          BorderSide(color: Colors.red, style: BorderStyle.solid, width: 2.0)),
  UiButtonShape.squared: null
};

Map<UiButtonShape, BorderRadius> uiButtonShapesRadius = {
  UiButtonShape.circular: BorderRadius.circular(999.0),
  UiButtonShape.rounded: BorderRadius.circular(8.0),
  UiButtonShape.squared: null
};

Map<UiButtonColor, Color> uiButtonBorderColors = {
  UiButtonColor.primary: UiColors.primary,
  UiButtonColor.secondary: UiColors.secondary,
  UiButtonColor.success: UiColors.success,
  UiButtonColor.warning: UiColors.warning,
  UiButtonColor.alert: UiColors.alert,
  // warning:  none must be gone
};

// warning: complicated attributes
ShapeBorder getUiButtonShape(
    {@required UiTheme theme,
    @required BuildContext context,
    UiButtonVariant variant,
    UiButtonShape buttonShape,
    ShapeBorder value,
    UiButtonColor color}) {
  if (value != null) {
    return value;
  }

  if (buttonShape != null && uiButtonShapesRadius.containsKey(buttonShape)) {
    if (variant == UiButtonVariant.outlined &&
        color != null &&
        uiButtonBorderColors.containsKey(color)) {
      return RoundedRectangleBorder(
          borderRadius: uiButtonShapesRadius[buttonShape],
          side: BorderSide(
              color: uiButtonBorderColors[color],
              style: BorderStyle.solid,
              width: 2.0));
    }
    return RoundedRectangleBorder(
      borderRadius: uiButtonShapesRadius[buttonShape],
    );
  }

  return null;
}
