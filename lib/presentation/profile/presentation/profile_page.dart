import 'package:flutter/material.dart';
import 'package:kspm_scheduler_mobile/presentation/profile/contents/profile_content.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
      ),
      body: const ProfileContent(),
    );
  }
}
