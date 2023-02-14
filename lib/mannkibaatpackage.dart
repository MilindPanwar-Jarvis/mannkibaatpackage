library mannkibaatpackage;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mannkibaatpackage/reportedprogramspage/screens/Dashboard.dart';
import 'package:mannkibaatpackage/values/AppColors.dart';
class MainButton extends StatelessWidget {
  const MainButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          shadowColor: MaterialStateProperty.all(AppColor().buttonShadowColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
          backgroundColor: MaterialStateProperty.all(AppColor().buttonColor),
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (counter) => Dashboard()));
        },
        child: Text(
          "Mann ki Baat",
          style: GoogleFonts.quicksand(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: AppColor().buttonTextColor),
        ));
  }
}
