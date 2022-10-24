import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:swasthya/view/update_user_pro_pick/update_pro_pick_service.dart';
import 'package:dio/dio.dart' as di;
import '../../main.dart';
import '../profile_screen/profile_screen_controller.dart';

ProfileScreenController controller = Get.find();

class ProfilePickController extends GetxController {
  final ImagePicker picker = ImagePicker();

  var image =
      controller.getUserProfileDetails.value.data!.profilePic.toString().obs;
  var fileImage = ''.obs;

  imageFromGallery() async {
    final fImage = await picker.pickImage(source: ImageSource.gallery);
    fileImage.value = fImage!.path;

    print('Workinggggggg');
    update();
  }

  imageFromCamara() async {
    final fImage = await picker.pickImage(source: ImageSource.camera);
    fileImage.value = fImage!.path;
    print('Workinggggggg');
    update();
  }

  uploadProfilePick() async {
    final updateUserProfilePickService = UpdateUserProfilePickService();

    File image = File(fileImage.value);

    String fileName = image.path.split('/').last;

    di.FormData form = di.FormData.fromMap({
      "user_id": prefer.getString('id').toString(),
      "profile":
          await di.MultipartFile.fromFile(image.path, filename: fileName),
    });

    try {

      var response = await updateUserProfilePickService.uploadImage(form);

       print("printing_res${response.toString()}");
      
      var jsonFile = jsonDecode(response.data);
      if (jsonFile["status"] == "success")
        Get.defaultDialog(
            title: 'Success', middleText: 'Update your profile successfully');
      
    } catch (e) {
      
    }

    

  }
}
