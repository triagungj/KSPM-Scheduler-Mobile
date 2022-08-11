import 'package:flutter/material.dart';

class VerticalLabel extends StatelessWidget {
  const VerticalLabel({
    Key? key,
    required this.textAbove,
    required this.textBelow,
    this.textColor,
  }) : super(key: key);

  final String textAbove;
  final String textBelow;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            textAbove,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: textColor ?? Theme.of(context).colorScheme.outline,
                  fontStyle: FontStyle.italic,
                ),
          ),
          Text(
            textBelow,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: textColor ?? Theme.of(context).colorScheme.onSurface,
                ),
          ),
        ],
      ),
    );
  }
}
