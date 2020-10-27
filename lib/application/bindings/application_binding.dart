import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ApplicationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => Dio(BaseOptions(baseUrl: 'https://5f7cba02834b5c0016b058aa.mockapi.io/api')),
    );
  }
}
