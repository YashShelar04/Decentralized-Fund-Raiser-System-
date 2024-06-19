import 'package:get/get.dart';

class LoadingController extends GetxController{
  RxBool isLoading = false.obs;
  RxString loadingMessage = "".obs;
}