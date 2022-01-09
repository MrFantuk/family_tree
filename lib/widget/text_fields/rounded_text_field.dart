import 'package:flutter/material.dart';

class RoundedTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final FormFieldValidator<String>? validateFunction;
  final IconData icon;
  final String hintText;
  final bool isPassword;
  final bool isEmail;
  const RoundedTextField(
      {Key? key,
      required this.icon,
      required this.hintText,
      required this.isPassword,
      required this.isEmail,
      required this.textEditingController,
      this.validateFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.blueGrey.withOpacity(.5),
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextFormField(
          controller: textEditingController,
          style: const TextStyle(color: Colors.black),
          cursorColor: Colors.black,
          obscureText: isPassword,
          keyboardType:
              isEmail ? TextInputType.emailAddress : TextInputType.text,
          decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              color: Colors.black,
            ),
            border: InputBorder.none,
            hintMaxLines: 1,
            hintText: hintText,
            hintStyle: const TextStyle(fontSize: 14, color: Colors.black),
          ),
          validator: validateFunction,
        ),
      ),
    );
  }
}
