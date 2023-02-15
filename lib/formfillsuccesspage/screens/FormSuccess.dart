import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../reportedprogramspage/screens/Dashboard.dart';
import '../../utils/appbar/AppBar.dart';
import '../../utils/backgroundboxdecoration/BoxDecoration.dart';
import '../../utils/drawer/UserProfileDrawer.dart';
import '../../values/AppColors.dart';

class FormSuccess extends StatelessWidget {
  FormSuccess({super.key});

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget.getAppBar(_key, context),
      body: Scaffold(
        key: _key,
        drawer: const UserProfileDrawer(),
        body: Container(
          decoration: BoxDecorationWidget.getBoxDecoration(),
          child: ListView(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 60),
              ),
              Align(
                alignment: Alignment.center,
                child: Image(
                  image: Image.asset("packages/mannkibaatpackage/lib/assets/formsuccess.png").image,
                  //width: 300,
                  height: 200,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 70),
              ),
              Align(
                  child: Text(
                'Program Reported Successfully',
                style: GoogleFonts.publicSans(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: AppColor().dashboardTextColorDark),
              )),
              const Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              Align(
                child: Text(
                  'Yay! Keep doing the good work !',
                  style: GoogleFonts.publicSans(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: AppColor().dashboardTextColorDark),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 35),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return Dashboard();
                  }), (r) {
                    return false;
                  });
                },
                child: Text(
                  'Go to all programs',
                  style: GoogleFonts.publicSans(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: AppColor().formSuccessText),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
