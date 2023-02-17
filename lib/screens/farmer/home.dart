import 'package:cropcare/utils/carousal_items.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

class FarmerHome extends StatelessWidget {
  const FarmerHome({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/crops.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            height: 250,
            width: double.infinity,
          ),
          Expanded(
              child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green[900],
                        minimumSize: const Size.fromHeight(60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80.0),
                        ),

                        elevation: 5),
                    onPressed: () {
                      Get.toNamed('/farmerReportIncident');
                    },
                    child: const Text(
                      "REPORT INCIDENT",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),

                  ),
                  const SizedBox(
                    height: 30,
                  ),

                ],
              ),
            ),
          )),
        ],
      ),
    );
  }
}
