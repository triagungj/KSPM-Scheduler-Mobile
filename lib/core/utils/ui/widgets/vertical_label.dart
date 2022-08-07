import 'package:flutter/material.dart';

class VerticalLabel extends StatelessWidget {
  const VerticalLabel({
    Key? key,
    required this.textAbove,
    required this.textBelow,
  }) : super(key: key);

  final String textAbove;
  final String textBelow;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            textAbove,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Theme.of(context).colorScheme.outline,
                  fontStyle: FontStyle.italic,
                ),
          ),
          Text(
            textBelow,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
        ],
      ),
    );
  }
}
