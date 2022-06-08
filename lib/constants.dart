import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

var authTextFieldDecoration = InputDecoration(
    errorStyle: TextStyle(fontSize: 10.sp),
    // contentPadding: EdgeInsets.symmetric(vertical: 1.2.h, horizontal: 2.5.h),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(1.h),
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(1.h),
      ),
      borderSide: BorderSide(width: 0.6.w, color: Colors.blue),
    ),
    focusColor: Colors.blue);

Color kblue = Color(0xFF004AAD);
Color kwhite = Colors.white;
Color kblack = Colors.black;
Color kbrown = Color(0xFF795548);
Color kbrown300 = Color(0xFF8D6E63);
Color kgrey = Color(0xFFC0C0C0);
