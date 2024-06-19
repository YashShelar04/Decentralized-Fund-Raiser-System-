import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gloriuspurpose/colors.dart';
import 'package:gloriuspurpose/models/campaignmodel.dart';
import 'package:gloriuspurpose/screens/home/viewcampaign.dart';

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

class CampaignCard extends StatelessWidget {
  final CampaignModel model;

  CampaignCard({required this.model});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
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
              Hero(
                tag: model.campaignId.toString(),
                child: Container(
                  alignment: Alignment.center,
                  width: size.width * 0.9,
                  height: size.height * 0.24,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: NetworkImage(
                          model.imgUrl.toString(),
                        ),
                        fit: BoxFit.cover),
                  ),
                ),
              ),

              //Title
              Theme(
                data: ThemeData().copyWith(dividerColor: Colors.transparent,splashFactory: NoSplash.splashFactory),
                child: ExpansionTile(

                  title: Text(
                    model.title.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  children: [
                    ListTile(
                      title: Text(model.description.toString()),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () => Get.to(
                      () => ViewCampaign(
                            campaign: model,
                          ),
                      transition: Transition.rightToLeft),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: myGreen,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      "View Campaign",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
