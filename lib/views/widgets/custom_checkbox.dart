import 'dart:ui';

import 'package:flutter/material.dart';

class CustomCheckbox extends FormField<bool> {
  CustomCheckbox({
    FormFieldValidator<bool>? validator,
  }) : super(
            validator: validator,
            initialValue: false,
            builder: (state) {
              return CheckboxListTile(
                  title: Text(
                      'By Creating an account you have to agree with our terms and conditions'),
                  subtitle: state.hasError
                      ? Text(state.errorText ?? '',
                          style: TextStyle(color: Colors.red))
                      : SizedBox(),
                  value: state.value,
                  onChanged: (v) {
                    state.didChange(v);
                  });
            });
}
