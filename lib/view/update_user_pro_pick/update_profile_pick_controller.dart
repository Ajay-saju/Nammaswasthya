import 'dart:io';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:swasthya/view/update_user_pro_pick/update_pro_pick_service.dart';
import 'package:dio/dio.dart' as di;
import '../../main.dart';
import '../profile_screen/profile_screen_controller.dart';

ProfileScreenController controller = Get.find();

class ProfilePickController extends GetxController {
  final ImagePicker picker = ImagePicker();

  String image() {
    print(controller.getUserProfileDetails.value.data!.profilePic
        .toString()
        .obs
        .toString());
    return controller.getUserProfileDetails.value.data!.profilePic.obs
        .toString();
  }

  var fileImage = ''.obs;

  imageFromGallery() async {
    final fImage = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 50,
        maxHeight: 500,
        maxWidth: 500);

    if (fImage != null) {
      File? img = File(fImage.path.toString());
      img = await cropImage(img);
      fileImage.value = img!.path;
    }
    return;

    // fileImage.value = fImage!.path;
    // print("from_gallery:${fImage.path}");
    // print('Workinggggggg');
    // update();
  }

  imageFromCamara() async {
    final XFile? fImage = await picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 50,
        maxHeight: 500,
        maxWidth: 500);

    if (fImage != null) {
      File? img = File(fImage.path.toString());
      img = await cropImage(img);
      fileImage.value = img!.path;
    }
    return;

    // fileImage.value = fImage.path;

    // print("from_camera:${fImage.path}");
    // update();
  }

  uploadProfilePick() async {
    final updateUserProfilePickService = UpdateUserProfilePickService();
    print(fileImage.value);

    File image = File(fileImage.value);

    print(image.path.toString());

    String fileName = image.path.split('/').last;

    di.FormData form = di.FormData.fromMap({
      "user_id": prefer.getString('id').toString(),
      "profile": await di.MultipartFile.fromFile(
        image.path,
        filename: fileName,
      )
    });

    try {
      var response = await updateUserProfilePickService.uploadImage(form);

      print("printing_res${response.toString()}");
      print(response.statusCode.toString());
      if (response.statusCode == 200)
        Get.defaultDialog(
            title: response.data["status"],
            middleText: response.data["message"]);
    } catch (e) {}
  }

  Future<File?> cropImage(File imageFile) async {
    var cropedImage = await ImageCropper()
        .cropImage(
          cropStyle: CropStyle.circle, sourcePath: imageFile.path);
    if (cropedImage == null) return null;
    return File(cropedImage.path);
  }
}
