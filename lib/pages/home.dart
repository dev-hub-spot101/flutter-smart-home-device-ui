import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List Devices = [
     ["Smart Lock", "assets/icons/lock.png", false],
    ["Smart Window", "assets/icons/window.png", false],
    ["Smart TV", "assets/icons/smart-tv.png", false ],
    ["Smart Fan", "assets/icons/fan.png", false],
     ["Smart Light", "assets/icons/light-bulb.png", true],
    ["Smart AC", "assets/icons/air-conditioner.png", false],
  ];

  void powerSwitchChnaged(bool value, int index){
    setState(() {
      Devices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 25.0),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.dashboard, size: 40, color: Colors.blueAccent,),
                  Icon(Icons.person, size: 40,  color: Colors.blueAccent)
                ],
              )
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 Text("Welcome", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                 Text("DevhubSpot", style: TextStyle(fontSize: 35, color: Colors.blueAccent, fontWeight: FontWeight.bold))
                 ]
              ),
            ),
            SizedBox(height: 20.0),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.0),
              child: Text("Device List", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            ),

            Expanded(
              child: GridView.builder(
                itemCount: Devices.length,
                padding: EdgeInsets.all(20.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
                itemBuilder: (context, index){
                  return Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(25.0)
                      ),
                      padding: EdgeInsets.symmetric(vertical: 25.0),
                      child: Column(
                         children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Icon(Icons.home, size: 50),
                                Image.asset(Devices[index][1], height: 55),
                                CupertinoSwitch(
                                  value: Devices[index][2], 
                                  onChanged: (value) { powerSwitchChnaged(value, index);}
                                  )
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 30, left: 10, right: 10),
                              child:Text(Devices[index][0], style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),),
                            )
                            
                        ],
                      )
                    ),
                  );
                }
              
              )
            )
          ],
        ),
      )
      
      
    
    );
  }
}