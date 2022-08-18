import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProfileShimmer extends StatelessWidget {
  const ProfileShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).colorScheme.surfaceVariant,
      highlightColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          Center(
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.surface,
              ),
            ),
          ),
          const SizedBox(height: 15),
          Container(
            height: 16,
            width: 200,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 14,
            width: 120,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(height: 5),
          Container(
            height: 13,
            width: 100,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ],
      ),
    );
  }
}
