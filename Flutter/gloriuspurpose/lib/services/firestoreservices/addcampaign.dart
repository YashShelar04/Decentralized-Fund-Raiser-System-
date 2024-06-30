import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:gloriuspurpose/models/campaignmodel.dart';

class CampaignServices{

  static final firestore = FirebaseFirestore.instance.collection("Campaigns");
  static final storage = FirebaseStorage.instance.ref("Campaign");

  static addCamapignIntoUsersDoc(CampaignModel model)async{

    print(model.toJson());

    final get = await firestore.doc("UserUid").get();
    List listOfCampaigns = get.exists ? get.data()!["Campaign"] : [];
    model.imgUrl = await uploadCampaignImage(model.imgUrl,listOfCampaigns.length.toString(),);
    listOfCampaigns.add(model.toJson());
    await firestore.doc("UserUid").set({
      "Campaigns":listOfCampaigns
    });

    await addCamapignIntoGeneralDoc(model);

  }


  static addCamapignIntoGeneralDoc(CampaignModel model)async{

    final get = await firestore.doc("allCampaigns").get();
    List listOfCampaigns = get.exists ? get.data()!["Campaign"] : [];
    listOfCampaigns.add(model.toJson());
    await firestore.doc("allCampaigns").set({
      "Campaigns":listOfCampaigns
    });

  }

  static Future<String> uploadCampaignImage(String? imgPath,String index)async{

    if(imgPath != null && imgPath != "") {
      final upload = await storage.child("UserUid").child(index).putFile(File(imgPath),);
      final String downloadUrl = await upload.ref.getDownloadURL();
      return downloadUrl;
    }

    return "Did not Pick Image";

  }

  static Future<bool> campaignEnd(String campaignId)async{

    final get = await firestore.doc("allCampaigns").get();
    List allCampaigns = get.data()!['Campaigns'];
    for(Map i in allCampaigns){
      if(i["campaignId"] == campaignId){
        i["isLive"] = false;
        break;
      }
    }
    await firestore.doc("allCampaigns").set({"Campaigns": allCampaigns});

    final get2 = await firestore.doc("UserUid").get();
    allCampaigns = get2.data()!['Campaigns'];
    for(Map i in allCampaigns){
      if(i["campaignId"] == campaignId){
        i["isLive"] = false;
        break;
      }
    }
    await firestore.doc("UserUid").set({"Campaigns": allCampaigns});

    return true;
  }



}