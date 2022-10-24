import 'package:dio/dio.dart';

import '../../original_api/orginal_apis.dart';

class GetAllCardsDetailsService{
   static NammasyastyaOrginalApis orginalApis = NammasyastyaOrginalApis();
   final dio= Dio(BaseOptions(
    baseUrl: orginalApis.baseUrl,responseType: ResponseType.plain
  ));

  Future<Response>getAllCardDetails()async{
    try {

      
      print(orginalApis.baseUrl+"company_cards");


      Response response = await dio.get("company_cards");
       print('api is working');
      return response;
    } 
    on DioError catch (e){
     print(e.message);
      rethrow;
    }
    catch (e) {

       print(e.toString());
      rethrow;
      
    }
  }
}