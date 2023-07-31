import 'package:flutter/material.dart';

import '../constant.dart';

class CommonButton extends StatelessWidget {
  String btnName;
  double? horiPedd;
  double? vertyPedd;
  Function()? onTap;

  CommonButton(
      {required this.btnName,
      this.horiPedd = 10.0,
      this.vertyPedd = 10.0,
      this.onTap,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:
            EdgeInsets.symmetric(horizontal: horiPedd!, vertical: vertyPedd!),
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: blueColor, borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            btnName,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              color: whiteColor,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
