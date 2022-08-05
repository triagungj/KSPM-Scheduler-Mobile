import 'package:flutter/material.dart';
import 'package:kspm_scheduler_mobile/presentation/home/contents/home_content.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: HomeContent()),
    );
  }
}
