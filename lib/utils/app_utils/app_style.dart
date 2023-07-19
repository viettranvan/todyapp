import 'package:flutter/rendering.dart';
import 'package:todyapp/utils/index.dart';

class AppTextStyles {
  AppTextStyles._();

  //************** HELVETICA REGULAR ******************
  static TextStyle helveticaBold26 = const TextStyle(
    fontFamily: 'Helvetica',
    fontSize: 26,
    fontWeight: FontWeight.w700,
    color: AppColors.neturalBlack,
  );

  static TextStyle helveticaBold32 = const TextStyle(
    fontFamily: 'Helvetica',
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: AppColors.neturalBlack,
  );

  //************** SF PRO REGULAR ******************
  static TextStyle sfProRegular16 = const TextStyle(
    fontFamily: 'Sf-pro-display',
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.neturalBlack,
  );

  //************** SF PRO MEDIUM ******************
  static TextStyle sfProMedium16 = const TextStyle(
    fontFamily: 'Sf-pro-display',
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.neturalBlack,
  );

  static TextStyle sfProMedium18 = const TextStyle(
    fontFamily: 'Sf-pro-display',
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.neturalBlack,
  );

  //************** SF PRO SEMIBOLD ******************
  static TextStyle sfProSemiBold26 = const TextStyle(
    fontFamily: 'Sf-pro-display',
    fontSize: 26,
    fontWeight: FontWeight.w600,
    color: AppColors.neturalBlack,
  );
}
