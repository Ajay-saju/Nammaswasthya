import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:swasthya/main.dart';
import 'package:swasthya/view/bottom_navigation_bar/navigation_screen.dart';
import 'package:swasthya/view/cards_screen/get_all_card_model.dart';
import 'package:swasthya/view/cards_screen/subscrition_details_service.dart';

import 'get_all_card_service.dart';

class CardScreenController extends GetxController {
  static const keyId = "rzp_test_9rG7ClR4bO47u9";
  static const keySecret = "3wQnashnGoeS56aVWfpSYOZ7";
  final razorpay = Razorpay();

  Rx<GetAllCards> getallCardsModel = GetAllCards().obs;
  final subscriptionDetailsService = SubscriptionDetailsService();

  Map<String, dynamic> cardDetails = {
    // "user_id": prefer.getString('id').toString(),
    // "card_type": "1",
    // "amount": "1500",
    // "payment_status": "success"
  };

  void onInit() {
    getAllCardDetails();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
      razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
      razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    });
    super.onInit();
  }

  getCurrentCardDetails(
    String card_Type,
    String amount,
  ) {
    cardDetails = {
      "user_id": prefer.getString('id').toString(),
      "card_type": card_Type,
      "amount": amount,
      "payment_status": "success"
    };
  }

  Future<GetAllCards?> getAllCardDetails() async {
    final getAllCardsDetailsService = GetAllCardsDetailsService();

    try {
      final response = await getAllCardsDetailsService.getAllCardDetails();

      var jsonFile = jsonDecode(response.data);

      if (jsonFile["status"] == "success") {
        getallCardsModel.value = GetAllCards.fromJson(jsonFile);
        print(getallCardsModel.value.data![0].cardCost.toString());
      }
    } catch (e) {
      if (e is DioError) {}
      return null;
    }
    update();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    subscriptionDetailsService.postSubscriptionDetails(cardDetails);

    Get.defaultDialog(
        title: 'Payment Success', titleStyle: TextStyle(color: Colors.green));

        
        Timer(Duration(seconds: 2), (){
          Get.off(BottumNavBarScreen());

        });

        
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Get.defaultDialog(
        title: 'Payment Error', titleStyle: TextStyle(color: Colors.red));
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Get.defaultDialog(
        title: 'Externell_wallet' + response.walletName!,
        titleStyle: TextStyle(color: Colors.amber));
  }

  void checkOut(String amount) async {
    var options = {
      'key': "rzp_test_9rG7ClR4bO47u9",
      'amount': double.parse(amount) * 100,
      'name': 'Namma Swasthya',
      'description': 'Fine T-Shirt',
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'}
    };
    try {
      razorpay.open(options);
    } catch (e) {
      print(e.toString());
    }
  }

  subscriptionDetails() {}

  @override
  void dispose() {
    razorpay.clear();

    super.dispose();
  }
}
