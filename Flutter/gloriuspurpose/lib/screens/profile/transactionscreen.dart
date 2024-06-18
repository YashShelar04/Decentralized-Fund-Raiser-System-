import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gloriuspurpose/colors.dart';

class TransactionScreen extends StatelessWidget
{

  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return Scaffold(

      appBar: AppBar(
        backgroundColor: myGreen,
        foregroundColor: Colors.white,
        title: Text("Transactions"),
      ),

      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Column(
            children: [

              SizedBox(
                height: size.height*0.02,
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: size.width*0.04),
                child: Card(
                  color: myGreen,
                  elevation: 5,
                  child: ListTile(
                    textColor: Colors.white,

                    leading: Icon(CupertinoIcons.arrow_down_left,color: Colors.white,),

                    title: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Title of the Transaction",maxLines: 1,overflow: TextOverflow.ellipsis,),
                        Text("Transaction Id : ${"anjsndjd7DS6fyghsdhg6t"}",maxLines: 1,overflow: TextOverflow.ellipsis,),
                        Text("To : ${"Ackncjsdbbh2113neb"}",maxLines: 1,overflow: TextOverflow.ellipsis,),
                        Text("Status : ${"Successful"}")
                      ],
                    ),

                    trailing: Column(
                      children: [
                        Text("5",style: TextStyle(fontSize: 23),),
                        Text("ETH",style: TextStyle(fontSize: 15),)
                      ],
                    ),
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: size.width*0.04),
                child: Card(
                  color: Colors.red,
                  elevation: 5,
                  child: ListTile(
                    textColor: Colors.white,

                    leading: Icon(CupertinoIcons.arrow_down_left,color: Colors.white,),

                    title: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Title of the Transaction",maxLines: 1,overflow: TextOverflow.ellipsis,),
                        Text("Transaction Id : ${"anjsndjd7DS6fyghsdhg6t"}",maxLines: 1,overflow: TextOverflow.ellipsis,),
                        Text("To : ${"Ackncjsdbbh2113neb"}",maxLines: 1,overflow: TextOverflow.ellipsis,),
                        Text("Status : ${"Successful"}")
                      ],
                    ),

                    trailing: Column(
                      children: [
                        Text("5",style: TextStyle(fontSize: 23),),
                        Text("ETH",style: TextStyle(fontSize: 15),)
                      ],
                    ),
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

                    leading: Icon(CupertinoIcons.arrow_down_left,color: Colors.white,),

                    title: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Title of the Transaction",maxLines: 1,overflow: TextOverflow.ellipsis,),
                        Text("Transaction Id : ${"anjsndjd7DS6fyghsdhg6t"}",maxLines: 1,overflow: TextOverflow.ellipsis,),
                        Text("To : ${"Ackncjsdbbh2113neb"}",maxLines: 1,overflow: TextOverflow.ellipsis,),
                        Text("Status : ${"Successful"}")
                      ],
                    ),

                    trailing: Column(
                      children: [
                        Text("5",style: TextStyle(fontSize: 23),),
                        Text("ETH",style: TextStyle(fontSize: 15),)
                      ],
                    ),
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

                    leading: Icon(CupertinoIcons.arrow_down_left,color: Colors.white,),

