import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:swasthya/main.dart';
import '../core/colors.dart';
import '../core/constent_size.dart';
import 'card_screen_controller.dart';

class AllCardScreen extends StatelessWidget {
  AllCardScreen({super.key});

  final allCardController = Get.put(CardScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: AppBar(
          centerTitle: true,
          titleSpacing: 20,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 40,
              ),
              onPressed: () {
                Get.back();
              },
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Padding(
            padding: const EdgeInsets.only(top: 18),
            child: Text('Premium Cards',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.w800)),
          ),
        ),
      ),
      body:
          //   allCardController.getallCardsModel.value.data == null ?
          // Center(child: CircularProgressIndicator(),):
          SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              h2,
              h2,
              h1,
              Obx(() => allCardController.getallCardsModel.value.data == null
                  ? SizedBox(child: customeShimmer(context))
                  : Column(
                      children: [
                        Container(
                          height: 197,
                          width: context.width * .8,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(allCardController
                                      .getallCardsModel.value.data![0].cardImage
                                      .toString())),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                              border: Border.all(width: 1.5, color: appColor)),
                        ),
                        Container(
                          height: 108,
                          width: context.width * .8,
                          decoration: BoxDecoration(
                              border: Border.all(width: 1.5, color: appColor),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          child: Column(
                            children: [
                              h1,
                              Text(
                                  allCardController
                                      .getallCardsModel.value.data![0].cardCost
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w800)),
                              h1,
                              ElevatedButton(
                                  onPressed: () async {
                                    allCardController.checkOut(allCardController
                                        .getallCardsModel
                                        .value
                                        .data![0]
                                        .cardCost!
                                        .replaceAll(',', '')
                                        .toString());

                                    allCardController.amount.value =
                                        allCardController.getallCardsModel.value
                                            .data![0].cardCost
                                            .toString();
                                    allCardController.cardType.value =
                                        allCardController.getallCardsModel.value
                                            .data![0].id
                                            .toString();
                                    
                                  },
                                  style: ElevatedButton.styleFrom(
                                      fixedSize: Size(100, 20),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      backgroundColor: appColor),
                                  child: Text('Buy Now'))
                            ],
                          ),
                        )
                      ],
                    )),
              h2,
              Obx(() => allCardController.getallCardsModel.value.data == null
                  ? customeShimmer(context)
                  : Column(
                      children: [
                        Container(
                          height: 197,
                          width: context.width * .8,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(allCardController
                                              .getallCardsModel.value.data ==
                                          null
                                      ? ''
                                      : allCardController.getallCardsModel.value
                                          .data![1].cardImage
                                          .toString())),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                              border: Border.all(width: 1.5, color: appColor)),
                        ),
                        Container(
                          height: 108,
                          width: context.width * .8,
                          decoration: BoxDecoration(
                              border: Border.all(width: 1.5, color: appColor),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          child: Column(
                            children: [
                              h1,
                              Text(
                                  allCardController
                                      .getallCardsModel.value.data![1].cardCost
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w800)),
                              h1,
                              ElevatedButton(
                                  onPressed: () {
                                    allCardController.checkOut(allCardController
                                        .getallCardsModel
                                        .value
                                        .data![1]
                                        .cardCost!
                                        .replaceAll(',', '')
                                        .toString());
                                        
                                    allCardController.amount.value =
                                        allCardController.getallCardsModel.value
                                            .data![1].cardCost
                                            .toString();
                                    allCardController.cardType.value =
                                        allCardController.getallCardsModel.value
                                            .data![1].id
                                            .toString();
                                  },
                                  style: ElevatedButton.styleFrom(
                                      fixedSize: Size(100, 20),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      backgroundColor: appColor),
                                  child: Text('Buy Now'))
                            ],
                          ),
                        )
                      ],
                    )),
              h2,
              Obx(() => allCardController.getallCardsModel.value.data == null
                  ? customeShimmer(context)
                  : Column(
                      children: [
                        Container(
                          height: 197,
                          width: context.width * .8,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(allCardController
                                              .getallCardsModel.value.data ==
                                          null
                                      ? ''
                                      : allCardController.getallCardsModel.value
                                          .data![2].cardImage
                                          .toString())),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                              border: Border.all(width: 1.5, color: appColor)),
                        ),
                        Container(
                          height: 108,
                          width: context.width * .8,
                          decoration: BoxDecoration(
                              border: Border.all(width: 1.5, color: appColor),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          child: Column(
                            children: [
                              h1,
                              Text(
                                  allCardController
                                              .getallCardsModel.value.data ==
                                          null
                                      ? ''
                                      : allCardController.getallCardsModel.value
                                          .data![2].cardCost
                                          .toString(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w800)),
                              h1,
                              ElevatedButton(
                                  onPressed: () {
                                    allCardController.checkOut(allCardController
                                        .getallCardsModel
                                        .value
                                        .data![2]
                                        .cardCost!
                                        .replaceAll(',', '')
                                        .toString());
                                        
                                    allCardController.amount.value =
                                        allCardController.getallCardsModel.value
                                            .data![2].cardCost
                                            .toString();
                                    allCardController.cardType.value =
                                        allCardController.getallCardsModel.value
                                            .data![2].id
                                            .toString();
                                  },
                                  style: ElevatedButton.styleFrom(
                                      fixedSize: Size(100, 20),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      backgroundColor: appColor),
                                  child: Text('Buy Now'))
                            ],
                          ),
                        )
                      ],
                    )),
              h2,
              Obx(() => allCardController.getallCardsModel.value.data == null
                  ? customeShimmer(context)
                  : Column(
                      children: [
                        Container(
                          height: 197,
                          width: context.width * .8,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(allCardController
                                              .getallCardsModel.value.data ==
                                          ''
                                      ? ''
                                      : allCardController.getallCardsModel.value
                                          .data![3].cardImage
                                          .toString())),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                              border: Border.all(width: 1.5, color: appColor)),
                        ),
                        Container(
                          height: 108,
                          width: context.width * .8,
                          decoration: BoxDecoration(
                              border: Border.all(width: 1.5, color: appColor),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          child: Column(
                            children: [
                              h1,
                              Text(
                                  allCardController
                                      .getallCardsModel.value.data![3].cardCost
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w800)),
                              h1,
                              ElevatedButton(
                                  onPressed: () {
                                    allCardController.checkOut(allCardController
                                        .getallCardsModel
                                        .value
                                        .data![3]
                                        .cardCost!
                                        .replaceAll(',', '')
                                        .toString());


                                             
                                    allCardController.amount.value =
                                        allCardController.getallCardsModel.value
                                            .data![3].cardCost
                                            .toString();
                                    allCardController.cardType.value =
                                        allCardController.getallCardsModel.value
                                            .data![3].id
                                            .toString();
                                        

                                  },
                                  style: ElevatedButton.styleFrom(
                                      fixedSize: Size(100, 20),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      backgroundColor: appColor),
                                  child: Text('Buy Now'))
                            ],
                          ),
                        )
                      ],
                    )),
              h2,
              Obx(() => allCardController.getallCardsModel.value.data == null
                  ? customeShimmer(context)
                  : Column(
                      children: [
                        Container(
                          height: 197,
                          width: context.width * .8,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(allCardController
                                              .getallCardsModel.value.data ==
                                          ''
                                      ? ''
                                      : allCardController.getallCardsModel.value
                                          .data![4].cardImage
                                          .toString())),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                              border: Border.all(width: 1.5, color: appColor)),
                        ),
                        Container(
                          height: 108,
                          width: context.width * .8,
                          decoration: BoxDecoration(
                              border: Border.all(width: 1.5, color: appColor),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          child: Column(
                            children: [
                              h1,
                              Text(
                                  allCardController
                                      .getallCardsModel.value.data![4].cardCost
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w800)),
                              h1,
                              ElevatedButton(
                                  onPressed: () {
                                    allCardController.checkOut(allCardController
                                        .getallCardsModel
                                        .value
                                        .data![4]
                                        .cardCost!
                                        .replaceAll(',', '')
                                        .toString());
                                             
                                    allCardController.amount.value =
                                        allCardController.getallCardsModel.value
                                            .data![4].cardCost
                                            .toString();
                                    allCardController.cardType.value =
                                        allCardController.getallCardsModel.value
                                            .data![4].id
                                            .toString();
                                  },
                                  style: ElevatedButton.styleFrom(
                                      fixedSize: Size(100, 20),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      backgroundColor: appColor),
                                  child: Text('Buy Now'))
                            ],
                          ),
                        )
                      ],
                    )),
              h5,
            ],
          ),
        ),
      ),
    );
  }

  Shimmer customeShimmer(BuildContext context) {
    return Shimmer.fromColors(
      direction: ShimmerDirection.rtl,
      baseColor: Colors.black26,
      highlightColor: Colors.black12,
      child: SizedBox(
        height: 197,
        width: context.width * .8,
      ),
    );
  }
}
