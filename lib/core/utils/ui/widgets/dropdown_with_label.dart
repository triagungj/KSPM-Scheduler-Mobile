import 'package:flutter/material.dart';

class DropdownWithLabel extends StatelessWidget {
  const DropdownWithLabel({
    Key? key,
    required this.label,
    required this.list,
    required this.onChange,
    this.value,
  }) : super(key: key);

  final String label;
  final List<DropdownMenuItem<String>> list;
  final void Function(String? value) onChange;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
        const SizedBox(height: 5),
        DropdownButtonFormField(
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.outline,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.outline,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.onSurface,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            fillColor: Theme.of(context).colorScheme.surface,
          ),
          menuMaxHeight: 270,
          hint: Text(label),
          items: list,
          value: value,
          onChanged: onChange,
        ),
      ],
    );
  }
}
