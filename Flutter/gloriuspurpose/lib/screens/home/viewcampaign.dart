import 'package:flutter/material.dart';

import '../../colors.dart';

class ViewCampaign extends StatelessWidget {
  final int index;

  ViewCampaign({required this.index});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myGreen,
        foregroundColor: Colors.white,
        title: Text("Campaign against Child Labour"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Hero(
                tag: index.toString(),
                child: Container(
                  alignment: Alignment.center,
                  width: size.width,
                  height: size.height * 0.33,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    image: DecorationImage(
                        image: NetworkImage(
                          "https://cdn.pixabay.com/photo/2023/08/19/06/55/world-day-against-child-labour-8199895_1280.jpg",
                        ),
                        fit: BoxFit.fill),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: size.width * 0.9,
                child: Text(
                  "Campaign against Child Labour",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: size.width * 0.9,
                child: Text(
                    '''Child labour is a pervasive issue that affects millions of children worldwide, depriving them of their childhood, education, and opportunities for a better future. It is defined as work that is mentally, physically, socially, or morally harmful to children and interferes with their schooling. ''',style: TextStyle(fontSize: 17),),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: size.width * 0.9,
                child: Text(
                  "Campaign Raised by",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: size.width * 0.9,
                child: Text("Name of the Owner"),
              ),

              SizedBox(
                height: 15,
              ),

              Container(
                width: size.width * 0.9,
                child: Text(
                  "Aim",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: size.width * 0.9,
                child: Text("Aim of the Campaign ETH/Time"),
              ),

              SizedBox(
                height: 15,
              ),

              Container(
                width: size.width * 0.9,
                child: Text(
                  "Account Address",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: size.width * 0.9,
                child: Text("0x3EEB1573BEA791Cf799Ff3a528947DD096Ca7E13"),
              ),

              SizedBox(
                height: 15,
              ),


              Container(
                alignment: Alignment.center,
                width: size.width*0.85,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: myGreen,
                ),
                child: Text("Contribute to the Campaign",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
              ),

              SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
