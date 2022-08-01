import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartix/core/resources/theme/colors.dart';

class BaseTextField extends StatelessWidget {
  const BaseTextField({
    Key? key,
    this.placeholder = '',
    this.icon,
    this.padding = 16,
    this.onPress,
    this.readOnly,
    this.errorEnabled = false,
    this.errorMessage,
    this.textFocusNode,
    this.textEditingController,
    this.textAlign,
    this.onChanged,
    this.digitsOnly = false,
    this.onPressIcon,
    this.keyboardType = TextInputType.text,
    this.autofocus = false,
    this.obscureText = false,
    this.textCapitalization = TextCapitalization.none,
  }) : super(key: key);

  final String? placeholder;
  final Widget? icon;
  final bool? readOnly;
  final double? padding;
  final void Function()? onPress;
  final bool errorEnabled;
  final String? errorMessage;
  final FocusNode? textFocusNode;
  final dynamic textEditingController;
  final TextAlign? textAlign;
  final Function(String)? onChanged;
  final bool digitsOnly;
  final Function()? onPressIcon;
  final TextInputType keyboardType;
  final bool? autofocus;
  final bool? obscureText;
  final TextCapitalization textCapitalization;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: padding ?? 4),
      child: SizedBox(
        height: (errorEnabled && errorMessage != '') ? 70 : 48,
        child: TextFormField(
          style: const TextStyle(color: ThemeColors.secondary),
          obscureText: obscureText!,
          obscuringCharacter: '*',
          readOnly: readOnly ?? false,
          onChanged: onChanged,
          enableSuggestions: false,
          autocorrect: false,
          keyboardAppearance: Brightness.dark,
          onTap: onPress,
          textAlign: textAlign ?? TextAlign.start,
          focusNode: textFocusNode,
          controller: textEditingController,
          textCapitalization: textCapitalization,
          inputFormatters:
              digitsOnly ? [FilteringTextInputFormatter.digitsOnly] : [FilteringTextInputFormatter.singleLineFormatter],
          keyboardType: keyboardType,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: 14),
            labelText: placeholder,
            labelStyle: const TextStyle(color: ThemeColors.secondary),
            filled: true,
            border: _outlinedBorder,
            enabledBorder: _outlinedBorder,
            focusedBorder: _outlinedBorder,
            helperText: (errorEnabled && errorMessage != '') ? errorMessage : null,
            suffixIcon: InkWell(
              onTap: onPressIcon,
              child: (icon != null)
                  ? Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Container(child: icon),
                    )
                  : const SizedBox.shrink(),
            ),
            suffixIconConstraints: const BoxConstraints(
              minWidth: 10,
              minHeight: 10,
              maxWidth: 80,
              maxHeight: 80,
            ),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder get _outlinedBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: ThemeColors.secondary),
      );
}
