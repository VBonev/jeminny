import 'package:flutter/material.dart';

class TextStyles {
  static const errorStyle = TextStyle(
    fontWeight: FontWeight.w500,
    color: Colors.black,
    fontSize: 20,
  );

  static const hint = TextStyle(
    fontWeight: FontWeight.w300,
    color: AppColors.grey90,
    fontSize: 16,
  );

  static const body1 = TextStyle(
    fontWeight: FontWeight.w400,
    color: Colors.black,
    fontSize: 17,
  );

  static const caption = TextStyle(
    fontWeight: FontWeight.w400,
    color: AppColors.grey70,
    fontSize: 13,
  );

  static const subheading = TextStyle(
    fontWeight: FontWeight.w700,
    color: Colors.black,
    fontSize: 15,
  );
}

class AppColors {
  static const variationsNegative50 = Color(0xffFB303C);
  static const pink = Color(0xffFF3F82);
  static const grey90 = Color(0xff424242);
  static const grey70 = Color(0xff757575);
  static const grey40 = Color(0xffE0E0E0);
  static const boxShadow =  Color(0x1F190134);
}
