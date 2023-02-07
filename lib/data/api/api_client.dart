import 'package:fooddelivery/utils/app_constants.dart';
import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;

  late Map<String, String> _mainHeaders;


  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = Duration(seconds: 30);
    token = AppConstants.TOKEN;
    _mainHeaders = {
      'Content-Type': 'application/json; charset=UTF-8', //Key: Value //디코딩, 인코딩 세션
      'Authorization' : 'Bearer $token', //기기에서 서버로의 토큰
    };
  }
  Future<Response> getData(String uri,)async{
    try{
      Response response= await get(uri);
      return response;
    }catch(e){
      return Response(statusCode: 1, statusText: e.toString());
    }//서버에서 데이터를 가져오기 위한 간단한 요청
  }
}
