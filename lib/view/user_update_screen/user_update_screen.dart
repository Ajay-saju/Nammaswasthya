import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:swasthya/view/core/colors.dart';
import 'package:swasthya/view/user_update_screen/user_update_controller.dart';

import '../core/constent_size.dart';
import '../profile_screen/profile_screen_controller.dart';
import '../update_user_pro_pick/update_profile_pick_controller.dart';
import '../update_user_pro_pick/update_user_profile_pick.dart';

class UserProfileUpdateScreen extends StatefulWidget {
  UserProfileUpdateScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileUpdateScreen> createState() =>
      _UserProfileUpdateScreenState();
}

ProfileScreenController pcontroller = Get.find();
// ProfilePickController pickController = Get.find();
// ProfilePickController profilePickController = Get.find();
final profilePickController = Get.put(ProfilePickController());

final userUpdatecontroller = Get.put(UserUpdatecontroller());
final ImagePicker picker = ImagePicker();

initState() {
  // pcontroller.getUserProfileDetails();
}

String name = pcontroller.getUserProfileDetails.value.data!.fullName.toString();
String email = pcontroller.getUserProfileDetails.value.data!.email.toString();
String phone_no =
    pcontroller.getUserProfileDetails.value.data!.phoneNo.toString();
String blood_group =
    pcontroller.getUserProfileDetails.value.data!.bloodGroup.toString();
String profile_pic =
    pcontroller.getUserProfileDetails.value.data!.profilePic.toString();
String dob = pcontroller.getUserProfileDetails.value.data!.dob.toString();
String gender = pcontroller.getUserProfileDetails.value.data!.gender.toString();
String occupation =
    pcontroller.getUserProfileDetails.value.data!.occupation.toString();
String state = pcontroller.getUserProfileDetails.value.data!.state.toString();
String city = pcontroller.getUserProfileDetails.value.data!.city.toString();
String pincode =
    pcontroller.getUserProfileDetails.value.data!.pincode.toString();

