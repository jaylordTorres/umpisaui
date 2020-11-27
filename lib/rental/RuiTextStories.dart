import 'package:storybook_flutter/storybook_flutter.dart';

import 'RuiConstant.dart';
import 'RuiText.dart';

List<Story> ruiTextStories = [
  Story(
    name: "${RuiText.name}",
    builder: (_, k) => RuiText(
      title: k.text('title', initial: "sample text content"),
      type: k.options(
        'type',
        initial: RuiTextType.appBarTitle,
        options: RuiTextType.values
            .map((type) => Option(type.toString(), type))
            .toList(),
      ),
    ),
  ),
];
