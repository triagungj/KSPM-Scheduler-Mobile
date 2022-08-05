import 'package:flutter/material.dart';
import 'package:kspm_scheduler_mobile/presentation/home/pages/info_page.dart';

class InfoDetailPage extends StatelessWidget {
  const InfoDetailPage({
    Key? key,
    required this.info,
  }) : super(key: key);

  final Info info;

  static const route = '/infoDetailPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Info'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                info.date,
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.end,
              ),
              Text(
                info.title,
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 20),
              Text(
                info.description,
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
