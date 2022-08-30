import 'package:flutter/material.dart';
import 'package:kspm_scheduler_mobile/core/constants/assets_constants.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Aplikasi Penjadwalan Edukasi Harian',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                Text(
                  'Kelompok Studi Pasar Modal',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
                Text(
                  'Universitas Teknologi Yogyakarta',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 80,
            width: 80,
            child: Image.asset(
              AssetsConstants.logoLarge,
            ),
          ),
        ],
      ),
    );
  }
}
