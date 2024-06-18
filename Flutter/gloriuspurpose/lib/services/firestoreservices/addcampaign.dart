import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:gloriuspurpose/models/campaignmodel.dart';

class CampaignServices{

  static final firestore = FirebaseFirestore.instance.collection("Campaigns");
  static final storage = FirebaseStorage.instance.ref("Campaign");

  static addCamapignIntoUsersDoc(CampaignModel model)async{

    model.imgUrl = await uploadCampaignImage(model.imgUrl);
    final get = await firestore.doc("UserUid").get();
    List listOfCampaigns = get.exists ? get.data()!["Campaigns"] : [];
    listOfCampaigns.add(model.toJson());
    await firestore.doc("UserUid").set({
      "Campaigns":listOfCampaigns
    });

    await addCamapignIntoGeneralDoc(model);

  }


  static addCamapignIntoGeneralDoc(CampaignModel model)async{

    final get = await firestore.doc("allCampaigns").get();
    List listOfCampaigns = get.exists ? get.data()!["Campaigns"] : [];
    listOfCampaigns.add(model.toJson());
    await firestore.doc("allCampaigns").set({
      "Campaigns":listOfCampaigns
    });

  }

  static Future<String> uploadCampaignImage(String? imgPath)async{

    if(imgPath != null && imgPath != "") {
      print("Inside Upload Function");
      final upload = await storage.child("userid").putFile(File(imgPath),);
      print("Uploaded");
      final String downloadUrl = await upload.ref.getDownloadURL();
      return downloadUrl;
    }

    return "Did not Pick Image";

  }



}