import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/uploaded_file_box.dart';
import 'package:kspm_scheduler_mobile/domain/schedule/entities/session_entitiy.dart';
import 'package:kspm_scheduler_mobile/presentation/input/widgets/session_expansion_widget.dart';
import 'package:varx_design_system/components/buttons/varx_button.dart';

class RequestScheduleContent extends StatefulWidget {
  const RequestScheduleContent({
    Key? key,
    required this.agreementNotifier,
    required this.data,
  }) : super(key: key);

  final ValueNotifier<bool> agreementNotifier;
  final List<SessionDataEntity> data;

  @override
  State<RequestScheduleContent> createState() => _RequestScheduleContentState();
}

class _RequestScheduleContentState extends State<RequestScheduleContent> {
  final sessionNotifier = ValueNotifier<List<SessionDataResultEntity>>([]);

  // Future<void> getList() async {
  //   Future<void>.delayed(Duration(seconds: 1), () {
  //     sessionNotifier.value.add(
  //       widget.data[0].result[2],
  //     );
  //     sessionNotifier.value.add(
  //       widget.data[2].result[3],
  //     );
  //     sessionNotifier.value.add(
  //       widget.data[2].result[2],
  //     );
  //     setState(() {});
  //   });
  // }

  @override
  void initState() {
    super.initState();
    // getList();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Inputkan Jadwal Sedia kamu',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          ValueListenableBuilder<List<SessionDataResultEntity>>(
            valueListenable: sessionNotifier,
            builder: (context, meetValue, _) {
              return Column(
                children: List.generate(
                  widget.data.length,
                  (index) {
                    final data = widget.data[index];
                    return SessionExpansionWidget(
                      title: 'Hari ${data.hari.name.capitalize}',
                      listSession: data.result,
                      sessionNotifier: sessionNotifier,
                    );
                  },
                ),
              );
            },
          ),
          const Divider(height: 10, thickness: 10),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                uploadSection(),
                const SizedBox(height: 10),
                notesSection(),
                const SizedBox(height: 15),
                agreeementSection(),
              ],
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget uploadSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Lampirkan Foto KRS',
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
        Text(
          'Upload file maksimum 2MB',
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Theme.of(context).colorScheme.outline,
              ),
        ),
        const SizedBox(height: 10),
        VarxButton(
          label: 'Upload KRS (Gambar/PDF)',
          prefixIconData: FluentIcons.attach_16_regular,
          type: VarxButtonType.secondary,
          onTap: () {},
        ),
        // const UploadedFileBox(nameFile: 'buktKrs.pdf'),
      ],
    );
  }

  Widget notesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Keterangan',
          style: Theme.of(context)
              .textTheme
              .labelLarge!
              .copyWith(color: Theme.of(context).colorScheme.onSurface),
        ),
        const SizedBox(height: 10),
        TextFormField(
          decoration: InputDecoration(
            hintText:
                '''Tambahkan keterangan bila perlu (Contoh apabila terdapat jadwal di luar perkuliahan)''',
            hintStyle: Theme.of(context).textTheme.bodySmall,
          ),
          maxLines: 5,
        ),
      ],
    );
  }

  Widget agreeementSection() {
    return ValueListenableBuilder<bool>(
      valueListenable: widget.agreementNotifier,
      builder: (context, _value, _widget) {
        return InkWell(
          onTap: () {
            widget.agreementNotifier.value = !_value;
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Checkbox(
                  value: widget.agreementNotifier.value,
                  onChanged: (value) {
                    widget.agreementNotifier.value = !_value;
                  },
                ),
                const Expanded(
                  child: Text(
                    '''Saya telah mengisi data dengan teliti, jujur, dan benar. Apabila jadwal terdapat kekeliruan yang terbukti disengaja, maka saya siap menerima konsekuensi yang akan diberikan.''',
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