class _UserProfileUpdateScreenState extends State<UserProfileUpdateScreen> {
  @override
  Widget build(BuildContext context) {
    userUpdatecontroller.dob.text =
        pcontroller.getUserProfileDetails.value.data!.dob.toString();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Profile Update',
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Form(
                  child: Column(
                    children: [
                      h1,
                      TextFormField(
                        initialValue: name == 'null' ? 'Name' : name,
                        onChanged: (value) {
                          name = value;
                        },
                        inputFormatters: [LengthLimitingTextInputFormatter(25)],
                        keyboardType: TextInputType.text,
                        // controller: mebController.memName,
                        validator: (value) {
                          if (value!.isNotEmpty && value.length > 3) {
                            return null;
                          } else if (value.length < 3 && value.isNotEmpty) {
                            return "Your Name Is Short";
                          } else {
                            return 'Required Name ';
                          }
                        },
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
                            hintText: "Name",
                            hintStyle: TextStyle(
                              fontFamily: "Nunito",
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.only(left: 20.0)),
                      ),
                      h1,
                      TextFormField(
                        initialValue:
                            phone_no == "null" ? 'Phone Number' : phone_no,
                        onChanged: (value) {
                          phone_no = value;
                        },
                        inputFormatters: [LengthLimitingTextInputFormatter(10)],
                        keyboardType: TextInputType.phone,
                        // controller: mebController.memName,
                        validator: (value) {
                          if (value!.isNotEmpty && value.length > 9) {
                            return null;
                          } else if (value.length < 9 && value.isNotEmpty) {
                            return "Enter correct mobile number";
                          } else {
                            return 'Required Mobile Number ';
                          }
                        },
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
                            hintText: "Mobile Number",
                            hintStyle: TextStyle(
                              fontFamily: "Nunito",
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.only(left: 20.0)),
                      ),
                      h1,
                      TextFormField(
                        initialValue:
                            blood_group == "null" ? 'Blood Group' : blood_group,
                        onChanged: (value) {
                          blood_group = value;
                        },
                        inputFormatters: [
                          // LengthLimitingTextInputFormatter(10),
                        ],
                        keyboardType: TextInputType.text,
                        // controller: mebController.memName,
                        // validator: (value) {
                        //   if (value!.isNotEmpty && value.length > 3) {
                        //     return null;
                        //   } else if (value.length < 3 && value.isNotEmpty) {
                        //     return "Your Name Is Short";
                        //   } else {
                        //     return 'Required Name ';
                        //   }
                        // },
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
                            hintText: "Blood Group",
                            hintStyle: TextStyle(
                              fontFamily: "Nunito",
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.only(left: 20.0)),
                      ),
                      h1,
                      GetBuilder<UserUpdatecontroller>(
                        builder: (_) {
                          return TextFormField(
                            // initialValue: dob == "null" ? 'Date of Birth' : dob,
                            // onChanged: (value) {
                            //   dob = value;
                            // },
                            readOnly: true,
                            controller: userUpdatecontroller.dob,
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

                                userUpdatecontroller.dob.text =
                                    formattedDate; //set output date to TextField value.

                              } else {
                                print("Date is not selected");
                              }
                              dob = userUpdatecontroller.dob.text;
                            },
                            keyboardType: TextInputType.none,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide:
                                      const BorderSide(color: Colors.black),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide:
                                      const BorderSide(color: Colors.black),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
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
                                hintText: "Date of Birth",
                                hintStyle: TextStyle(
                                  fontFamily: "Nunito",
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding:
                                    const EdgeInsets.only(left: 20.0)),
                          );
                        },
                      ),
                      h1,
                      TextFormField(
                        initialValue: gender == "null" ? 'Gender' : gender,
                        onChanged: (value) {
                          gender = value;
                        },
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(6),
                        ],
                        keyboardType: TextInputType.text,
                        // controller: mebController.memName,
                        // validator: (value) {
                        //   if (value!.isNotEmpty && value.length > 3) {
                        //     return null;
                        //   } else if (value.length < 3 && value.isNotEmpty) {
                        //     return "Your Name Is Short";
                        //   } else {
                        //     return 'Required Name ';
                        //   }
                        // },
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
                            hintText: "Gender",
                            hintStyle: TextStyle(
                              fontFamily: "Nunito",
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.only(left: 20.0)),
                      ),
                      h1,
                      TextFormField(
                        initialValue:
                            occupation == "null" ? 'Occupation' : occupation,

                        onChanged: (value) {
                          occupation = value;
                        },
                        inputFormatters: [
                          // LengthLimitingTextInputFormatter(10),
                        ],
                        keyboardType: TextInputType.text,
                        // controller: mebController.memName,
                        // validator: (value) {
                        //   if (value!.isNotEmpty && value.length > 3) {
                        //     return null;
                        //   } else if (value.length < 3 && value.isNotEmpty) {
                        //     return "Your Name Is Short";
                        //   } else {
                        //     return 'Required Name ';
                        //   }
                        // },
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
                            hintText: "Occupation",
                            hintStyle: TextStyle(
                              fontFamily: "Nunito",
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.only(left: 20.0)),
                      ),
                      h1,
                      TextFormField(
                        initialValue: state == "null" ? 'State' : state,

                        onChanged: (value) {
                          state = value;
                        },
                        inputFormatters: [
                          // LengthLimitingTextInputFormatter(10),
                        ],
                        keyboardType: TextInputType.text,
                        // controller: mebController.memName,
                        // validator: (value) {
                        //   if (value!.isNotEmpty && value.length > 3) {
                        //     return null;
                        //   } else if (value.length < 3 && value.isNotEmpty) {
                        //     return "Your Name Is Short";
                        //   } else {
                        //     return 'Required Name ';
                        //   }
                        // },
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
                            hintText: "State",
                            hintStyle: TextStyle(
                              fontFamily: "Nunito",
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.only(left: 20.0)),
                      ),
                      h1,
                      TextFormField(
                        initialValue: city == "null" ? 'City' : city,
                        onChanged: (value) {
                          city = value;
                        },
                        inputFormatters: [
                          // LengthLimitingTextInputFormatter(10),
                        ],
                        keyboardType: TextInputType.text,
                        // controller: mebController.memName,
                        // validator: (value) {
                        //   if (value!.isNotEmpty && value.length > 3) {
                        //     return null;
                        //   } else if (value.length < 3 && value.isNotEmpty) {
                        //     return "Your Name Is Short";
                        //   } else {
                        //     return 'Required Name ';
                        //   }
                        // },
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
                            hintText: "City",
                            hintStyle: TextStyle(
                              fontFamily: "Nunito",
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.only(left: 20.0)),
                      ),
                      h1,
                      TextFormField(
                        initialValue: pincode == "null" ? 'PinCode' : pincode,
                        onChanged: (value) {
                          pincode = value;
                        },
                        inputFormatters: [
                          // LengthLimitingTextInputFormatter(10),
                        ],
                        keyboardType: TextInputType.text,
                        // controller: mebController.memName,
                        // validator: (value) {
                        //   if (value!.isNotEmpty && value.length > 3) {
                        //     return null;
                        //   } else if (value.length < 3 && value.isNotEmpty) {
                        //     return "Your Name Is Short";
                        //   } else {
                        //     return 'Required Name ';
                        //   }
                        // },
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
                            hintText: "Pincode",
                            hintStyle: TextStyle(
                              fontFamily: "Nunito",
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.only(left: 20.0)),
                      ),
                    ],
                  ),
                ),
                h2,
                TextButton(
                    onPressed: () {
                      Get.to(UpdateUserProfilePictureScreen());
                      // Get.defaultDialog(
                      //     content: Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 30),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //     children: [
                      //       Padding(
                      //         padding: const EdgeInsets.all(8.0),
                      //         child: ElevatedButton(
                      //           onPressed: () async {
                      //             final fImage = await picker.pickImage(
                      //                 source: ImageSource.gallery);
                      //             image = fImage!.path;
                      //           },
                      //           child: Text(
                      //             'Gallery',
                      //             style: TextStyle(
                      //                 fontSize: 13,
                      //                 fontWeight: FontWeight.bold),
                      //           ),
                      //           style: ElevatedButton.styleFrom(
                      //               fixedSize: Size(80, 30),
                      //               shape: RoundedRectangleBorder(
                      //                   borderRadius:
                      //                       BorderRadius.circular(10)),
                      //               backgroundColor: appColor),
                      //         ),
                      //       ),
                      //       Spacer(),
                      //       Padding(
                      //         padding: const EdgeInsets.all(8.0),
                      //         child: ElevatedButton(
                      //           onPressed: () async {
                      //             final fImage = await picker.pickImage(
                      //                 source: ImageSource.camera);
                      //             image = fImage!.path;
                      //           },
                      //           child: Text(
                      //             'Camara',
                      //             style: TextStyle(
                      //                 fontSize: 13,
                      //                 fontWeight: FontWeight.bold),
                      //           ),
                      //           style: ElevatedButton.styleFrom(
                      //               fixedSize: Size(80, 30),
                      //               shape: RoundedRectangleBorder(
                      //                   borderRadius:
                      //                       BorderRadius.circular(10)),
                      //               backgroundColor: appColor),
                      //         ),
                      //       )
                      //     ],
                      //   ),
                      // ));
                    },
                    child: Text(
                      'Change Profile Picture',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )),
                h1,
                ElevatedButton(
                  onPressed: () {
                    Get.defaultDialog(
                        title: 'Are you Sure!',
                        content: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                  onPressed: () => Get.back(),
                                  child: Text('Cancel'),
                                  style: ElevatedButton.styleFrom(
                                      fixedSize: Size(80, 30),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      backgroundColor: appColor),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    print(pincode);
                                    print(state);
                                    userUpdatecontroller.updateUserProfile(
                                        name,
                                        email,
                                        phone_no,
                                        blood_group,
                                        dob,
                                        gender,
                                        occupation,
                                        state,
                                        city,
                                        pincode);

                                    pcontroller.getUserProfileDetails();

                                    Get.back();
                                  },
                                  child: Text('Yes'),
                                  style: ElevatedButton.styleFrom(
                                      fixedSize: Size(80, 30),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      backgroundColor: appColor),
                                ),
                              )
                            ],
                          ),
                        ));
                  },
                  child: Text(
                    'Update',
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(350, 60),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(1)),
                      backgroundColor: appColor),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
