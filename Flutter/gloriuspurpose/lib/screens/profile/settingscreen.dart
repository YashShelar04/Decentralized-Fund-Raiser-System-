import 'package:flutter/material.dart';

import '../../colors.dart';

class SettingsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myGreen,
        foregroundColor: Colors.white,
        title: Text("Settings"),
      ),

      body: Center(
        child: Column(
          children: [

            SizedBox(
              height: size.height*0.02,
            ),

            Row(
              children: [
                SizedBox(
                  width: size.width*0.05,
                ),
                Expanded(child: Divider(color: myGreen,),),
                SizedBox(
                  width: size.width*0.05,
                ),
                Text("Account",style: TextStyle(color: myGreen,fontWeight: FontWeight.bold,fontSize: 18),),
                SizedBox(
                  width: size.width*0.05,
                ),
                Expanded(child: Divider(color: myGreen,),),
                SizedBox(
                  width: size.width*0.05,
                ),
              ],
            ),

            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: size.width*0.04),
              child: Card(
                color: myGreen,
                elevation: 5,
                child: ListTile(
                  textColor: Colors.white,
                  title: Text("Edit Account Details"),
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: size.width*0.04),
              child: Card(
                color: myGreen,
                elevation: 5,
                child: ListTile(
                  textColor: Colors.white,
                  title: Text("View Account Details"),
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: size.width*0.04),
              child: Card(
                color: myGreen,
                elevation: 5,
                child: ListTile(
                  textColor: Colors.white,
                  title: Text("Switch Accounts"),
                ),
              ),
            ),

            SizedBox(
              height: 30,
            ),


            Row(
              children: [
                SizedBox(
                  width: size.width*0.05,
                ),
                Expanded(child: Divider(color: myGreen,),),
                SizedBox(
                  width: size.width*0.05,
                ),
                Text("About Us",style: TextStyle(color: myGreen,fontWeight: FontWeight.bold,fontSize: 18),),
                SizedBox(
                  width: size.width*0.05,
                ),
                Expanded(child: Divider(color: myGreen,),),
                SizedBox(
                  width: size.width*0.05,
                ),
              ],
            ),

            SizedBox(
              height: 10,
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: size.width*0.04),
              child: Card(
                color: myGreen,
                elevation: 5,
                child: ListTile(
                  textColor: Colors.white,
                  title: Text("Contact Us"),
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: size.width*0.04),
              child: Card(
                color: myGreen,
                elevation: 5,
                child: ListTile(
                  textColor: Colors.white,
                  title: Text("Visit our Website"),
                ),
              ),
            ),

            Spacer(),

            Text("App Version",style: TextStyle(color: Colors.green.shade200,fontSize: 17),),
            Text("v0.0.1",style: TextStyle(color: Colors.green.shade200,fontSize: 17),),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
