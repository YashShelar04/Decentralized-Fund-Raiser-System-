import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gloriuspurpose/colors.dart';
import 'package:gloriuspurpose/screens/home/viewcampaign.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(physics: const BouncingScrollPhysics(),itemCount: 4,itemBuilder: (context,index){
      return CampaignCard(index: index,);
    });
  }
}


class CampaignCard extends StatelessWidget {

  final int index;
  CampaignCard({required this.index});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.04,vertical: 5),
      child: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.03,
              vertical: size.height * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5,
              ),
              Hero(
                tag: index.toString(),
                child: Container(
                  alignment: Alignment.center,
                  width: size.width * 0.9,
                  height: size.height * 0.24,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(image: NetworkImage("https://cdn.pixabay.com/photo/2023/08/19/06/55/world-day-against-child-labour-8199895_1280.jpg",),fit: BoxFit.fill),
                  ),
                ),
              ),

              //Title
              Theme(
                data: ThemeData()
                    .copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  title: Text(
                    "Campaign Against Child Labour",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  children: [
                    ListTile(
                      title: Text(
                        '''Child labour is a pervasive issue that affects millions of children worldwide, depriving them of their childhood, education, and opportunities for a better future. It is defined as work that is mentally, physically, socially, or morally harmful to children and interferes with their schooling. '''),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: ()=>Get.to(()=> ViewCampaign(index: index),transition: Transition.rightToLeft),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: myGreen,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text("View Campaign",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
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
