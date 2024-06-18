import 'package:flutter/material.dart';

import '../../colors.dart';

class ContributionScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Contribute"),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Column(
            children: [

              SizedBox(
                height: 20,
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Card(
                  child: Column(
                    children: [
                      ListTile(
                        title: Text("Amount",style: TextStyle(color: Colors.grey.shade500,fontSize: 16),),
                        trailing: Text("5 ETH",style: TextStyle(fontSize: 16,color: Colors.grey.shade500,),),
                      ),
                      ListTile(
                        title: Text("Gas Price",style: TextStyle(color: Colors.grey.shade500,fontSize: 16),),
                        trailing: Text("0.00064 ETH",style: TextStyle(fontSize: 16,color: Colors.grey.shade500,),),
                      ),
                      ListTile(
                        title: Text("Total",style: TextStyle(color: Colors.grey.shade500,fontSize: 16),),
                        trailing: Text("5.00064 ETH",style: TextStyle(fontSize: 16,color: Colors.grey.shade500,),),
                      ),
                      ListTile(
                        title: Text("Time",style: TextStyle(color: Colors.grey.shade500,fontSize: 16),),
                        trailing: Text("${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",style: TextStyle(fontSize: 16,color: Colors.grey.shade500,),),
                      ),
                      ListTile(
                        title: Text("From",style: TextStyle(color: Colors.grey.shade500,fontSize: 16),),
                        trailing: Text("0x3EE******************",style: TextStyle(fontSize: 16,color: Colors.grey.shade500,),),
                      ),
                      ListTile(
                        title: Text("To",style: TextStyle(color: Colors.grey.shade500,fontSize: 16),),
                        trailing: Text("0x3EE******************",style: TextStyle(fontSize: 16,color: Colors.grey.shade500,),),
                      ),
                    ],
                  ),
                ),
              ),


              SizedBox(
                height: size.height*0.25,
              ),

              Container(
                alignment: Alignment.center,
                width: size.width*0.85,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: myGreen,
                ),
                child: Text("Confirm",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
              ),

              SizedBox(
                height: 13,
              ),

              Container(
                alignment: Alignment.center,
                width: size.width*0.85,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.red,width: 1.5),
                ),
                child: Text("Cancel",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
              ),

              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
