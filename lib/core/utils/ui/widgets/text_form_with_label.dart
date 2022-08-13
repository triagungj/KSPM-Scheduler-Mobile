import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class TextFormWithLabel extends StatelessWidget {
  const TextFormWithLabel({
    Key? key,
    required this.label,
    this.controller,
    this.isEnabled = true,
    this.dropdown = false,
    this.obsecureText = false, this.action,
  }) : super(key: key);

  final String label;
  final TextEditingController? controller;
  final bool isEnabled;
  final bool dropdown;
  final bool obsecureText;
  final TextInputAction? action;

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
        TextFormField(
          controller: controller,
          enabled: isEnabled,
          obscureText: obsecureText,
          textInputAction: action,
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
            suffixIcon: dropdown == true
                ? const Icon(FluentIcons.chevron_down_16_filled)
                : null,
          ),
        ),
      ],
    );
  }
}
