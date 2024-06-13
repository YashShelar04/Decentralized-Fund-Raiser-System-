import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class CreateCampaignController extends GetxController
{
  RxInt aim = 0.obs;
  RxString startDate = "".obs;
  RxString endDate = "".obs;
  RxList hashTags = [].obs;
  RxBool isAimMoney = true.obs;
  RxString imgPath = "".obs;
}