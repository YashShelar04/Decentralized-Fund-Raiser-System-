import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gloriuspurpose/colors.dart';
import 'package:gloriuspurpose/models/campaignmodel.dart';
import 'package:gloriuspurpose/widgets/campaigncard.dart';

class HomeScreen extends StatelessWidget {
  final firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StreamBuilder(
      stream: firestore.collection("Campaigns").doc("allCampaigns").snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: myGreen,
            ),
          );
        }

        List data = [];
        try {
          data = snapshot.data!.data()!['Campaigns'];
        }catch(e){

          return const Center(child: Text("Sorry No Campaigns are live at this moment",style: TextStyle(fontSize: 20),textAlign: TextAlign.center,),);
        }

        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: data.length,
          itemBuilder: (context, index) {
            final campaign = CampaignModel.fromJson(data[index]);
            return CampaignCard(
              model: campaign,
            );
          },
        );
      },
    );
  }
}
