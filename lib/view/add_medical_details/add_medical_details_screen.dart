import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:swasthya/view/add_medical_details/sdd_medicall_details_controller.dart';
import 'package:swasthya/view/core/colors.dart';
import '../bottom_navigation_bar/navigation_screen.dart';
import '../core/constent_size.dart';

class AddMedicalDetailsScreen extends StatelessWidget {
  AddMedicalDetailsScreen({super.key, int? index});

 
  final medicalDetailsScreenController = Get.put(AddMedicalDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Add Medical Details',
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
              SizedBox(
                height: 200,
                child: TextFormField(
                  // initialValue:proScreenController.getMedicalDetails.value.data[index].description.toString() ,
                  onChanged: (value) {
                    medicalDetailsScreenController.description = value;
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
                      contentPadding: const EdgeInsets.only(left: 20.0)),
                ),
              ),
              h2,
              GetBuilder<AddMedicalDetailsController>(
                builder: (_) {
                  return TextFormField(
                    readOnly: true,
                    controller: medicalDetailsScreenController.dateinput,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101));
        
                      if (pickedDate != null) {
                        print(pickedDate);
                        String formattedDate =
                            DateFormat('dd-MM-yyyy').format(pickedDate);
                        print(
                            formattedDate); //formatted date output using intl package =>  2021-03-16
        
                        medicalDetailsScreenController.dateinput.text =
                            formattedDate; //set output date to TextField value.
        
                      } else {
                        print("Date is not selected");
                      }
                      medicalDetailsScreenController.date.value =
                          medicalDetailsScreenController.dateinput.text;
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
              h2,
              ElevatedButton(
                onPressed: () {
                  medicalDetailsScreenController.getFile();
                },
                child: Text(
                  'Add File',
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
              h2,
              Obx(
                () => Text(
                  medicalDetailsScreenController.fileImage.value == true
                      ? "*One File Is Added"
                      : '',
                  style: TextStyle(fontSize: 18, color: Colors.red),
                ),
              ),
              h1,
              ElevatedButton(
                onPressed: () async {
                  await medicalDetailsScreenController.addMedicalDetails();
                  // await proScreenController.getUserMedicalDetails();
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
