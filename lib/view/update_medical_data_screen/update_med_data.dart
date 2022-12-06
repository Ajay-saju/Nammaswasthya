import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swasthya/view/update_medical_data_screen/update_med_data_controller.dart';
import 'package:intl/intl.dart';
import 'package:swasthya/view/view_file_screen/view_file_screen.dart';
import '../bottom_navigation_bar/navigation_screen.dart';
import '../core/colors.dart';
import '../core/constent_size.dart';
import '../profile_screen/profile_screen_controller.dart';

class UpdateMedicalDetails extends StatefulWidget {
  String postId;
  int index;
  UpdateMedicalDetails({Key? key, required this.postId, required this.index})
      : super(key: key);

  @override
  State<UpdateMedicalDetails> createState() => _UpdateMedicalDetailsState();
}

class _UpdateMedicalDetailsState extends State<UpdateMedicalDetails> {
  @override
  final updateMedDataController = Get.put(UpdateMedDataController());

  ProfileScreenController oldData = Get.find();

  @override
  Widget build(BuildContext context) {
    String date =
        oldData.getMedicalDetails.value.data![widget.index].date.toString();
    String description = oldData
        .getMedicalDetails.value.data![widget.index].description
        .toString();
    updateMedDataController.dateinput.text =
        oldData.getMedicalDetails.value.data![widget.index].date.toString();
    print(oldData.getMedicalDetails.value.data![widget.index].date.toString());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Update Medical Details',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: InkWell(
            onTap: () => Get.back(),
            child: Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.black,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              h2,
              SizedBox(
                height: 200,
                child: GetBuilder<UpdateMedDataController>(builder: (_) {
                  return TextFormField(
                    initialValue: oldData.getMedicalDetails.value
                        .data![widget.index].description,
                    onChanged: (value) {
                      if (value.isEmpty) {
                        description = oldData.getMedicalDetails.value
                            .data![widget.index].description
                            .toString();
                      } else {
                        description = value;
                      }
                    },
                    maxLines: 20,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        hintText: "Enter Descriptions...",
                        hintStyle: TextStyle(
                          fontFamily: "Nunito",
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding:
                            const EdgeInsets.only(left: 20.0, top: 30)),
                  );
                }),
              ),
              h2,
              GetBuilder<UpdateMedDataController>(
                builder: (_) {
                  return TextFormField(
                    readOnly: true,
                    controller: updateMedDataController.dateinput,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(
                              2000), //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2101));

                      if (pickedDate != null) {
                        print(pickedDate);
                        String formattedDate =
                            DateFormat('dd-MM-yyyy').format(pickedDate);
                        print(
                            formattedDate); //formatted date output using intl package =>  2021-03-16

                        updateMedDataController.dateinput.text =
                            formattedDate; //set output date to TextField value.

                      } else {
                        updateMedDataController.dateinput.text = oldData
                            .getMedicalDetails.value.data![widget.index].date
                            .toString();
                        print("Date is not selected");
                      }
                      date = updateMedDataController.dateinput.text;
                    },
                    keyboardType: TextInputType.none,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        hintText: "Enter Date",
                        hintStyle: TextStyle(
                          fontFamily: "Nunito",
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.only(left: 20.0)),
                  );
                },
              ),
              h1,
              Obx(() =>
               oldData.getMedicalDetails.value.data![widget.index].file !=''?
               TextButton(
                  onPressed: () {
                    Get.to(ViewFileScreen(index: widget.index));
                  },
                  child: Text(
                    'View File',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )):SizedBox(),
                  ),
              ElevatedButton(
                onPressed: () async {
                  await updateMedDataController.getFile();
                },
                child: Text(
                  oldData.getMedicalDetails.value.data![widget.index].file ==
                          null && oldData.getMedicalDetails.value.data![widget.index].file ==''
                      ? 'Add file'
                      : 'Change File',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(305, 45),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    backgroundColor: appColor),
              ),
              h1,
              Obx(
                () => Text(
                  updateMedDataController.fileImage.value == true
                      ? "*One File Is Added"
                      : '',
                  style: TextStyle(fontSize: 18, color: Colors.red),
                ),
              ),
              h1,
              ElevatedButton(
                onPressed: () async {
                  await updateMedDataController.updateMedData(
                      widget.postId, description, date);
                  await Get.offAll(BottumNavBarScreen());
                },
                child: Text(
                  'Upload Medical Details',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(305, 45),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    backgroundColor: Colors.green),
              )
            ],
          ),
        ),
      ),
    );
  }
}
