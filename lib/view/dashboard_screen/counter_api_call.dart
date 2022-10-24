import 'package:dio/dio.dart';
import 'package:swasthya/original_api/orginal_apis.dart';

class CounterApiCall{
  static NammasyastyaOrginalApis orginalApis = NammasyastyaOrginalApis();
   final dio= Dio(BaseOptions(
    baseUrl: orginalApis.baseUrl,responseType: ResponseType.plain
  ));



  Future<Response> callCounter ()async{

    try {

      print(orginalApis.baseUrl+"counter");

      Response response = await dio.get("counter");

      print('api is working');
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