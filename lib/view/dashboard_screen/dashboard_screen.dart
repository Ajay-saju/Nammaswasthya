import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:swasthya/view/core/colors.dart';
import 'package:swasthya/view/dashboard_screen/dashboard_controller.dart';
import '../cards_screen/card_screen.dart';
import '../core/constent_size.dart';

class DashBoardScreen extends StatefulWidget {
  DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  // final otpVerificationController = Get.put(OtpVerificationController());
  final dashBordController = Get.put(DashBordController());

  @override
  void initState() {
    super.initState();
    dashBordController.loadHomePage();
    dashBordController.counting();
  }

  @override
  Widget build(BuildContext context) {
    // final currentHeight =MediaQuery.of(context).size.height;

    return GetBuilder<DashBordController>(builder: (_) {
      return dashBordController.userDetailsModel == null ||
              dashBordController.userDetailsModel!.data == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Scaffold(
              backgroundColor: Colors.white,
              body: SafeArea(
                  child: RefreshIndicator(
                displacement: 250,
                // backgroundColor: Colors.yellow,
                color: appColor,
                strokeWidth: 3,
                triggerMode: RefreshIndicatorTriggerMode.anywhere,
                onRefresh: () async {
                  Future.delayed(Duration(seconds: 1));
                  await dashBordController.loadHomePage();
                 await dashBordController.counting();
                },
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      h2,
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            dashBordController
                                        .userDetailsModel!.data!.profilePic !=
                                    ''
                                ? CircleAvatar(
                                    radius: 54,
                                    backgroundColor: appColor,
                                    child: CircleAvatar(
                                      radius: 52,
                                      backgroundColor: Colors.white,
                                      child: CircleAvatar(
                                        radius: 50,
                                        backgroundImage: NetworkImage(
                                            dashBordController.user_profilePick
                                                .toString(),
                                            scale: 20),
                                      ),
                                    ),
                                  )
                                : SvgPicture.asset(
                                    'asset/icons/User Photo.svg'),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              dashBordController.userDetailsModel!.data != null
                                  ? dashBordController
                                      .userDetailsModel!.data!.fullname!
                                      .toUpperCase()
                                  : "",
                              // prefer.getString('name').toString(),
                              // dashBordController.userDetailsModel!.data !=
                              //         null
                              //     ? dashBordController.userDetailsModel!.data!.fullname.toString()
                              //     : 'ajay',
                              style: TextStyle(
                                  fontSize: 25,
                                  letterSpacing: 1.2,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      h1,
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            SvgPicture.asset('asset/icons/Location.svg'),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Bangalore',
                              // prefer.getString('city').toString().toUpperCase(),
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      h2,
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Container(
                          width: 340,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border:
                                  Border.all(width: 1, color: Colors.black)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: context.width * 0.7,
                                  child: TextFormField(
                                    keyboardAppearance: Brightness.light,
                                    textInputAction: TextInputAction.next,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                    keyboardType: TextInputType.name,
                                    decoration: InputDecoration.collapsed(
                                      hintText: 'Select your doctor or symptom',
                                      hintStyle: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 17,
                                        fontFamily: "Nunito",
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Icon(Icons.search_rounded)
                              ],
                            ),
                          ),
                        ),
                      ),
                      h2,
                      Divider(
                        thickness: 3,
                        color: Colors.grey[350],
                      ),
                      h2,
                      dashBordController.userDetailsModel!.data!.card != ""
                          ? Center(
                              child: Container(
                              height: 170,
                              width: context.width * .7,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(dashBordController
                                          .userDetailsModel!.data!.card
                                          .toString())),
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(width: 4, color: appColor)),
                            ))
                          : Center(
                              child: Container(
                                height: 170,
                                width: context.width * .7,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border:
                                        Border.all(width: 4, color: appColor)),
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
                            ),
                      h2,
                      h1,
                      Row(
                        children: [
                          Container(
                            height: 90,
                            width: context.width * 0.7,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                                border: Border.all(
                                    width: 1.8,
                                    color: appColor,
                                    style: BorderStyle.solid)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Center(
                                child: Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                          text: 'Get cashback ',
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: appColor,
                                              letterSpacing: .5,
                                              fontWeight: FontWeight.w800)),
                                      TextSpan(
                                        text:
                                            'on all\n transactions that you make',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            color: appColor,
                                            fontSize: 17),
                                      ),
                                      // TextSpan(text: ' world!'),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            height: 90,
                            width: 95,
                            // width: context.width * 0.24,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10)),
                                border: Border.all(
                                    width: 1.8,
                                    color: appColor,
                                    style: BorderStyle.solid)),
                            child: Center(
                              child: SvgPicture.asset(
                                'asset/icons/Wallet logo.svg',
                                fit: BoxFit.fill,
                                width: 50,
                                height: 50,
                              ),
                            ),
                          ),
                        ],
                      ),
                      h1,
                      Divider(
                        thickness: 3,
                        color: Colors.grey[350],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                      text: dashBordController
                                                  .counterCallingModel !=
                                              null
                                          ? dashBordController
                                                  .counterCallingModel!
                                                  .data![0]
                                                  .counterNo! +
                                              "\n"
                                          : "",
                                      style: TextStyle(
                                          fontSize: 21,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w800)),
                                  TextSpan(
                                    text: 'Users Registration',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        color: Colors.black,
                                        fontSize: 17),
                                  ),
                                  // TextSpan(text: ' world!'),
                                ],
                              ),
                            ),
                            // Spacer(),
                            SizedBox(
                              width: 10,
                            ),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                      text: dashBordController
                                                      .counterCallingModel !=
                                                  null &&
                                              dashBordController
                                                      .counterCallingModel!
                                                      .data !=
                                                  null
                                          ? dashBordController
                                                  .counterCallingModel!
                                                  .data![1]
                                                  .counterNo! +
                                              "\n"
                                          : '',
                                      style: TextStyle(
                                          fontSize: 21,
                                          color: Colors.black,
                                          letterSpacing: .5,
                                          fontWeight: FontWeight.w800)),
                                  TextSpan(
                                    text: 'Corporate Registration',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        color: Colors.black,
                                        fontSize: 17),
                                  ),
                                  // TextSpan(text: ' world!'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      h2,
                      h1
                    ],
                  ),
                ),
              )),
            );
    });
  }
}
