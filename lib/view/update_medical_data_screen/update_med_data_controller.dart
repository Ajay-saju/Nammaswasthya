import 'dart:convert';
import 'dart:developer';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swasthya/main.dart';
import 'package:swasthya/view/update_medical_data_screen/update_med_servise.dart';
import 'package:dio/dio.dart' as form;

class UpdateMedDataController extends GetxController {

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
     fileImage.value = false;

  }
  TextEditingController dateinput = TextEditingController();

  PlatformFile? medicalFile;
  var fileImage = false.obs;
  var fileName = '';
  var oldFile;
  var postId;
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

      update();
    } else {
      fileName = oldFile;
      medicalFile = oldFile;
    }
    update();
  }

  updateMedData(String postId) async {
    final updateMedicalData = UpdateMedicalData();
    form.FormData formData = form.FormData.fromMap({
      "user_id": prefer.getString('id').toString(),
      "description": description,
      "date": date.value,
      "file": await form.MultipartFile.fromFile(medicalFile!.path!,
          filename: fileName),
    });
    var response = await updateMedicalData.updateData(formData, postId);

    print("printing_res${response.data}");

    log(response.data);
    log(response.statusMessage.toString());
    var jsonFile = jsonDecode(response.data);

    if (jsonFile["status"] == "success")
      Get.defaultDialog(
          title: 'Success', middleText: 'File uploaded successfully');

    print('login model  :${response.data}');
    update();
  }
}
