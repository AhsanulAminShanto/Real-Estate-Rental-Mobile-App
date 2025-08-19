import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: AppColors.primary,
    textTheme: GoogleFonts.poppinsTextTheme(),
    // Customize further
  );
}