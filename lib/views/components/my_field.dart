import 'package:flutter/material.dart';

class MyField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final bool obscureText;
  final Function? myTextValidator;
  const MyField(
      {Key? key,
      required this.controller,
      required this.labelText,
      this.hintText = "",
      this.obscureText = false,
      this.myTextValidator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 20.0,
        shadowColor: Colors.grey[400],
        child: TextFormField(
          cursorWidth: 20,
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            labelText: labelText,
            hintText: hintText,
            border: const OutlineInputBorder(),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return "$labelText is required";
            }
            if (myTextValidator != null) {
              return myTextValidator!(value);
            }
            return null;
          },
        ),
      ),
    );
  }
}
