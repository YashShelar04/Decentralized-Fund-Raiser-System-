import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gloriuspurpose/colors.dart';

import '../navigationscreen.dart';

class WalletScreen extends StatelessWidget {

  final TextEditingController accountAddressController = TextEditingController();
  final TextEditingController privateKeyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(

      backgroundColor: myGreen,
      body: Center(
        child: Column(

          children: [

            SizedBox(
              height: size.height*0.04,
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 10),
              child: IconButton(onPressed: (){
                Get.back();
              },icon: Icon(Icons.arrow_back_ios,color: Colors.white,),),
            ),
            SizedBox(
              height: 75,
            ),

            Text("Set up your Wallet",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 23),),


            SizedBox(height: 150,),
            Container(width: size.width*0.8,child: Text("Enter Account Address (43 Characters)",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 15),),),

            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 45,
              width: size.width*0.85,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextField(
                controller: accountAddressController,
                decoration: InputDecoration(
                  hintText: "Eg : 0x3EEB1573BEA791Cf799Ff3a528947DD096Ca7E13",
                  border: InputBorder.none,
                ),
              ),
            ),


            SizedBox(height: 30,),
            Container(width: size.width*0.8,child: Text("Enter Private Key (66 Characters)",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 15),),),

            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 45,
              width: size.width*0.85,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextField(
                controller: privateKeyController,
                decoration: InputDecoration(
                  hintText: "Eg : 0xd512e1763f45976f27f94a4926ba83333bd246a9727423db704496f6bf161f3b",
                  border: InputBorder.none,
                ),
              ),
            ),

            Spacer(),

            InkWell(
              onTap: (){
                Get.back();
                Get.off(()=>NavigationScreen(),transition: Transition.rightToLeft);
              },
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: size.width*0.04),
                width: size.width*0.8,
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text("Create Wallet",style: TextStyle(color: myGreen,fontWeight: FontWeight.bold,fontSize: 18),),
              ),
            ),

            SizedBox(
              height: 20,
            ),


          ],
        ),
      ),
    );
  }
}
