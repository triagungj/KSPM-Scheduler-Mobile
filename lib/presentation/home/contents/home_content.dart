import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/home_banner.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/info_card.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/title_label.dart';
import 'package:kspm_scheduler_mobile/presentation/home/pages/info_page.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const HomeBanner(),
          const Divider(thickness: 3),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Selamat Datang,',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                Text(
                  'Tri Agung Jiwandono',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Jadwal Edukasi Harian saya',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        'Pertemuan 1',
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Senin -- Sesi 2 -- (10.40 s.d 12.10)',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Pertemuan 2',
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Jumat -- Sesi 3 -- (13.00 s.d 14.20)',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(thickness: 3),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: TitleLabel(
              title: 'Info Terbaru',
              onTapAll: () => Get.toNamed<void>(InfoPage.route),
              child: Column(
                children: List.generate(
                  listInfo.length > 3 ? 3 : listInfo.length,
                  (index) => InfoCard(
                    title: listInfo[index].title,
                    date: listInfo[index].date,
                    description: listInfo[index].description,
                    // onTap: ,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}