import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Storage/user_storage_service.dart';
import '../network/model/dash_model.dart';
import '../network/services/DashApi.dart';
import 'DashState.dart';

class DashCubit extends Cubit<DashStates> {
  DashCubit() : super(DashInitialState());

  final api = DashApi(Dio(BaseOptions(
      contentType: 'application/json', validateStatus: ((status) => true))));

  Future getDashData() async {
    try {
      emit(DashLoadingState());
      String? token = "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.1aBzmXruUAVV7ancpI1gu6GhOSso9xUqONf2DZ9ICmA";
      final res = await api.getEvents('Bearer $token');
      print(res.response.requestOptions.uri);

      print('RESPONSE OF NEW CALL=${res.response.statusCode}');

      print(res.data);
      if (res.response.statusCode == 200) {
        DashModal model = DashModal.fromJson(res.data);
        emit(DashGotEventsState(model));
      } else {
        Map<String, dynamic>? msg = res.data;
        emit(DashErrorState(msg?['error'] ?? ''));
      }
    } catch (e) {
      emit(DashErrorState(e.toString()));
    }
  }
}

//------------------------------------------------------------------------------------

// class DashCubit extends Cubit<DashStates> {
//   final DashRepo _dr;
//
//   DashCubit(this._dr) : super(DashInitialState());
//
//   Future<void> fetchEvents() async {
//     emit(DashLoadingState());
//     try {
//       final response = await _dr.getEvents();
//       emit(DashGotEventsState(response));
//     } catch (e) {
//       emit(DashErrorState(e.toString()));
//     }
//   }
// }
