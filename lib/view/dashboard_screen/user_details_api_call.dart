import 'package:dio/dio.dart';
import 'package:swasthya/original_api/orginal_apis.dart';

class UserDetails{
   static NammasyastyaOrginalApis orginalApis = NammasyastyaOrginalApis();
   final dio= Dio(BaseOptions(
    baseUrl: orginalApis.baseUrl,responseType: ResponseType.plain
  ));

Future<Response> userLoginCheck (String id)async{

    try {

      print(orginalApis.baseUrl+"card/$id");

      Response response = await dio.get("card/$id");

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