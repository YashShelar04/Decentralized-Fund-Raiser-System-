import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gloriuspurpose/screens/createcampaign/introcreation.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:gloriuspurpose/colors.dart';
import 'package:gloriuspurpose/screens/home/homescreen.dart';
import 'package:gloriuspurpose/screens/profile/profile.dart';

class NavigationScreen extends StatefulWidget {
  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int currentIndex = 0;

  List<Widget> pages = [
    HomeScreen(),
    IntroCreation(),
    Container(
      child: Text("Blog"),
    ),
    Profile(),
  ];

  String appTitle = "Home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myGreen,
        foregroundColor: Colors.white,
        title: Text(appTitle),
        centerTitle: true,
      ),
      body: pages[currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: myGreen,
        tooltip: 'Increment',
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        onPressed: startScan,
        child: const Icon(
          Icons.qr_code_scanner,
          size: 28,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: myGreen,
        notchMargin: 5,
        shadowColor: Colors.transparent,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  appTitle = "Home";
                  currentIndex = 0;
                });
              },
              icon: Icon(
                Icons.home,
                color: currentIndex == 0 ? Colors.white : Colors.grey.shade400,
                size: 30,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  appTitle = "Raise Campaign";
                  currentIndex = 1;
                });
              },
              icon: Icon(
                Icons.money,
                color: currentIndex == 1 ? Colors.white : Colors.grey.shade400,
                size: 30,
              ),
            ),
            SizedBox(
              width: 50,
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  appTitle = "Blogs";
                  currentIndex = 2;
                });
              },
              icon: Icon(
                Icons.edit,
                color: currentIndex == 2 ? Colors.white : Colors.grey.shade400,
                size: 30,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  appTitle = "Profile";
                  currentIndex = 3;
                });
              },
              icon: Icon(
                Icons.person,
                color: currentIndex == 3 ? Colors.white : Colors.grey.shade400,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }

  startScan() async {
    print("started Scan");
    final scanQr =  await scanner.scan();
    if (scanQr != null) {
      print(scanQr);
    } else {
      print("Some Error Occured");
    }
  }
}
