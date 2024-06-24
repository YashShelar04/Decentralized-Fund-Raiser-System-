import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gloriuspurpose/colors.dart';
import 'package:shimmer/shimmer.dart';
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
          return Shimmer(loop: 0,
          direction: ShimmerDirection.btt,
          child: ListView.builder(itemCount: 10,itemBuilder: (context,index){
            return Container(
              width: size.width,
              height: size.height*0.3,
              margin: EdgeInsets.symmetric(horizontal: size.width * 0.04,),
              child: Card(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.03, vertical: size.height * 0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: size.width * 0.9,
                        height: size.height * 0.24,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),gradient: LinearGradient(colors: [Colors.grey.shade200,Colors.grey.shade300,Colors.grey.shade400],begin: Alignment.topLeft,end: Alignment.bottomRight),);
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