                    title: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Title of the Transaction",maxLines: 1,overflow: TextOverflow.ellipsis,),
                        Text("Transaction Id : ${"anjsndjd7DS6fyghsdhg6t"}",maxLines: 1,overflow: TextOverflow.ellipsis,),
                        Text("To : ${"Ackncjsdbbh2113neb"}",maxLines: 1,overflow: TextOverflow.ellipsis,),
                        Text("Status : ${"Successful"}")
                      ],
                    ),

                    trailing: Column(
                      children: [
                        Text("5",style: TextStyle(fontSize: 23),),
                        Text("ETH",style: TextStyle(fontSize: 15),)
                      ],
                    ),
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: size.width*0.04),
                child: Card(
                  color: Colors.red,
                  elevation: 5,
                  child: ListTile(
                    textColor: Colors.white,

                    leading: Icon(CupertinoIcons.arrow_down_left,color: Colors.white,),

                    title: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Title of the Transaction",maxLines: 1,overflow: TextOverflow.ellipsis,),
                        Text("Transaction Id : ${"anjsndjd7DS6fyghsdhg6t"}",maxLines: 1,overflow: TextOverflow.ellipsis,),
                        Text("To : ${"Ackncjsdbbh2113neb"}",maxLines: 1,overflow: TextOverflow.ellipsis,),
                        Text("Status : ${"Successful"}")
                      ],
                    ),

                    trailing: Column(
                      children: [
                        Text("5",style: TextStyle(fontSize: 23),),
                        Text("ETH",style: TextStyle(fontSize: 15),)
                      ],
                    ),
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

                    leading: Icon(CupertinoIcons.arrow_down_left,color: Colors.white,),

                    title: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Title of the Transaction",maxLines: 1,overflow: TextOverflow.ellipsis,),
                        Text("Transaction Id : ${"anjsndjd7DS6fyghsdhg6t"}",maxLines: 1,overflow: TextOverflow.ellipsis,),
                        Text("To : ${"Ackncjsdbbh2113neb"}",maxLines: 1,overflow: TextOverflow.ellipsis,),
                        Text("Status : ${"Successful"}")
                      ],
                    ),

                    trailing: Column(
                      children: [
                        Text("5",style: TextStyle(fontSize: 23),),
                        Text("ETH",style: TextStyle(fontSize: 15),)
                      ],
                    ),
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

                    leading: Icon(CupertinoIcons.arrow_down_left,color: Colors.white,),

                    title: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Title of the Transaction",maxLines: 1,overflow: TextOverflow.ellipsis,),
                        Text("Transaction Id : ${"anjsndjd7DS6fyghsdhg6t"}",maxLines: 1,overflow: TextOverflow.ellipsis,),
                        Text("To : ${"Ackncjsdbbh2113neb"}",maxLines: 1,overflow: TextOverflow.ellipsis,),
                        Text("Status : ${"Successful"}")
                      ],
                    ),

                    trailing: Column(
                      children: [
                        Text("5",style: TextStyle(fontSize: 23),),
                        Text("ETH",style: TextStyle(fontSize: 15),)
                      ],
                    ),
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: size.width*0.04),
                child: Card(
                  color: Colors.red,
                  elevation: 5,
                  child: ListTile(
                    textColor: Colors.white,

                    leading: Icon(CupertinoIcons.arrow_down_left,color: Colors.white,),

                    title: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Title of the Transaction",maxLines: 1,overflow: TextOverflow.ellipsis,),
                        Text("Transaction Id : ${"anjsndjd7DS6fyghsdhg6t"}",maxLines: 1,overflow: TextOverflow.ellipsis,),
                        Text("To : ${"Ackncjsdbbh2113neb"}",maxLines: 1,overflow: TextOverflow.ellipsis,),
                        Text("Status : ${"Successful"}")
                      ],
                    ),

                    trailing: Column(
                      children: [
                        Text("5",style: TextStyle(fontSize: 23),),
                        Text("ETH",style: TextStyle(fontSize: 15),)
                      ],
                    ),
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

                    leading: Icon(CupertinoIcons.arrow_down_left,color: Colors.white,),

                    title: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Title of the Transaction",maxLines: 1,overflow: TextOverflow.ellipsis,),
                        Text("Transaction Id : ${"anjsndjd7DS6fyghsdhg6t"}",maxLines: 1,overflow: TextOverflow.ellipsis,),
                        Text("To : ${"Ackncjsdbbh2113neb"}",maxLines: 1,overflow: TextOverflow.ellipsis,),
                        Text("Status : ${"Successful"}")
                      ],
                    ),

                    trailing: Column(
                      children: [
                        Text("5",style: TextStyle(fontSize: 23),),
                        Text("ETH",style: TextStyle(fontSize: 15),)
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),

    );
  }

}