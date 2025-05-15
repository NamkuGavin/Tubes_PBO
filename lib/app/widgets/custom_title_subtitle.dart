import 'package:flutter/material.dart';

class CustomTitleSubtitle extends StatelessWidget {
  final String title;
  final String subtitle;
  final TextStyle titleStyle;
  final TextStyle subtitleStyle;
  const CustomTitleSubtitle(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.titleStyle,
      required this.subtitleStyle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: titleStyle),
        Text(
          subtitle,
          style: subtitleStyle,
        ),
      ],
    );
  }
}
