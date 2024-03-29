import 'package:design_system/src/core/extensions/context_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EzoomTextField extends StatelessWidget {
  final String labelText;
  final String? initialValue;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onPressedSuffix;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscureText;
  final VoidCallback? onTap;
  final bool readOnly;

  const EzoomTextField({
    super.key,
    required this.labelText,
    this.initialValue,
    this.prefixIcon,
    this.suffixIcon,
    this.onPressedSuffix,
    this.onChanged,
    this.controller,
    this.validator,
    this.onSaved,
    this.obscureText = false,
    this.onTap,
    this.readOnly = false,
    this.keyboardType,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      onTap: onTap,
      readOnly: readOnly,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      initialValue: initialValue,
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      onSaved: onSaved,
      obscureText: obscureText,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: context.colors.danger!,
          ),
        ),
        errorStyle: TextStyle(
          color: context.colors.danger,
        ),
        labelText: labelText,
        prefixIcon: getPrefixIcon(),
        suffixIcon: getSuffixIcon(),
      ),
    );
  }

  Widget? getPrefixIcon() {
    if (prefixIcon == null) {
      return null;
    }
    return Icon(prefixIcon);
  }

  Widget? getSuffixIcon() {
    if (suffixIcon == null) {
      return null;
    }
    return IconButton(
      icon: Icon(
        suffixIcon,
      ),
      onPressed: onPressedSuffix,
    );
  }
}
