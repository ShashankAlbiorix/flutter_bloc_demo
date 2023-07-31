import 'package:flutter/material.dart';

import '../constant.dart';

class CommonTextfield extends StatelessWidget {
  Widget? prefixIcon;
  String hint;
  bool? isSuffix;
  TextEditingController textEditingController;

  CommonTextfield(
      {this.prefixIcon,
      required this.textEditingController,
      required this.hint,
      this.isSuffix = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        controller: textEditingController,
        decoration: InputDecoration(
          hintText: hint,
          contentPadding: EdgeInsets.zero,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: grayColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: blueColor)),
          prefixIcon: prefixIcon,
          suffixIcon: isSuffix!
              ? IconButton(
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  splashRadius: 5,
                  color: blueColor,
                  icon: const Icon(
                    Icons.remove_red_eye_outlined,
                  ))
              : const SizedBox(),
        ),
      ),
    );
  }
}
