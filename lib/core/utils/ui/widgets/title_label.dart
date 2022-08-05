import 'package:flutter/material.dart';

class TitleLabel extends StatelessWidget {
  const TitleLabel({
    Key? key,
    required this.title,
    required this.child,
    this.onTapAll,
  }) : super(key: key);

  final String title;
  final Widget child;
  final void Function()? onTapAll;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                InkWell(
                  onTap: onTapAll,
                  child: Text(
                    'Lihat Semua',
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
        const SizedBox(height: 5),
        SizedBox(
          child: child,
        )
      ],
    );
  }
}
