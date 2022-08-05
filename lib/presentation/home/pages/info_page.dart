import 'package:flutter/material.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/info_card.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  static const route = '/infoPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Info'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: List.generate(
              listInfo.length,
              (index) => InfoCard(
                title: listInfo[index].title,
                date: listInfo[index].date,
                description: listInfo[index].description,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

final listInfo = [
  Info(
    title: 'Pemberitahuan Libur Kegiatan Edukasi Perihal UAS',
    description:
        '''Lorem ipsum dolor sit amet consectetur adipisicing elit. Similique eaque nemo voluptatem perspiciatis quibusdam nobis pariatur laborum earum omnis aliquam quaerat inventore voluptate qui mollitia doloribus distinctio, soluta nisi cum. Lorem ipsum dolor sit amet consectetur adipisicing elit. Similique eaque nemo voluptatem perspiciatis quibusdam nobis pariatur laborum earum omnis aliquam quaerat inventore voluptate qui mollitia doloribus distinctio, soluta nisi cum.\n\n\nLorem ipsum dolor sit amet consectetur adipisicing elit. Similique eaque nemo voluptatem perspiciatis quibusdam nobis pariatur laborum earum omnis aliquam quaerat inventore voluptate qui mollitia doloribus distinctio, soluta nisi cum. Lorem ipsum dolor sit amet consectetur adipisicing elit. Similique eaque nemo voluptatem perspiciatis quibusdam nobis pariatur laborum earum omnis aliquam quaerat inventore voluptate qui mollitia doloribus distinctio, soluta nisi cum. Lorem ipsum dolor sit amet consectetur adipisicing elit. Similique eaque nemo voluptatem perspiciatis quibusdam nobis pariatur laborum earum omnis aliquam quaerat inventore voluptate qui mollitia doloribus distinctio, soluta nisi cum. Lorem ipsum dolor sit amet consectetur adipisicing elit. Similique eaque nemo voluptatem perspiciatis quibusdam nobis pariatur laborum earum omnis aliquam quaerat inventore voluptate qui mollitia doloribus distinctio, soluta nisi cum.''',
    date: 'Senin, 27 Mei 2022',
  ),
  Info(
    title: 'Pemberitahuan Libur Kegiatan Edukasi Perihal UAS',
    description:
        '''Lorem ipsum dolor sit amet consectetur adipisicing elit. Similique eaque nemo voluptatem perspiciatis quibusdam nobis pariatur laborum earum omnis aliquam quaerat inventore voluptate qui mollitia doloribus distinctio, soluta nisi cum. Lorem ipsum dolor sit amet consectetur adipisicing elit. Similique eaque nemo voluptatem perspiciatis quibusdam nobis pariatur laborum earum omnis aliquam quaerat inventore voluptate qui mollitia doloribus distinctio, soluta nisi cum.\n\n\nLorem ipsum dolor sit amet consectetur adipisicing elit. Similique eaque nemo voluptatem perspiciatis quibusdam nobis pariatur laborum earum omnis aliquam quaerat inventore voluptate qui mollitia doloribus distinctio, soluta nisi cum. Lorem ipsum dolor sit amet consectetur adipisicing elit. Similique eaque nemo voluptatem perspiciatis quibusdam nobis pariatur laborum earum omnis aliquam quaerat inventore voluptate qui mollitia doloribus distinctio, soluta nisi cum. Lorem ipsum dolor sit amet consectetur adipisicing elit. Similique eaque nemo voluptatem perspiciatis quibusdam nobis pariatur laborum earum omnis aliquam quaerat inventore voluptate qui mollitia doloribus distinctio, soluta nisi cum. Lorem ipsum dolor sit amet consectetur adipisicing elit. Similique eaque nemo voluptatem perspiciatis quibusdam nobis pariatur laborum earum omnis aliquam quaerat inventore voluptate qui mollitia doloribus distinctio, soluta nisi cum.''',
    date: 'Senin, 27 Mei 2022',
  ),
  Info(
    title: 'Pemberitahuan Libur Kegiatan Edukasi Perihal UAS',
    description:
        '''Lorem ipsum dolor sit amet consectetur adipisicing elit. Similique eaque nemo voluptatem perspiciatis quibusdam nobis pariatur laborum earum omnis aliquam quaerat inventore voluptate qui mollitia doloribus distinctio, soluta nisi cum. Lorem ipsum dolor sit amet consectetur adipisicing elit. Similique eaque nemo voluptatem perspiciatis quibusdam nobis pariatur laborum earum omnis aliquam quaerat inventore voluptate qui mollitia doloribus distinctio, soluta nisi cum.\n\n\nLorem ipsum dolor sit amet consectetur adipisicing elit. Similique eaque nemo voluptatem perspiciatis quibusdam nobis pariatur laborum earum omnis aliquam quaerat inventore voluptate qui mollitia doloribus distinctio, soluta nisi cum. Lorem ipsum dolor sit amet consectetur adipisicing elit. Similique eaque nemo voluptatem perspiciatis quibusdam nobis pariatur laborum earum omnis aliquam quaerat inventore voluptate qui mollitia doloribus distinctio, soluta nisi cum. Lorem ipsum dolor sit amet consectetur adipisicing elit. Similique eaque nemo voluptatem perspiciatis quibusdam nobis pariatur laborum earum omnis aliquam quaerat inventore voluptate qui mollitia doloribus distinctio, soluta nisi cum. Lorem ipsum dolor sit amet consectetur adipisicing elit. Similique eaque nemo voluptatem perspiciatis quibusdam nobis pariatur laborum earum omnis aliquam quaerat inventore voluptate qui mollitia doloribus distinctio, soluta nisi cum.''',
    date: 'Senin, 27 Mei 2022',
  ),
  Info(
    title: 'Pemberitahuan Libur Kegiatan Edukasi Perihal UAS',
    description:
        '''Lorem ipsum dolor sit amet consectetur adipisicing elit. Similique eaque nemo voluptatem perspiciatis quibusdam nobis pariatur laborum earum omnis aliquam quaerat inventore voluptate qui mollitia doloribus distinctio, soluta nisi cum. Lorem ipsum dolor sit amet consectetur adipisicing elit. Similique eaque nemo voluptatem perspiciatis quibusdam nobis pariatur laborum earum omnis aliquam quaerat inventore voluptate qui mollitia doloribus distinctio, soluta nisi cum.\n\n\nLorem ipsum dolor sit amet consectetur adipisicing elit. Similique eaque nemo voluptatem perspiciatis quibusdam nobis pariatur laborum earum omnis aliquam quaerat inventore voluptate qui mollitia doloribus distinctio, soluta nisi cum. Lorem ipsum dolor sit amet consectetur adipisicing elit. Similique eaque nemo voluptatem perspiciatis quibusdam nobis pariatur laborum earum omnis aliquam quaerat inventore voluptate qui mollitia doloribus distinctio, soluta nisi cum. Lorem ipsum dolor sit amet consectetur adipisicing elit. Similique eaque nemo voluptatem perspiciatis quibusdam nobis pariatur laborum earum omnis aliquam quaerat inventore voluptate qui mollitia doloribus distinctio, soluta nisi cum. Lorem ipsum dolor sit amet consectetur adipisicing elit. Similique eaque nemo voluptatem perspiciatis quibusdam nobis pariatur laborum earum omnis aliquam quaerat inventore voluptate qui mollitia doloribus distinctio, soluta nisi cum.''',
    date: 'Senin, 27 Mei 2022',
  ),
  Info(
    title: 'Pemberitahuan Libur Kegiatan Edukasi Perihal UAS',
    description:
        '''Lorem ipsum dolor sit amet consectetur adipisicing elit. Similique eaque nemo voluptatem perspiciatis quibusdam nobis pariatur laborum earum omnis aliquam quaerat inventore voluptate qui mollitia doloribus distinctio, soluta nisi cum. Lorem ipsum dolor sit amet consectetur adipisicing elit. Similique eaque nemo voluptatem perspiciatis quibusdam nobis pariatur laborum earum omnis aliquam quaerat inventore voluptate qui mollitia doloribus distinctio, soluta nisi cum.\n\n\nLorem ipsum dolor sit amet consectetur adipisicing elit. Similique eaque nemo voluptatem perspiciatis quibusdam nobis pariatur laborum earum omnis aliquam quaerat inventore voluptate qui mollitia doloribus distinctio, soluta nisi cum. Lorem ipsum dolor sit amet consectetur adipisicing elit. Similique eaque nemo voluptatem perspiciatis quibusdam nobis pariatur laborum earum omnis aliquam quaerat inventore voluptate qui mollitia doloribus distinctio, soluta nisi cum. Lorem ipsum dolor sit amet consectetur adipisicing elit. Similique eaque nemo voluptatem perspiciatis quibusdam nobis pariatur laborum earum omnis aliquam quaerat inventore voluptate qui mollitia doloribus distinctio, soluta nisi cum. Lorem ipsum dolor sit amet consectetur adipisicing elit. Similique eaque nemo voluptatem perspiciatis quibusdam nobis pariatur laborum earum omnis aliquam quaerat inventore voluptate qui mollitia doloribus distinctio, soluta nisi cum.''',
    date: 'Senin, 27 Mei 2022',
  ),
  Info(
    title: 'Pemberitahuan Libur Kegiatan Edukasi Perihal UAS',
    description:
        '''Lorem ipsum dolor sit amet consectetur adipisicing elit. Similique eaque nemo voluptatem perspiciatis quibusdam nobis pariatur laborum earum omnis aliquam quaerat inventore voluptate qui mollitia doloribus distinctio, soluta nisi cum. Lorem ipsum dolor sit amet consectetur adipisicing elit. Similique eaque nemo voluptatem perspiciatis quibusdam nobis pariatur laborum earum omnis aliquam quaerat inventore voluptate qui mollitia doloribus distinctio, soluta nisi cum.\n\n\nLorem ipsum dolor sit amet consectetur adipisicing elit. Similique eaque nemo voluptatem perspiciatis quibusdam nobis pariatur laborum earum omnis aliquam quaerat inventore voluptate qui mollitia doloribus distinctio, soluta nisi cum. Lorem ipsum dolor sit amet consectetur adipisicing elit. Similique eaque nemo voluptatem perspiciatis quibusdam nobis pariatur laborum earum omnis aliquam quaerat inventore voluptate qui mollitia doloribus distinctio, soluta nisi cum. Lorem ipsum dolor sit amet consectetur adipisicing elit. Similique eaque nemo voluptatem perspiciatis quibusdam nobis pariatur laborum earum omnis aliquam quaerat inventore voluptate qui mollitia doloribus distinctio, soluta nisi cum. Lorem ipsum dolor sit amet consectetur adipisicing elit. Similique eaque nemo voluptatem perspiciatis quibusdam nobis pariatur laborum earum omnis aliquam quaerat inventore voluptate qui mollitia doloribus distinctio, soluta nisi cum.''',
    date: 'Senin, 27 Mei 2022',
  ),
  Info(
    title: 'Pemberitahuan Libur Kegiatan Edukasi Perihal UAS',
    description:
        '''Lorem ipsum dolor sit amet consectetur adipisicing elit. Similique eaque nemo voluptatem perspiciatis quibusdam nobis pariatur laborum earum omnis aliquam quaerat inventore voluptate qui mollitia doloribus distinctio, soluta nisi cum. Lorem ipsum dolor sit amet consectetur adipisicing elit. Similique eaque nemo voluptatem perspiciatis quibusdam nobis pariatur laborum earum omnis aliquam quaerat inventore voluptate qui mollitia doloribus distinctio, soluta nisi cum.\n\n\nLorem ipsum dolor sit amet consectetur adipisicing elit. Similique eaque nemo voluptatem perspiciatis quibusdam nobis pariatur laborum earum omnis aliquam quaerat inventore voluptate qui mollitia doloribus distinctio, soluta nisi cum. Lorem ipsum dolor sit amet consectetur adipisicing elit. Similique eaque nemo voluptatem perspiciatis quibusdam nobis pariatur laborum earum omnis aliquam quaerat inventore voluptate qui mollitia doloribus distinctio, soluta nisi cum. Lorem ipsum dolor sit amet consectetur adipisicing elit. Similique eaque nemo voluptatem perspiciatis quibusdam nobis pariatur laborum earum omnis aliquam quaerat inventore voluptate qui mollitia doloribus distinctio, soluta nisi cum. Lorem ipsum dolor sit amet consectetur adipisicing elit. Similique eaque nemo voluptatem perspiciatis quibusdam nobis pariatur laborum earum omnis aliquam quaerat inventore voluptate qui mollitia doloribus distinctio, soluta nisi cum.''',
    date: 'Senin, 27 Mei 2022',
  ),
];

class Info {
  Info({
    required this.title,
    required this.description,
    required this.date,
  });

  final String title;
  final String description;
  final String date;
}
