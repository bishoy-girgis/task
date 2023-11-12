import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  String? hintText;
  TextEditingController? controller;
   CustomTextField({super.key, this.hintText,this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          contentPadding: const EdgeInsets.symmetric(
              horizontal: 140, vertical: 14),
          hintStyle: Theme.of(context).textTheme.bodySmall,
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide:
              BorderSide(color: Theme.of(context).primaryColor))),
    );
  }
}
