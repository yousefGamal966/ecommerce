import 'package:flutter/material.dart';

typedef Validator = String? Function(String?);

class CustomFormField extends StatelessWidget {
  String hintText;
  TextInputType keyboardType;
  bool secure;
  Validator? validator;
  TextEditingController? controller;
  CustomFormField(
      {required this.hintText,
      this.keyboardType = TextInputType.text,
      this.secure = false,
        this.validator,
        this.controller

      });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: TextFormField(
        validator: validator,
        controller:controller,
        obscureText: secure,
        keyboardType: keyboardType,
        decoration: InputDecoration(hintText: hintText),
      ),
    );
  }
}
