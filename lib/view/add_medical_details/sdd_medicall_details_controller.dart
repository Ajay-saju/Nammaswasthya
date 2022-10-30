import 'dart:convert';
import 'dart:developer';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as form;
import 'package:swasthya/main.dart';
import 'package:swasthya/view/dashboard_screen/dashboard_screen.dart';

import 'add_medical_details_service.dart';

class AddMedicalDetailsController extends GetxController {


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
     fileImage.value = false;

  }

  
  
  TextEditingController dateinput = TextEditingController();
  PlatformFile? medicalFile;
  var fileName = '';
  var fileImage = false.obs;

  var description = '';
  var date = ''.obs;

  getFile() async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
    );
    if (result != null) {
      fileName = result.files.first.name;
      medicalFile = result.files.first;
      fileImage.value = true;
    } else {
      Get.defaultDialog(
          title: 'Select a file', middleText: 'please select medical file');
    }
  }

  addMedicalDetails() async {
    final medicalDetailService = MedicalDetailService();

    form.FormData formData = form.FormData.fromMap({
      "user_id": prefer.getString('id').toString(),
      "description": description,
      "date": date.value,
      "file": await form.MultipartFile.fromFile(medicalFile!.path!,
          filename: fileName),
    });

    var response = await medicalDetailService.addDetails(formData);
    print("printing_res${response.data}");

    log(response.data);
    log(response.statusMessage.toString());
    var jsonFile = jsonDecode(response.data);

    if (jsonFile["status"] == "success")
      Get.defaultDialog(
          title: 'Success', middleText: 'File uploaded successfully');
    Get.to(DashBoardScreen());

    print('login model  :${response.data}');
  }
}
