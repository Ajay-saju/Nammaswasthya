import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:swasthya/view/profile_screen/profile_screen_models/get_user_details_model.dart';
import 'package:swasthya/view/profile_screen/profile_screen_models/medical_history_model.dart';
import 'package:swasthya/view/profile_screen/profile_screen_service/delete_history_service.dart';
import 'package:swasthya/view/profile_screen/profile_screen_service/get_user_profile_details_service.dart';

import '../../main.dart';
import 'profile_screen_service/get_medical_history_service.dart';

class ProfileScreenController extends GetxController {
  Rx<GetUserProfileDetails> getUserProfileDetails = GetUserProfileDetails().obs;
  Rx<GetMedicalDetails> getMedicalDetails = GetMedicalDetails().obs;

  Future<GetUserProfileDetails?> getUserProfileData() async {
    final getUserProfileDetailsService = GetUserProfileDetailsService();

    try {
      final response = await getUserProfileDetailsService.getUserProfil(
        prefer.getString('id').toString(),
      );

      var jsonFile = jsonDecode(response.data);

      if (jsonFile["status"] == "success") {
        getUserProfileDetails.value = GetUserProfileDetails.fromJson(jsonFile);
      }
      log(response.data);
    } catch (e) {
      if (e is DioError) {
        print(e.toString());
      }
      return null;
    }
    update();
  }

  Future<GetMedicalDetails?> getUserMedicalDetails() async {
    final medicalHistoryApiService = MedicalHistoryApiService();

    try {
      final response = await medicalHistoryApiService.getMedicalHistory();

      var jsonFile = jsonDecode(response.data);

      if (jsonFile["status"] == "success") {
        getMedicalDetails.value = GetMedicalDetails.fromJson(jsonFile);
        log(response.data);
      }
    } catch (e) {
      if (e is DioError) {
        print(e.toString());
      }
      return null;
    }
    update();
  }

  deleteMedHistory(String postId) async {
    final deletePostService = DeletePostService();
    var response = await deletePostService.deletePost(postId);

    Get.defaultDialog(title: 'Delete', middleText: 'Medical History Deleted');
  }
}
