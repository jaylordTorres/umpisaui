import 'package:flutter/material.dart';
import 'package:umpui/core.dart';
import 'package:umpui/rental/RuiConstant.dart';

class RuiButton extends StatelessWidget {
  static String name = 'RuiButton';
  final String title;
  final Function onPressed;
  final RuiButtonType type;
  const RuiButton(
      {Key key,
      this.title,
      this.onPressed,
      this.type = RuiButtonType.nonePirmary})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var variant, color, shape, size, padding;
    // targeted  approach
    switch (this.type) {
      case RuiButtonType.containedPrimary:
        {
          variant = UiButtonVariant.contained;
          color = UiButtonColor.primary;
          shape = UiButtonShape.rounded;
          size = UiButtonSize.md;
          padding = UiButtonPaddding.sm;
        }
        break;
      case RuiButtonType.outlinedPrimary:
        {
          variant = UiButtonVariant.outlined;
          color = UiButtonColor.primary;
          shape = UiButtonShape.rounded;
          size = UiButtonSize.md;
          padding = UiButtonPaddding.sm;
        }
        break;
      case RuiButtonType.nonePirmary:
        {
          variant = UiButtonVariant.none;
          color = UiButtonColor.primary;
          shape = UiButtonShape.rounded;
          size = UiButtonSize.md;
          padding = UiButtonPaddding.sm;
        }
        break;
      case RuiButtonType.nonePirmarySm:
        {
          variant = UiButtonVariant.none;
          color = UiButtonColor.primary;
          shape = UiButtonShape.rounded;
          size = UiButtonSize.sm;
          padding = UiButtonPaddding.sm;
        }
        break;
      case RuiButtonType.noneSecondary:
        {
          variant = UiButtonVariant.none;
          color = UiButtonColor.secondary;
          shape = UiButtonShape.rounded;
          size = UiButtonSize.lg;
          padding = UiButtonPaddding.sm;
        }
        break;

      default:
        {}
    }
    return UiButton(
      title: this.title,
      onPressed: this.onPressed,
      variant: variant,
      color: color,
      shape: shape,
      size: size,
      padding: padding,
    );
  }
}
