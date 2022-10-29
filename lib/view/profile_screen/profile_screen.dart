import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:swasthya/view/profile_screen/profile_screen_controller.dart';
import '../add_medical_details/add_medical_details_screen.dart';
import '../add_medical_details/sdd_medicall_details_controller.dart';
import '../bottom_navigation_bar/navigation_screen.dart';
import '../cards_screen/card_screen.dart';
import '../core/colors.dart';
import '../core/constent_size.dart';
import '../dashboard_screen/dashboard_controller.dart';
import '../update_medical_data_screen/update_med_data.dart';
import '../user_update_screen/user_update_screen.dart';
import '../view_file_screen/view_file_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with TickerProviderStateMixin {
  final profileScreenController = Get.put(ProfileScreenController());
  final medicalDetailsScreenController = Get.put(AddMedicalDetailsController());
  DashBordController cardController = Get.find();
  @override
  void initState() {
    profileScreenController.getUserProfileData();
    profileScreenController.getUserMedicalDetails();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return Obx(
      () => Scaffold(
        body: profileScreenController.getUserProfileDetails.value.data == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SafeArea(
                child: LimitedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      h2,
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Row(
                          children: [
                            profileScreenController.getUserProfileDetails.value
                                        .data!.profilePic ==
                                    ''
                                ? SvgPicture.asset(
                                    'asset/icons/User Photo.svg',
                                    width: 120,
                                    height: 120,
                                  )
                                : CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    radius: 60,
                                    backgroundImage: NetworkImage(
                                        profileScreenController
                                            .getUserProfileDetails
                                            .value
                                            .data!
                                            .profilePic
                                            .toString()),
                                  ),
                            Spacer(),
                            Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      profileScreenController
                                          .getUserProfileDetails
                                          .value
                                          .data!
                                          .fullName!
                                          .toUpperCase(),
                                      style: TextStyle(
                                          fontSize: 22,
                                          letterSpacing: 1.2,
                                          fontWeight: FontWeight.w800),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      profileScreenController
                                                  .getUserProfileDetails
                                                  .value
                                                  .data!
                                                  .phoneNo ==
                                              null
                                          ? '00000000'
                                          : profileScreenController
                                              .getUserProfileDetails
                                              .value
                                              .data!
                                              .phoneNo
                                              .toString(),
                                      style: TextStyle(
                                          fontSize: 18,
                                          letterSpacing: 1.2,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      profileScreenController
                                                  .getUserProfileDetails
                                                  .value
                                                  .data!
                                                  .bloodGroup ==
                                              null
                                          ? ''
                                          : profileScreenController
                                              .getUserProfileDetails
                                              .value
                                              .data!
                                              .bloodGroup!
                                              .toUpperCase(),
                                      style: TextStyle(
                                          fontSize: 20,
                                          letterSpacing: 1.2,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(right: 15),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.end,
                      //     // crossAxisAlignment: CrossAxisAlignment.end,
                      //     children: [
                      //       Text(
                      //         'Full Name',
                      //         style: TextStyle(
                      //             fontSize: 22,
                      //             letterSpacing: 1.2,
                      //             fontWeight: FontWeight.w800),
                      //       ),
                      //       SizedBox(
                      //         height: 5,
                      //       ),
                      //       Text(
                      //         'B+',
                      //         style: TextStyle(
                      //             fontSize: 20,
                      //             letterSpacing: 1.2,
                      //             fontWeight: FontWeight.w600),
                      //       ),

                      //       // Text('B+')
                      //     ],
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 5,
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.only(right: 15),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.end,
                      //     children: [
                      //       Text(
                      //         'XX/XX/XXX',
                      //         style: TextStyle(
                      //             fontSize: 18,
                      //             letterSpacing: 1.2,
                      //             fontWeight: FontWeight.w500),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 5,
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.only(right: 15),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.end,
                      //     children: [
                      //       Text(
                      //         'B+',
                      //         style: TextStyle(
                      //             fontSize: 20,
                      //             letterSpacing: 1.2,
                      //             fontWeight: FontWeight.w600),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      h1,
                      Container(
                        height: 2,
                        // thickness: 2,
                        color: appColor,
                      ),
                      Container(
                        height: 7,
                        // thickness: 4,
                        color: Colors.grey[350],
                      ),
                      h1,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                            height: 50,
                            child: TabBar(
                              isScrollable: true,
                              unselectedLabelColor:
                                  Color.fromARGB(255, 250, 130, 49),
                              labelColor: Color.fromARGB(255, 247, 246, 246),
                              indicator: BoxDecoration(
                                  color: appColor,
                                  borderRadius: BorderRadius.circular(30)),
                              controller: tabController,
                              // labelPadding: EdgeInsets.symmetric(horizontal: 10.0),

                              tabs: [
                                Tab(
                                  // height: 20,
                                  child: Text(
                                    'My Details',
                                    style: TextStyle(
                                        fontSize: 18,
                                        // letterSpacing: 1.2,
                                        // color: tabController.index == 0
                                        //     ? Colors.white
                                        //     : appColor,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Container(
                                  // height: 50,
                                  // color: Colors.grey,
                                  width: 140,
                                  child: Text(
                                    'Medical History',
                                    style: TextStyle(
                                        fontSize: 18,
                                        // letterSpacing: 1.2,
                                        // color: tabController.index == 0
                                        //     ? Colors.white
                                        //     : appColor,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                // Expanded(
                                //   flex: 10,
                                //   child: Tab(
                                //     child: Container(
                                //       width: 170,
                                //       child: Text(
                                //         'Medical History',
                                //         textAlign: TextAlign.left,
                                //         style: TextStyle(
                                //             fontSize: 15,
                                //             letterSpacing: 1.2,
                                //             color: tabController.index == 1
                                //                 ? Colors.white
                                //                 : appColor,
                                //             fontWeight: FontWeight.w600),
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                Tab(
                                  child: Container(
                                    width: 40,
                                    child: Text(
                                      'Card',
                                      style: TextStyle(
                                          fontSize: 18,
                                          // letterSpacing: 1.2,
                                          // color: tabController.index == 2
                                          //     ? Colors.white
                                          //     : appColor,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                )
                              ],
                            )),
                      ),
                      h1,
                      Container(
                        height: 7,
                        // thickness: 4,
                        color: Color.fromRGBO(214, 214, 214, 1),
                      ),
                      Expanded(
                          child: TabBarView(
                        controller: tabController,
                        children: [
                          Column(
                            children: [
                              RefreshIndicator(
                                color: appColor,
                                onRefresh: () async {
                                  Future.delayed(Duration(seconds: 1));
                                  await profileScreenController
                                      .getUserProfileData();
                                },
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  physics: AlwaysScrollableScrollPhysics(),
                                  child: Column(
                                    children: [
                                      h2,
                                      Container(
                                        width: 300,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.1),
                                                spreadRadius: 1,
                                                blurRadius: 1,
                                                offset: Offset(0,
                                                    3), // changes position of shadow
                                              ),
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(8.5),
                                            border: Border.all(
                                                color: Colors.grey,
                                                width: 1.5)),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 12, top: 8),
                                          child: Text(
                                            profileScreenController
                                                        .getUserProfileDetails
                                                        .value
                                                        .data!
                                                        .email ==
                                                    null
                                                ? "example@gamil.com"
                                                : profileScreenController
                                                    .getUserProfileDetails
                                                    .value
                                                    .data!
                                                    .email
                                                    .toString(),
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black54,
                                                letterSpacing: 1.2,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                      h1,
                                      Container(
                                        width: 300,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.1),
                                                spreadRadius: 1,
                                                blurRadius: 1,
                                                offset: Offset(0,
                                                    3), // changes position of shadow
                                              ),
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(8.5),
                                            border: Border.all(
                                                color: Colors.grey,
                                                width: 1.5)),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 12, top: 8),
                                          child: Text(
                                            profileScreenController
                                                        .getUserProfileDetails
                                                        .value
                                                        .data!
                                                        .dob ==
                                                    null
                                                ? "XX/XX/XXX"
                                                : profileScreenController
                                                    .getUserProfileDetails
                                                    .value
                                                    .data!
                                                    .dob
                                                    .toString(),
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black54,
                                                letterSpacing: 1.2,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                      h1,
                                      Container(
                                        width: 300,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.1),
                                                spreadRadius: 1,
                                                blurRadius: 1,
                                                offset: Offset(0,
                                                    3), // changes position of shadow
                                              ),
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(8.5),
                                            border: Border.all(
                                                color: Colors.grey,
                                                width: 1.5)),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 12, top: 8),
                                          child: Text(
                                            profileScreenController
                                                        .getUserProfileDetails
                                                        .value
                                                        .data!
                                                        .gender ==
                                                    null
                                                ? "Gender"
                                                : profileScreenController
                                                    .getUserProfileDetails
                                                    .value
                                                    .data!
                                                    .gender
                                                    .toString(),
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black54,
                                                letterSpacing: 1.2,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                      h1,
                                      Container(
                                        width: 300,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.1),
                                                spreadRadius: 1,
                                                blurRadius: 1,
                                                offset: Offset(0,
                                                    3), // changes position of shadow
                                              ),
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(8.5),
                                            border: Border.all(
                                                color: Colors.grey,
                                                width: 1.5)),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 12, top: 8),
                                          child: Text(
                                            profileScreenController
                                                        .getUserProfileDetails
                                                        .value
                                                        .data!
                                                        .occupation ==
                                                    null
                                                ? "Occupation - Nill"
                                                : profileScreenController
                                                    .getUserProfileDetails
                                                    .value
                                                    .data!
                                                    .occupation
                                                    .toString(),
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black54,
                                                letterSpacing: 1.2,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                      h1,
                                      Container(
                                        width: 300,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.1),
                                                spreadRadius: 1,
                                                blurRadius: 1,
                                                offset: Offset(0,
                                                    3), // changes position of shadow
                                              ),
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(8.5),
                                            border: Border.all(
                                                color: Colors.grey,
                                                width: 1.5)),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 12, top: 8),
                                          child: Text(
                                            profileScreenController
                                                        .getUserProfileDetails
                                                        .value
                                                        .data!
                                                        .state ==
                                                    ""
                                                ? "State"
                                                : profileScreenController
                                                    .getUserProfileDetails
                                                    .value
                                                    .data!
                                                    .state
                                                    .toString(),
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black54,
                                                letterSpacing: 1.2,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                      h1,
                                      Container(
                                        width: 300,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.1),
                                                spreadRadius: 1,
                                                blurRadius: 1,
                                                offset: Offset(0,
                                                    3), // changes position of shadow
                                              ),
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(8.5),
                                            border: Border.all(
                                                color: Colors.grey,
                                                width: 1.5)),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 12, top: 8),
                                          child: Text(
                                            profileScreenController
                                                        .getUserProfileDetails
                                                        .value
                                                        .data!
                                                        .city ==
                                                    ""
                                                ? "City"
                                                : profileScreenController
                                                    .getUserProfileDetails
                                                    .value
                                                    .data!
                                                    .city
                                                    .toString(),
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black54,
                                                letterSpacing: 1.2,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                      h1,
                                      Container(
                                        width: 300,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.1),
                                                spreadRadius: 1,
                                                blurRadius: 1,
                                                offset: Offset(0,
                                                    3), // changes position of shadow
                                              ),
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(8.5),
                                            border: Border.all(
                                                color: Colors.grey,
                                                width: 1.5)),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 12, top: 8),
                                          child: Text(
                                            profileScreenController
                                                        .getUserProfileDetails
                                                        .value
                                                        .data!
                                                        .pincode ==
                                                    ""
                                                ? "Pincode"
                                                : profileScreenController
                                                    .getUserProfileDetails
                                                    .value
                                                    .data!
                                                    .pincode
                                                    .toString(),
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black54,
                                                letterSpacing: 1.2,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                      h2,
                                      h1,
                                      ElevatedButton(
                                        onPressed: () {
                                          Get.to(UserProfileUpdateScreen());
                                        },
                                        child: Text(
                                          'Update',
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            fixedSize: Size(180, 45),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                            backgroundColor: Colors.green),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          profileScreenController
                                      .getMedicalDetails.value.data ==
                                  null
                              ? Center(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Get.to(AddMedicalDetailsScreen());
                                    },
                                    child: Text(
                                      'Add',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                        fixedSize: Size(180, 45),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        backgroundColor: appColor),
                                  ),
                                )
                              : Column(
                                  children: [
                                    Expanded(
                                      child: RefreshIndicator(
                                        color: appColor,
                                        strokeWidth: 3,
                                        triggerMode: RefreshIndicatorTriggerMode
                                            .anywhere,
                                        onRefresh: () async {
                                          await Future.delayed(
                                              Duration(seconds: 1));
                                          await profileScreenController
                                              .getMedicalDetails();
                                        },
                                        child: ListView.builder(
                                          physics: BouncingScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: profileScreenController
                                              .getMedicalDetails
                                              .value
                                              .data!
                                              .length,
                                          itemBuilder: (context, index) =>
                                              SizedBox(
                                            child: Column(
                                              children: [
                                                h2,
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 20),
                                                  child: Container(
                                                    height: 360,
                                                    width: context.width * 8,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            width: 2,
                                                            color: appColor)),
                                                    child: Column(
                                                      children: [
                                                        h2,
                                                        Container(
                                                          height: 150,
                                                          width: context.width *
                                                              0.7,
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .black,
                                                                  width: 1)),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(5.0),
                                                            child: Text(
                                                              profileScreenController
                                                                          .getMedicalDetails
                                                                          .value
                                                                          .data![
                                                                              index]
                                                                          .description ==
                                                                      null
                                                                  ? 'Petient last medical history'
                                                                  : profileScreenController
                                                                      .getMedicalDetails
                                                                      .value
                                                                      .data![
                                                                          index]
                                                                      .description
                                                                      .toString(),
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  // letterSpacing: 1.2,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                          ),
                                                        ),
                                                        h1,
                                                        Container(
                                                          height: 50,
                                                          width: context.width *
                                                              0.7,
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .black,
                                                                  width: 1)),
                                                          child: Center(
                                                            child: Text(
                                                              profileScreenController
                                                                          .getMedicalDetails
                                                                          .value
                                                                          .data![
                                                                              index]
                                                                          .date ==
                                                                      null
                                                                  ? 'XX/XX/XXXX'
                                                                  : profileScreenController
                                                                      .getMedicalDetails
                                                                      .value
                                                                      .data![
                                                                          index]
                                                                      .date
                                                                      .toString(),
                                                              style: TextStyle(
                                                                  fontSize: 18,
                                                                  // letterSpacing: 1.2,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w800),
                                                            ),
                                                          ),
                                                        ),
                                                        h1,
                                                        InkWell(
                                                          onTap: () {
                                                            Get.to(
                                                                ViewFileScreen(
                                                              index: index,
                                                            ));
                                                            // profileScreenController
                                                            //         .fileToDisplay =
                                                            //     profileScreenController
                                                            //         .getMedicalDetails
                                                            //         .value
                                                            //         .data![index]
                                                            //         .file;
                                                          },
                                                          child: Container(
                                                            height: 50,
                                                            width:
                                                                context.width *
                                                                    0.7,
                                                            decoration: BoxDecoration(
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .black,
                                                                    width: 1)),
                                                            child: Center(
                                                              child: Text(
                                                                'View File',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        18,
                                                                    color: Colors
                                                                        .green,
                                                                    letterSpacing:
                                                                        1.2,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w800),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        h1,
                                                        Container(
                                                          width: context.width *
                                                              0.7,
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                            children: [
                                                              InkWell(
                                                                onTap: () {
                                                                  Get.to(
                                                                      UpdateMedicalDetails(
                                                                    postId: profileScreenController
                                                                        .getMedicalDetails
                                                                        .value
                                                                        .data![
                                                                            index]
                                                                        .id
                                                                        .toString(),
                                                                    index:
                                                                        index,
                                                                  ));
                                                                },
                                                                child:
                                                                    Container(
                                                                  color: Colors
                                                                      .green,
                                                                  height: 40,
                                                                  width: context
                                                                          .width *
                                                                      0.3,
                                                                  child: Center(
                                                                      child:
                                                                          Text(
                                                                    'Update',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            18,
                                                                        color: Colors
                                                                            .white,
                                                                        letterSpacing:
                                                                            1.2,
                                                                        fontWeight:
                                                                            FontWeight.w800),
                                                                  )),
                                                                ),
                                                              ),
                                                              InkWell(
                                                                onTap: () {
                                                                  Get.defaultDialog(
                                                                      title: 'Are you Sure!',
                                                                      content: Padding(
                                                                        padding:
                                                                            const EdgeInsets.symmetric(horizontal: 30),
                                                                        child:
                                                                            Row(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children: [
                                                                            Padding(
                                                                              padding: const EdgeInsets.all(8.0),
                                                                              child: ElevatedButton(
                                                                                onPressed: () => Get.back(),
                                                                                child: Text('Cancel'),
                                                                                style: ElevatedButton.styleFrom(fixedSize: Size(80, 30), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), backgroundColor: appColor),
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              width: 20,
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsets.all(8.0),
                                                                              child: ElevatedButton(
                                                                                onPressed: () async {
                                                                                  await profileScreenController.deleteMedHistory(
                                                                                    profileScreenController.getMedicalDetails.value.data![index].id.toString(),
                                                                                  );
                                                                                  await profileScreenController.getUserMedicalDetails();

                                                                                  await Get.off(BottumNavBarScreen());
                                                                                  Get.back();
                                                                                },
                                                                                child: Text('Yes'),
                                                                                style: ElevatedButton.styleFrom(fixedSize: Size(80, 30), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), backgroundColor: appColor),
                                                                              ),
                                                                            )
                                                                          ],
                                                                        ),
                                                                      ));
                                                                },
                                                                child:
                                                                    Container(
                                                                  color: Colors
                                                                      .red,
                                                                  height: 40,
                                                                  width: context
                                                                          .width *
                                                                      0.3,
                                                                  child: Center(
                                                                      child:
                                                                          Text(
                                                                    'Delete',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            18,
                                                                        color: Colors
                                                                            .white,
                                                                        letterSpacing:
                                                                            1.2,
                                                                        fontWeight:
                                                                            FontWeight.w800),
                                                                  )),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    h2,
                                    ElevatedButton(
                                      onPressed: () {
                                        Get.to(AddMedicalDetailsScreen());
                                      },
                                      child: Text(
                                        'Add Details',
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          fixedSize: Size(305, 45),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4)),
                                          backgroundColor: appColor),
                                    )
                                  ],
                                ),

                          // ),

                          Column(
                            children: [
                              h2,
                              cardController.userDetailsModel!.data!.card == ''
                                  ? Center(
                                      child: Container(
                                        height: 170,
                                        width: context.width * .7,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                width: 4, color: appColor)),
                                        child: IconButton(
                                            onPressed: () {
                                              Get.to(AllCardScreen());
                                            },
                                            icon: Icon(
                                              Icons.add,
                                              color: Colors.green,
                                              size: 130,
                                            )),
                                      ),
                                    )
                                  : Center(
                                      child: Container(
                                        height: 170,
                                        width: context.width * .7,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    cardController
                                                        .userDetailsModel!
                                                        .data!
                                                        .card
                                                        .toString())),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                width: 4, color: appColor)),
                                      ),
                                    ),
                              h2,
                              ElevatedButton(
                                onPressed: () {
                                  Get.to(AllCardScreen());
                                },
                                child: Text(
                                  cardController.userDetailsModel!.data!.card ==
                                          ''
                                      ? 'Buy Card'
                                      : 'Upgrade',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                style: ElevatedButton.styleFrom(
                                    fixedSize: Size(180, 45),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    backgroundColor: appColor),
                              )
                            ],
                          )
                        ],
                      ))
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
