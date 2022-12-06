import 'package:dio/dio.dart';
import '../../../original_api/orginal_apis.dart';

class GetUserProfileDetailsService{
  static NammasyastyaOrginalApis orginalApis = NammasyastyaOrginalApis();
   final dio= Dio(BaseOptions(
    baseUrl: orginalApis.baseUrl,responseType: ResponseType.plain
  ));
  Future<Response> getUserProfil(String id)async{
    try {
      print(orginalApis.baseUrl + "get_profile/$id");

      Response response = await dio.get("get_profile/$id");

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