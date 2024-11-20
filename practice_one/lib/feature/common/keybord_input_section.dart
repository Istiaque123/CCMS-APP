import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// StateProvider to manage password visibility
final visibilityProvider = StateProvider<bool>((ref) => true);

// -------------------------------------------------------------------------
class KeybordInputSection extends ConsumerStatefulWidget {
  final TextEditingController inputTextEditorController;
  final String hintText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final bool isPasswordFeild;

  const KeybordInputSection({
    super.key,
    required this.inputTextEditorController,
    required this.hintText,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.isPasswordFeild = false,
  });

  @override
  ConsumerState<KeybordInputSection> createState() => _KeybordInputSectionState();
}

class _KeybordInputSectionState extends ConsumerState<KeybordInputSection> {
  @override
  Widget build(BuildContext context) {
    // Watch the current visibility state
    final isObscured = ref.watch(visibilityProvider);

    return TextFormField(
      validator: widget.validator,
      controller: widget.inputTextEditorController,
      keyboardType: widget.keyboardType,
      obscureText: widget.isPasswordFeild ? isObscured : false,
      decoration: InputDecoration(
        hintText: widget.hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.black),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.black),
        ),
        // Add suffix icon for password fields
        suffixIcon: widget.isPasswordFeild
            ? IconButton(
                onPressed: () {
                  // Toggle the visibility state
                  ref.read(visibilityProvider.notifier).state =
                      !ref.read(visibilityProvider.notifier).state;
                },
                icon: Icon(
                  isObscured ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey,
                ),
              )
            : null,
      ),
    );
  }
}
