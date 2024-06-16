import 'package:get/get.dart';

class CreateCampaignController extends GetxController
{
  RxInt aim = 0.obs;
  RxString startDate = "".obs;
  RxString endDate = "".obs;
  RxList hashTags = [].obs;
  RxBool isAimMoney = true.obs;
  RxString imgPath = "".obs;

  clearAllValues(){
    aim.value = 0;
    startDate.value = "";
    endDate.value = "";
    hashTags.value = [];
    isAimMoney.value = true;
    imgPath.value = "";
  }
}