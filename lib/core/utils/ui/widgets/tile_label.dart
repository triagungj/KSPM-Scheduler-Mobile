import 'package:flutter/material.dart';

class TileLabel extends StatelessWidget {
  const TileLabel({
    Key? key,
    required this.label,
    this.suffixLabel,
  }) : super(key: key);

  final String label;
  final String? suffixLabel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        color: Theme.of(context).colorScheme.primary,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
            ),
            if(suffixLabel != null)
              Text(
                suffixLabel!,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
              ),
          ],
        ),
      ),
    );
  }
}
