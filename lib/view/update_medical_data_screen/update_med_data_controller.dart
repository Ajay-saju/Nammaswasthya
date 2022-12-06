import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:math';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swasthya/main.dart';
import 'package:swasthya/view/update_medical_data_screen/update_med_servise.dart';
import 'package:dio/dio.dart' as form;
import 'package:path_provider/path_provider.dart';


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
  var noFile = false.obs;
  // var description =''.obs;
  // var date = ''.obs;

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

  updateMedData(String postId, String description, String date) async {
    final updateMedicalData = UpdateMedicalData();

    Map<String, dynamic>? body1 = {};
    if (medicalFile != null) {
      body1["user_id"] = prefer.getString('id').toString();
      body1["description"] = description;
      body1['date'] = date;
      body1["file"] = await form.MultipartFile.fromFile(medicalFile!.path!,
          filename: fileName);
    }
     if (medicalFile == null) {
      body1["user_id"] = prefer.getString('id').toString();
      body1["description"] = description;
      body1['date'] = date;
    }
    form.FormData body = form.FormData.fromMap(body1);
    // form.FormData formData = form.FormData.fromMap({
    //   "user_id": prefer.getString('id').toString(),
    //   "description": description,
    //   "date": date,
    //   "file": await form.MultipartFile.fromFile(medicalFile!.path!,
    //       filename: fileName),
    // });
    var response = await updateMedicalData.updateData(body, postId);

    print("printing_res${response.data}");

    // log(response.data);
    // log(response.statusMessage.toString());
    var jsonFile = jsonDecode(response.data);

    if (jsonFile["status"] == "success")
      Get.defaultDialog(
          title: 'Success', middleText: 'File uploaded successfully');

    print('login model  :${response.data}');
    update();
  }
  Future<File>urlTOFile(String imageUrl)async{
    var rng = new Random();

    Directory tempDir= await getTemporaryDirectory();
    String tempPath = tempDir.path; 
    File file = new File('$tempPath'+ (rng.nextInt(100)).toString() +'.png');

    // await file.writeAsBytes();

    return file;


  }
}
