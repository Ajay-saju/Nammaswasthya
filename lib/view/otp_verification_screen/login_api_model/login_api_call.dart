import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:swasthya/original_api/orginal_apis.dart';

class UserPhoneNumberVerificationApiCall{

  static NammasyastyaOrginalApis orginalApis = NammasyastyaOrginalApis();

  
  final dio= Dio(BaseOptions(
    baseUrl: orginalApis.baseUrl,responseType: ResponseType.plain
  ));

  Future<Response> userLoginCheck (Map<String,dynamic>login)async{

    try {
      Response response = await dio.post('login',data: jsonEncode(login));
      return response;

      
      
    } on DioError catch (e){
     print(e.message);
      rethrow;
    }
    
    catch (e) {
      print(e.toString());
      rethrow;
      
    }

  }
}