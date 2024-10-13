import 'package:flutter/material.dart';
import 'package:prototype_3/Components/colors.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  final FormFieldValidator? validator;
  final Widget? trailing;
  const InputField(
      {super.key,
      required this.hintText,
      required this.icon,
      required this.controller,
      this.validator,
      this.trailing});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      width: size.width * .9,
      height: 55,
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(8)),
      child: Center(
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
              hintText: hintText,
              icon: Icon(icon),
              suffixIcon: trailing,
              border: InputBorder.none),
        ),
      ),
    );
  }
}
