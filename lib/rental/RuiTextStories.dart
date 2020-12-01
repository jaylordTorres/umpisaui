import 'package:storybook_flutter/storybook_flutter.dart';
import 'RuiText.dart';

List<Story> ruiTextStories = [
  Story(
    name: "${RuiText.name} - appBarTitle",
    builder: (_, k) => RuiText(
      appBarTitle: k.text('appBarTitle', initial: "Change security questions"),
    ),
  ),
];
