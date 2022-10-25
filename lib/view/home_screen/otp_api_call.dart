import 'package:dio/dio.dart';

class OtpApiCall {
  void getHttp(String otp, String mobileNumber) async {


    print('APi is Workinnnnnnnngggggggggggggg');
    final baseUrl =
    'http://cannyinfotech.in/api/mt/SendSMS?apikey=8mvzJQl58USZmpySsmBWOw&senderid=STUDYS&channel=TRANS&DCS=0&flashsms=0&number=${mobileNumber}&text=${otp}&route=15';
        // 'http://cannyinfotech.in/api/mt/SendSMS?APIKEY=3ndM6QrNWUCt6EeFTJS09A&senderid=STUDNT&channel=Trans&DCS=0&flashsms=0&number=${mobileNumber}&text=${otp}&route=15';
    try {
      print(mobileNumber);
      print(otp);
      var response = await Dio().get(baseUrl);
      print(response);
    } catch (e) {
      print(e);
    }
  }
}
