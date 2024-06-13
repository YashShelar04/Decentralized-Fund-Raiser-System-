import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gloriuspurpose/colors.dart';
import 'package:gloriuspurpose/screens/createcampaign/createcampaign.dart';

class IntroCreation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    Size size = MediaQuery.of(context).size;
    
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Center(
        child: Column(
          children: [

            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: size.height*0.3,
              width: size.width*0.9,
              child: Image.asset("assets/campaign1.jpg",fit: BoxFit.cover,),
            ),

            SizedBox(
              height: 15,
            ),

            InkWell(
              splashFactory: NoSplash.splashFactory,
              onTap: (){
                Get.to(()=> CreateCampaign(),transition: Transition.downToUp);
              },
              child: Container(
                alignment: Alignment.center,
                width: size.width*0.85,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: myGreen,
                ),
                child: Text("Raise a Campaign",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
