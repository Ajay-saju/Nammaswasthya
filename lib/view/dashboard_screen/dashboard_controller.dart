import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:swasthya/view/dashboard_screen/counter_api_call.dart';
import 'package:swasthya/view/dashboard_screen/counter_call_model.dart';
import 'package:swasthya/view/dashboard_screen/user_details_api_call.dart';
import 'package:swasthya/view/dashboard_screen/userdetails_model.dart';

import '../../main.dart';

class DashBordController extends GetxController {
  var loading = true.obs;

  var user_profilePick = ''.obs;

  UserDetailsModel? userDetailsModel;

  Future<UserDetailsModel?> loadHomePage() async {
    final userDetailsApiCall = UserDetails();

    try {
      final response = await userDetailsApiCall.userLoginCheck(
        prefer.getString('id').toString(),
      );

      log(response.data);
      log(response.statusCode.toString());

      var jsonFile = jsonDecode(response.data);

      userDetailsModel = UserDetailsModel.fromJson(jsonFile);

      await prefer.setString(
          'pick', userDetailsModel!.data!.profilePic.toString());

      print(prefer.getString('pick'));

      user_profilePick = userDetailsModel!.data!.profilePic.toString().obs;

      print(user_profilePick);

      print(userDetailsModel!.data!.id.toString());
    } catch (e) {
      print('error in api call $e');
    }
    update();
  }

  CounterCallingModel? counterCallingModel;

  Future<CounterCallingModel?> counting() async {
    final counterApiCall = CounterApiCall();

    try {
      final response = await counterApiCall.callCounter();

      log(response.data);
      log(response.statusCode.toString());

      var jsonFile = jsonDecode(response.data);

      counterCallingModel = CounterCallingModel.fromJson(jsonFile);

      print(counterCallingModel!.data![0].counterNo);
    } catch (e) {}
    return null;
  }
}
