
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Textformfield extends StatelessWidget {
  final String hinttext;
  final String labeltext;
  final IconData icons;
  final TextEditingController textEditingController;
  final String? Function(String? value)? formvalidator;

  const Textformfield({
    super.key,
    required this.hinttext,
    required this.labeltext,
    required this.icons,
    this.formvalidator,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, bottom: 30, right: 30),
      child: TextFormField(
        validator: formvalidator,
        controller: textEditingController,
        decoration: InputDecoration(
          labelText: labeltext,
          hintText: hinttext,
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
          ), // Add border
          fillColor: Colors.black, // Add fill color
          filled: true, // Set filled to true for the fill color to take effect
          prefixIcon: Icon(icons), // Add icon at the beginning of the field
        ),
      ),
    );
  }
}
