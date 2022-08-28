import 'package:flutter/material.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/state_info.dart';

class ServerExceptionWidget extends StatelessWidget {
  const ServerExceptionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: StateInfo(
        title: 'Server Error',
        type: StateInfoType.serverError,
        subTitle:
            '''Terjadi keasalahan pada server. Coba untuk refresh kembali atau hubungi petugas yang bersangkuatan.''',
      ),
    );
  }
}
