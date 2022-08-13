import 'package:flutter/material.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/session_expansion_tile.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/uploaded_file_box.dart';

class RequestScheduleContent extends StatefulWidget {
  const RequestScheduleContent({
    Key? key,
    required this.agreementNotifier,
  }) : super(key: key);

  final ValueNotifier<bool> agreementNotifier;

  @override
  State<RequestScheduleContent> createState() => _RequestScheduleContentState();
}

class _RequestScheduleContentState extends State<RequestScheduleContent> {
  final meetNofifier = ValueNotifier<List<Meet>>([]);

  @override
  Widget build(BuildContext context) {
    final listString = [
      'Hari Senin',
      'Hari Selasa',
      'Hari Rabu',
      'Hari Kamis',
      'Hari Jumat',
    ];

    final listSession = [
      Session(sessionName: '09:00 - 10.30', sessionStatus: true),
      Session(sessionName: '09:00 - 10.30', sessionStatus: false),
      Session(sessionName: '09:00 - 10.30', sessionStatus: false),
      Session(sessionName: '09:00 - 10.30', sessionStatus: false),
    ];
    meetNofifier.value = [
      Meet(title: listString[0], listSession: listSession),
      Meet(title: listString[1], listSession: listSession),
      Meet(title: listString[2], listSession: listSession),
      Meet(title: listString[3], listSession: listSession),
      Meet(title: listString[4], listSession: listSession),
    ];

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
          ValueListenableBuilder<List<Meet>>(
            valueListenable: meetNofifier,
            builder: (context, meetValue, _) {
              return Column(
                children: List.generate(
                  meetValue.length,
                  (index) => SessionExpansionTile(
                    title: meetValue[index].title,
                    listSession: listSession,
                  ),
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
        // VarxButton(
        //   label: 'Upload KRS (Gambar/PDF)',
        //   prefixIconData: FluentIcons.attach_16_regular,
        //   type: VarxButtonType.secondary,
        //   onTap: () {},
        // ),
        const UploadedFileBox(nameFile: 'buktKrs.pdf'),
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
