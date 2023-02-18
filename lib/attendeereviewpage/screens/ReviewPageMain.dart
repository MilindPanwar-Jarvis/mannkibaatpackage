import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../formfillsuccesspage/screens/FormSuccess.dart';
import '../../utils/appbar/AppBar.dart';
import '../../utils/backgroundboxdecoration/BoxDecoration.dart';
import '../../utils/buttons/SubmitButton.dart';
import '../../utils/drawer/UserProfileDrawer.dart';
import '../../values/AppColors.dart';
import '../../values/Constants.dart';
import 'BoothAddress.dart';
import 'BoothName.dart';
import 'DescriptionSection.dart';
import 'Images.dart';
import 'TotalAttendee.dart';
import 'VidharSabhaStates.dart';

class AttendeeReviewPage extends StatelessWidget {
  final String? vidhanSabha;
  final String? state;
  final String? totalAttendees;
  final String? booth;
  final String? address;
  final String? description;
  final String? img1;
  final String? img2;

  AttendeeReviewPage(
      {Key? key,
      required this.vidhanSabha,
      required this.state,
      required this.totalAttendees,
      required this.booth,
      required this.address,
      required this.description,
      required this.img1,
      required this.img2})
      : super(key: key);
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBarWidget.getAppBar(_key, context),
        body: Scaffold(
          key: _key,
          drawer: const UserProfileDrawer(),
          body: Container(
            decoration: BoxDecorationWidget.getBoxDecoration(),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 200,
                            child: ListTile(
                              title: Text("समीक्षा",
                                  style: GoogleFonts.publicSans(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                      color: AppColor().textColor)),
                            )),
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.edit),
                            color: AppColor().reviewFormTextColor),
                      ],
                    ),
                    ReviewVidhanAndStates(
                      vidhanSabha: vidhanSabha,
                      state: state,
                    ),
                    const SizedBox(height: 24),
                    ReviewTotalAttendee(totalAttendees: totalAttendees),
                    const SizedBox(height: 24),
                    ReviewBoothName(booth: booth),
                    const SizedBox(height: 24),
                    ReviewBoothAddress(boothAddress: address),
                    const SizedBox(height: 24),
                    ReviewDescription(description: description),
                    const SizedBox(height: 24),
                    ReviewImages(img1: img1, img2: img2),
                    const SizedBox(height: 43),
                    SizedBox(
                      width: Constants.buttonSizeBoxWidth,
                      height: Constants.buttonSizeBoxHeight,
                      child: SubmitButton(onPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FormSuccess()));
                      }),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
