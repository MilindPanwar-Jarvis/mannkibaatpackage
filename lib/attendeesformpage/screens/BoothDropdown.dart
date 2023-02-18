import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';


import '../../Storage/AttendeesFormStorage.dart';
import '../../values/AppColors.dart';
import '../cubit/AttendeeFormCubit.dart';
import '../network/model/Booth.dart';

class BoothDropDown extends StatefulWidget {
  const BoothDropDown({Key? key}) : super(key: key);

  @override
  State<BoothDropDown> createState() => _BoothDropDownState();
}

class _BoothDropDownState extends State<BoothDropDown> {
  String? acList;
  List<ApiDataList> boothList = [];
  List<String> stateListStr = [];

  // final _itemList = Constants.stateList;
  // final _itemList2 = Constants.acList;

  Future getAcId() async {
    var res = await AttendeeFormCubit().fetchAcId();
    Booth model = Booth.fromJson(res.data);
    setState(() {
      acList = model.data.first.id.toString();
      AttendeeStorageService.setskId(acList.toString());
    });
  }

  Future getAcData() async {
    var res = await AttendeeFormCubit().fetchBooth();
    Booth model = Booth.fromJson(res.data);
    setState(() {
      boothList = model.data;
    });
  }

  @override
  void initState() {
    getAcId();
    getAcData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: AppColor().backgroundColor),
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: DropdownButtonFormField2(
        dropdownDecoration: BoxDecoration(
          border: Border.all(color: AppColor().backgroundColor),
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: '   बूथ',
          //contentPadding: EdgeInsets.only(le),
        ),
        items:
            boothList.map<DropdownMenuItem<ApiDataList>>((ApiDataList value) {
          return DropdownMenuItem<ApiDataList>(
            value: value,
            child: Text(value.name),
          );
        }).toList(),
        onChanged: (val) {
          setState(() {
            //you can print here state id
            AttendeeStorageService.setboothName(val!.name.toString());
            print("stateId ${val!.id}");

            //_selectedVal = val as String;
          });
        },
        icon: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Icon(
            Icons.arrow_drop_down_rounded,
            size: 30,
            color: AppColor().buttonColor,
          ),
        ),
      ),
    );
  }
}
