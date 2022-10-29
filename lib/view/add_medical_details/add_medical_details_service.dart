import 'package:dio/dio.dart';

import '../../original_api/orginal_apis.dart';

class MedicalDetailService {
  static NammasyastyaOrginalApis orginalApis = NammasyastyaOrginalApis();

  final dio = Dio(BaseOptions(
      baseUrl: orginalApis.baseUrl, responseType: ResponseType.plain));

      Future<Response>addDetails(FormData form)async{

        print(form.toString());

        try {
          Response response =await dio.post('medical_history',data:form );
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
