import 'package:flutter/material.dart';
import 'package:gloriuspurpose/colors.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(physics: const BouncingScrollPhysics(),itemCount: 4,itemBuilder: (context,index){
      return CampaignCard();
    });
  }
}


class CampaignCard extends StatelessWidget {

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
              Container(
                alignment: Alignment.center,
                width: size.width * 0.9,
                height: size.height * 0.24,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  Icons.image,
                  color: Colors.grey.shade800,
                ),
              ),

              //Title
              Theme(
                data: ThemeData()
                    .copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  title: Text(
                    "Title of the Fund what if the title Gets longer",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  children: [
                    ListTile(
                      title: Text(
                        "Title of the Fund what if the title Gets longer Title of the Fund what if the title Gets longer Title of the Fund what if the title Gets longer Title of the Fund what if the title Gets longer",
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: myGreen,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text("View Campaign",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
