import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustonInputField extends StatefulWidget {
  final void Function(String)? onChanged;
  final String label;
  final TextInputType? inputType;
  final bool isPassword;
  final String? Function(String?)? validator;

  const CustonInputField({
    super.key,
    this.onChanged,
    required this.label,
    this.inputType,
    this.isPassword = false,
    this.validator,
  });

  @override
  State<CustonInputField> createState() => _CustonInputFieldState();
}

class _CustonInputFieldState extends State<CustonInputField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
        validator: widget.validator,
        initialValue: '',
        autovalidateMode: AutovalidateMode.onUserInteraction,
        builder: (state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                obscureText: _obscureText,
                keyboardType: widget.inputType,
                onChanged: (text) {
                  if (widget.validator != null) {
                    // ignore: invalid_use_of_protected_member
                    state.setValue(text);
                    state.validate();
                    
                  }
                  if (widget.onChanged != null) {
                    widget.onChanged!(text);
                  }
                },
                decoration: InputDecoration(
                  labelText: widget.label,
                  suffixIcon: widget.isPassword
                      ? CupertinoButton(
                          child: Icon(
                            _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        )
                      : Container(
                          width: 0,
                        ),
                ),
              ),
              if (state.hasError)
                Text(
                  state.errorText!,
                  style: const TextStyle(
                    color: Colors.redAccent,
                    fontSize: 12,
                  ),
                ),
            ],
          );
        });
  }
}
