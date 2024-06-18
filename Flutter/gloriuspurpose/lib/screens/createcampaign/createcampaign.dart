import 'dart:io';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gloriuspurpose/colors.dart';
import 'package:gloriuspurpose/controllers/createcampaigncontroller.dart';
import 'package:gloriuspurpose/controllers/loadingcontroller.dart';
import 'package:gloriuspurpose/models/campaignmodel.dart';
import 'package:gloriuspurpose/services/firestoreservices/addcampaign.dart';
import 'package:gloriuspurpose/services/infomanager.dart';
import 'package:gloriuspurpose/widgets/mytextfield.dart';
import 'package:image_picker/image_picker.dart';

class CreateCampaign extends StatefulWidget {
  @override
  State<CreateCampaign> createState() => _CreateCampaignState();
}

class _CreateCampaignState extends State<CreateCampaign> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descrController = TextEditingController();
  TextEditingController sDateController = TextEditingController();
  TextEditingController hashTagController = TextEditingController();
  String startDate =
      "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}";

  final createCampaignController = Get.put(
    CreateCampaignController(),
  );

  final loadingController = Get.put(
    LoadingController(),
  );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Get.back(),
        ),
        backgroundColor: myGreen,
        foregroundColor: Colors.white,
        title: Text("Create Campaign"),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.02,
              ),
              InkWell(
                onTap: () async {
                  final pickedImg = await ImagePicker.platform
                      .getImageFromSource(source: ImageSource.gallery);
                  if (pickedImg != null) {
                    createCampaignController.imgPath.value = pickedImg.path;
                  }
                },
                child: Obx(
                  () => Container(
                    alignment: Alignment.center,
                    width: size.width * 0.9,
                    height: size.height * 0.24,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: createCampaignController.imgPath.value.isNotEmpty
                        ? Image.file(
                            File(createCampaignController.imgPath.value),
                            fit: BoxFit.fitWidth,
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.image,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Click here to select Image",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Container(
                width: size.width * 0.75,
                child: Text(
                  "Title",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                ),
              ),
              MyTextField(
                  controller: titleController,
                  height: size.height * 0.065,
                  width: size.width * 0.83,
                  hintText: "Enter Title"),
              SizedBox(
                height: size.height * 0.02,
              ),
              Container(
                width: size.width * 0.75,
                child: Text(
                  "Description",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                ),
              ),
              MyTextField(
                  controller: descrController,
                  height: size.height * 0.1,
                  width: size.width * 0.83,
                  hintText: "Enter Description"),
              SizedBox(
                height: 25,
              ),

              Container(
                width: size.width * 0.5,
                child: Row(
                  children: [
                    Expanded(
                      child: Obx(
                        () => InkWell(
                          splashFactory: NoSplash.splashFactory,
                          onTap: () {
                            createCampaignController.isAimMoney.value = true;
                          },
                          child: Container(
                            height: size.height * 0.06,
                            decoration: BoxDecoration(
                              color: createCampaignController.isAimMoney.value
                                  ? Colors.green
                                  : Colors.grey.shade200,
                              borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(25),
                              ),
                            ),
                            child: Icon(
                              Icons.money,
                              color: createCampaignController.isAimMoney.value
                                  ? Colors.white
                                  : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Obx(
                        () => InkWell(
                          splashFactory: NoSplash.splashFactory,
                          onTap: () {
                            createCampaignController.isAimMoney.value = false;
                          },
                          child: Container(
                            height: size.height * 0.06,
                            decoration: BoxDecoration(
                              color: !createCampaignController.isAimMoney.value
                                  ? Colors.green
                                  : Colors.grey.shade200,
                              borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(25),
                              ),
                            ),
                            child: Icon(
                              Icons.timer,
                              color: !createCampaignController.isAimMoney.value
                                  ? Colors.white
                                  : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: size.height * 0.035,
              ),

              //Amount Section
              Obx(
                () => Container(
                  child: createCampaignController.isAimMoney.value
                      ? SizedBox(
                          width: size.width * 0.75,
                          child: Text(
                            "Amount: ${createCampaignController.aim.value} ETH",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 18),
                          ),
                        )
                      : SizedBox(),
                ),
              ),
              Obx(
                () => Container(
                  child: createCampaignController.isAimMoney.value
                      ? SizedBox(
                          width: size.width * 0.9,
                          child: Slider(
                            activeColor: myGreen,
                            thumbColor: myGreen,
                            divisions: 20,
                            label: "${createCampaignController.aim.value} ETH",
                            value:
                                createCampaignController.aim.value.toDouble(),
                            min: 0,
                            max: 100,
                            onChanged: (val) {
                              createCampaignController.aim.value = val.toInt();
                            },
                          ),
                        )
                      : SizedBox(),
                ),
              ),

              Obx(
                () => Container(
                  child: !createCampaignController.isAimMoney.value
                      ? Container(
                          width: size.width * 0.75,
                          child: Text(
                            "Start Date",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 18),
                          ),
                        )
                      : SizedBox(),
                ),
              ),
              Obx(
                () => Container(
                  child: !createCampaignController.isAimMoney.value
                      ? InkWell(
                          onTap: () async {
                            final pickedDate = await showDatePicker(
                              context: context,
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2030),
                            );
                            if (pickedDate != null) {
                              createCampaignController.startDate.value =
                                  "${pickedDate!.day}/${pickedDate!.month}/${pickedDate!.year}";
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.06),
                            alignment: Alignment.centerLeft,
                            width: size.width * 0.8,
                            height: size.height * 0.08,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              createCampaignController.startDate.value != ""
                                  ? createCampaignController.startDate.value
                                  : "Enter Starting Date",
                            ),
                          ),
                        )
                      : SizedBox(),
                ),
              ),
              Obx(
                () => Container(
                  child: !createCampaignController.isAimMoney.value
                      ? SizedBox(
                          height: 10,
                        )
                      : SizedBox(),
                ),
              ),
              Obx(
                () => Container(
                  child: !createCampaignController.isAimMoney.value
                      ? Container(
                          width: size.width * 0.75,
                          child: Text(
                            "End Date",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 18),
                          ),
                        )
                      : SizedBox(),
                ),
              ),
              Obx(
                () => Container(
                  child: !createCampaignController.isAimMoney.value
                      ? InkWell(
                          onTap: () async {
                            final pickedDate = await showDatePicker(
                              context: context,
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2030),
                            );
                            if (pickedDate != null) {
                              createCampaignController.endDate.value =
                                  "${pickedDate!.day}/${pickedDate!.month}/${pickedDate!.year}";
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.06),
                            alignment: Alignment.centerLeft,
                            width: size.width * 0.8,
                            height: size.height * 0.08,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              createCampaignController.endDate.value != ""
                                  ? createCampaignController.endDate.value
                                  : "Enter End Date",
                            ),
                          ),
                        )
                      : SizedBox(),
                ),
              ),

              SizedBox(
                height: 20,
              ),
              Container(
                width: size.width * 0.75,
                child: Text(
                  "Category",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                ),
              ),
              SizedBox(
                height: 7,
              ),
              DropdownMenu(
                enableFilter: true,
                onSelected: (val) {
                  print(val);
                },
                hintText: "Select Category",
                width: size.width * 0.8,
                dropdownMenuEntries: const [
                  DropdownMenuEntry(value: 0, label: "Health and Medical"),
                  DropdownMenuEntry(value: 1, label: "Education"),
                  DropdownMenuEntry(value: 2, label: "Human Services"),
                  DropdownMenuEntry(value: 3, label: "Environmental"),
                  DropdownMenuEntry(value: 4, label: "Arts and Culture"),
                  DropdownMenuEntry(value: 5, label: "Disaster Relief"),
                  DropdownMenuEntry(value: 6, label: "Animal Welfare"),
                  DropdownMenuEntry(value: 7, label: "Senior Services"),
                  DropdownMenuEntry(value: 8, label: "Military Support"),
                  DropdownMenuEntry(value: 9, label: "Religious"),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: size.width * 0.75,
                child: Text(
                  "HashTags",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
                alignment: Alignment.center,
                width: size.width * 0.83,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextField(
                  controller: hashTagController,
                  decoration: InputDecoration(
                    suffixIcon: InkWell(
                      onTap: () {
                        createCampaignController.hashTags
                            .add("#${hashTagController.text}");
                        hashTagController.clear();
                      },
                      child: Icon(Icons.add),
                    ),
                    border: InputBorder.none,
                    hintText: "Enter HashTags",
                  ),
                ),
              ),
              Obx(
                () => createCampaignController.hashTags.isNotEmpty
                    ? Container(
                        constraints: BoxConstraints(
                          minHeight: size.height * 0.04,
                          maxHeight: size.height * 0.075,
                        ),
                        child: ListView.builder(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.05,
                                vertical: size.height * 0.01),
                            scrollDirection: Axis.horizontal,
                            itemCount: createCampaignController.hashTags.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.005),
                                padding: EdgeInsets.all(10),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: myGreen,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      createCampaignController.hashTags[index],
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    SizedBox(
                                      width: size.width * 0.03,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        createCampaignController.hashTags
                                            .removeAt(index);
                                      },
                                      child: Icon(
                                        Icons.close,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      )
                    : SizedBox(),
              ),

              SizedBox(
                height: 30,
              ),

              Obx(
                () => InkWell(
                  splashFactory: NoSplash.splashFactory,
                  onTap: () async {
                    loadingController.isLoading.value = true;
                    CampaignModel campaign = CampaignModel(
                        imgUrl: createCampaignController.imgPath.value,
                        category: "Category",
                        title: titleController.text,
                        description: descrController.text,
                        accountAddress: Infomanager.getAccountAddress(),
                        isAimAmt: createCampaignController.isAimMoney.value,
                        aim: createCampaignController.aim.value,
                        startDate: createCampaignController.startDate.value,
                        endDate: createCampaignController.endDate.value,
                        hashTags: createCampaignController.hashTags,
                        collected: 0,
                        userUid: "UserId",
                        campaignId: "Randomly GeneratedId",
                        isLive: true,
                        outputImg: [],
                        outputText: "");
                    await CampaignServices.addCamapignIntoUsersDoc(campaign);
                    createCampaignController.clearAllValues();
                    loadingController.isLoading.value = false;
                    Get.back();
                  },
                  child: Container(
                    width: size.width * 0.85,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: loadingController.isLoading.value
                          ? Colors.grey.shade300
                          : myGreen,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: loadingController.isLoading.value
                        ? Center(
                            child: CircularProgressIndicator(color: myGreen),
                          )
                        : Text(
                            "Create Campaign",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                  ),
                ),
              ),

              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
