import 'package:storybook_flutter/storybook_flutter.dart';

import 'UiButtonConstant.dart';
import 'UiButton.dart';

List<Story> uiButtonStories = [
  Story(
    // background: Colors.white,
    name: "${UiButton.name}",
    builder: (_, k) => UiButton(
      title: k.text('title', initial: "Partially Paid"),
      variant: k.options(
        'variant',
        initial: UiButtonVariant.none,
        options: UiButtonVariant.values
            .map((variant) => Option(variant.toString(), variant))
            .toList(),
      ),
      size: k.options(
        'size',
        initial: UiButtonSize.lg,
        options: UiButtonSize.values
            .map((size) => Option(size.toString(), size))
            .toList(),
      ),
      padding: k.options(
        'padding',
        initial: UiButtonPaddding.sm,
        options: UiButtonPaddding.values
            .map((padding) => Option(padding.toString(), padding))
            .toList(),
      ),
      margin: k.options(
        'margin',
        initial: UiButtonMargin.sm,
        options: UiButtonMargin.values
            .map((margin) => Option(margin.toString(), margin))
            .toList(),
      ),
      shape: k.options(
        'shape',
        initial: UiButtonShape.rounded,
        options: UiButtonShape.values
            .map((shape) => Option(shape.toString(), shape))
            .toList(),
      ),
      color: k.options(
        'color',
        initial: UiButtonColor.none,
        options: UiButtonColor.values
            .map((color) => Option(color.toString(), color))
            .toList(),
      ),
      onPressed: () {},
    ),
  )
];
