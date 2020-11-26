import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:flutter/material.dart';

import '../constants/variables.dart';

import 'UiTextConstant.dart';
import 'UiText.dart';

List<Story> uiTextStories = [
  Story(
      name: "${UiText.name}",
      builder: (_, k) => UiText(
            title: k.text('title', initial: "Title Text"),
            variant: k.options(
              'variant',
              initial: UiTextVariant.h2,
              options: UiTextVariant.values
                  .map((variant) => Option(variant.toString(), variant))
                  .toList(),
            ),
            textColor: k.options(
              'textColor',
              initial: UiTextColor.none,
              options: UiTextColor.values
                  .map((textColor) => Option(textColor.toString(), textColor))
                  .toList(),
            ),
            textFontSize: k.options(
              'textFontSize',
              initial: UiSizes.none,
              options: UiSizes.values
                  .map((sizes) => Option(sizes.toString(), sizes))
                  .toList(),
            ),
            textFontWeight: k.options(
              'textFontWeight',
              initial: UiTextFontWeight.sm,
              options: UiTextFontWeight.values
                  .map((sizes) => Option(sizes.toString(), sizes))
                  .toList(),
            ),

            // fontSize: k.slider('fontSize', initial: 12.0, min: 5.0, max: 200.0),
          ))
];
