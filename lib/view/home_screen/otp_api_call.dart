import 'package:dio/dio.dart';

class OtpApiCall {
  void getHttp(String otp, String mobileNumber) async {


    print('otp poyiiiiiiiiiiiiiiiiiiiiiiiiiiiiii');

    // final baseUrl='http://cannyinfotech.in/api/mt/SendSMS?user=qubematicotp&password=demo1234@&senderid=QBMTIC&channel=Trans&DCS=0&flashsms=0&number=${mobileNumber}&text=123%20is%20the%20$%20to%20verify%20your%20mobile%20number%20with%20Namma%20Swasthya.%20OTP%20will%20expire%20in%205mins.%20Do%20not%20share%20with%20anyone%20-QBMTIC&route=10';
   final baseUrl='http://cannyinfotech.in/api/mt/SendSMS?user=qubematicotp&password=demo1234@&senderid=QBMTIC&channel=Trans&DCS=0&flashsms=0&number=${mobileNumber}&text=${otp}%20is%20the%20OTP%20to%20verify%20your%20mobile%20number%20with%20Namma%20Swasthya.%20OTP%20will%20expire%20in%205mins.%20Do%20not%20share%20with%20anyone%20-QBMTIC&route=10';
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
