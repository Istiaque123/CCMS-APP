import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice_one/feature/common/useful_methode.dart';

// StateProvider to manage password visibility
final visibilityProvider = StateProvider<bool>((ref) => true);

// -------------------------------------------------------------------------
class KeybordInputSection extends ConsumerStatefulWidget {
  final TextEditingController inputTextEditorController;
  final String hintText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final bool isPasswordFeild;
  final bool isRequired;
  final bool isEnabled;

  const KeybordInputSection({
    super.key,
    required this.inputTextEditorController,
    required this.hintText,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.isPasswordFeild = false,
    this.isRequired = false,
    this.isEnabled = false
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
      readOnly: widget.isEnabled,
      decoration: InputDecoration(
        label: RichText(
          text: TextSpan(
            text: widget.hintText,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 20,
              fontFamily: 'Kalpurush'
            ),
            children: widget.isRequired
                ? [
                    const TextSpan(
                      text: ' *',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ]
                : [],
          )
          ),
                
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

class FormCheckTextFeild extends ConsumerWidget {
  const FormCheckTextFeild({
    
    super.key,
    required this.controller,
    this.readOnly = false,
    this.contentPadding = const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
    });

  // ! ----------------------------- Attributes --------------------------------------

  final TextEditingController controller;
  final bool readOnly;
  final EdgeInsets contentPadding;
  
  // ? ---------------------------------------------
  OutlineInputBorder border (){
    return OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.green),
        );
  }


  // ! ----------------------------- Attributes --------------------------------------

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      controller: controller,
      
      readOnly: readOnly,
      style: formPageTextStyle(),
      decoration: InputDecoration(
        contentPadding: contentPadding,
        border: border(),
        enabledBorder: border(),
        focusedBorder: border(),
      ),
    );
  }
}