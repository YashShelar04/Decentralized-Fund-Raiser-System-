import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class WriteBlogScreen extends StatelessWidget {

  List listOfImages = [
    {
      "imgUrl": "HELLO"
    },
    {
      "add":true,
    }
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 15),
            Container(
              width: size.width * 0.875,
              child: Text(
                  "How much are you satisfied with the Campaign Response?"),
            ),
            SizedBox(
              height: 7.5,
            ),
            SizedBox(
              height: size.height * 0.1,
              child: RatingBar.builder(
                initialRating: 3,
                itemCount: 5,
                itemBuilder: (context, index) {
                  switch (index) {
                    case 0:
                      return Icon(
                        Icons.sentiment_very_dissatisfied,
                        color: Colors.red,
                      );
                    case 1:
                      return Icon(
                        Icons.sentiment_dissatisfied,
                        color: Colors.redAccent,
                      );
                    case 2:
                      return Icon(
                        Icons.sentiment_neutral,
                        color: Colors.amber,
                      );
                    case 3:
                      return Icon(
                        Icons.sentiment_satisfied,
                        color: Colors.lightGreen,
                      );
                    case 4:
                      return Icon(
                        Icons.sentiment_very_satisfied,
                        color: Colors.green,
                      );
                    default:
                      return Icon(Icons.circle);
                  }
                },
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
            ),
            Container(
              width: size.width * 0.875,
              child: Text("What % do you think the Campaign was Successfull?"),
            ),
            Container(
              height: 7.5,
            ),
            Container(
              width: size.width*0.9,
              height: 45,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),


            SizedBox(
              height: 30,
            ),
            Container(
              width: size.width * 0.875,
              child: Text("Add the Output Images of your Campaign"),
            ),
            Container(
              height: 7.5,
            ),
            Container(
              width: size.width*0.9,
              height: 130,
              child: ListView.builder(itemCount: listOfImages.length,scrollDirection: Axis.horizontal,itemBuilder: (contex,index){
                final Map<String,dynamic> imgData = listOfImages[index];
                if(imgData.containsKey("add")){
                  return Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(7.5),
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Icon(Icons.add)
                  );
                }
                return Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(7.5),
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text("HELLO"),
                );
              })
            ),



            SizedBox(
              height: 30,
            ),
            Container(
              width: size.width * 0.875,
              child: Text("Share some valuable output of the Campaign"),
            ),
            SizedBox(
              height: 7.5,
            ),
            Container(
              width: size.width*0.9,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),


            SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}
