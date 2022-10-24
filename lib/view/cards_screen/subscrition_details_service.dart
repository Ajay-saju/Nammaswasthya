import 'package:dio/dio.dart';

import '../../original_api/orginal_apis.dart';

class SubscriptionDetailsService {
  static NammasyastyaOrginalApis orginalApis = NammasyastyaOrginalApis();
   final dio= Dio(BaseOptions(
    baseUrl: orginalApis.baseUrl,responseType: ResponseType.plain
  ));

  Future<Response>postSubscriptionDetails(Map<String,dynamic>details)async{
    try {


      print(details.toString());
      print(orginalApis.baseUrl+"subscription");

      Response response = await dio.post("subscription",data: details);

      print(response.data.toString());
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