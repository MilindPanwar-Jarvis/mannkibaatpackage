import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../attendeereviewpage/screens/ReviewPageMain.dart';
import '../../attendeesformpage/screens/AttendeesFormPage.dart';
import '../../utils/appbar/AppBar.dart';
import '../../utils/drawer/UserProfileDrawer.dart';
import '../../values/Constants.dart';
import '../cubit/DashCubit.dart';
import '../cubit/DashState.dart';
import 'ProgramCard.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final contentCubit = context.read<DashCubit>().getDashData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        appBar: AppBarWidget.getAppBar(_key, context),
        body: Scaffold(
          key: _key,
          drawer: const UserProfileDrawer(),
          body: Padding(
            padding: const EdgeInsets.only(
                right: Constants.paddingRight, left: Constants.paddingLeft),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFFFFFFF), Color(0xFFF3F7FF)],
                ),
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 14),
                      child: Text('आपके रिपोर्ट किए गए कार्यक्रम',
                          style: GoogleFonts.publicSans(
                              fontSize: 20, fontWeight: FontWeight.w600)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Flexible(
                    // height: 630,
                    child: BlocBuilder<DashCubit, DashStates>(
                      builder: (context, state) {
                        if (state is DashInitialState ||
                            state is DashLoadingState) {
                          return const Center(child: CircularProgressIndicator());
                        } else if (state is DashGotEventsState) {
                          return ListView.builder(
                            itemCount: state.dashModal.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  if (state.dashModal.data[index]
                                          .eventHasDetail ==
                                      true) {
                                    print(
                                        'inside REVIEW statement-->${state.dashModal.data[index].eventDetail.totalAttendees}');
                                    print(
                                        'Event Detail-->${state.dashModal.data[index].eventDetail}');

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AttendeeReviewPage(
                                                  vidhanSabha:
                                                      '${state.dashModal.data[index].eventDetail.ac?.first.name}',
                                                  state:
                                                      '${state.dashModal.data[index].eventDetail.countryStateRef?.first.name}',
                                                  totalAttendees:
                                                      '${state.dashModal.data[index].eventDetail.totalAttendees}',
                                                  booth:
                                                      '${state.dashModal.data[index].eventDetail.location?.first.name}',
                                                  address:
                                                      '${state.dashModal.data[index].eventDetail.address}',
                                                  description:
                                                      '${state.dashModal.data[index].eventDetail.description}',
                                                  img1:
                                                      '${state.dashModal.data[index].eventDetail.photo1}',
                                                  img2:
                                                      '${state.dashModal.data[index].eventDetail.photo1}',
                                                )));
                                  } else {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AttendeesFormPage()));
                                  }
                                },
                                child: ProgramCard(
                                    id: '${state.dashModal.data[index].id}',
                                    date: state
                                        .dashModal.data[index].airedDetail.date,
                                    time: state
                                        .dashModal.data[index].airedDetail.time,

                                    //right now I am not fetching images because API is having faulty images.
                                    img:
                                        state.dashModal.data[index].eventPhoto),
                              );
                            },
                          );
                        } else {
                          return const Center(
                            child: Text(
                              'ERROR',
                              style: TextStyle(fontSize: 20),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
