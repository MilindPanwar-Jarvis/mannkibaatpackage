import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Storage/AttendeesFormStorage.dart';
import '../../attendeesformpage/cubit/FetchCubit.dart';
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

class AttendeeReviewPage extends StatefulWidget {
  final String? vidhanSabha;
  final String? state;
  final String? totalAttendees;
  final String? booth;
  final String? address;
  final String? description;
  final String? img1;
  final String? img2;

  const AttendeeReviewPage(
      {Key? key,
      this.vidhanSabha,
      this.state,
      this.totalAttendees,
      this.booth,
      this.address,
      this.description,
      this.img1,
      this.img2})
      : super(key: key);

  @override
  State<AttendeeReviewPage> createState() => _AttendeeReviewPageState();
}

class _AttendeeReviewPageState extends State<AttendeeReviewPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  void dispose() {
    AttendeeStorageService.storage.erase();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<FetchCubit>();

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
                              title: Text("?????????????????????",
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
                      vidhanSabha: cubit.vidhanSabhaSelected!.name.toString(),
                      state: "Assam",
                    ),
                    const SizedBox(height: 24),
                    ReviewTotalAttendee(totalAttendees: widget.totalAttendees),
                    const SizedBox(height: 24),
                    ReviewBoothName(booth: cubit.boothSelected!.name.toString()),
                    const SizedBox(height: 24),
                    ReviewBoothAddress(boothAddress: widget.address),
                    const SizedBox(height: 24),
                    ReviewDescription(description: widget.description),
                    const SizedBox(height: 24),
                    ReviewImages(img1: widget.img1, img2: widget.img2),
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
