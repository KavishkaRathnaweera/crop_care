import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/incident_controller.dart';
import '../../models/incident_status.dart';
import '../common/theme.dart';

class CompleteTasks extends StatelessWidget {
  CompleteTasks({Key? key}) : super(key: key);

  IncidentController incidentController = Get.find<IncidentController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/officer-complete.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            height: 250,
            width: double.infinity,
          ),
          const SizedBox(
            height: 20,
          ),
          Obx(
            () {
              if (incidentController.incidents.isNotEmpty) {
                return Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.fromLTRB(8, 15, 8, 8),

                      itemCount: incidentController.incidents.length,
                      itemBuilder: (BuildContext context, int index) {
                        if ((incidentController.incidents[index].status ==
                            IncidentStatus.COMPLETED)) {
                          return Padding(
                            padding:
                                const EdgeInsets.fromLTRB(10.0, 0.0, 0, 10.0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              color:
                              const Color.fromARGB(255, 237, 220, 252),
                              shadowColor:
                                  const Color.fromARGB(255, 6, 118, 182),
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(
                                                10.0), // Set the border radius for the Container
                                            topRight: Radius.circular(10.0),
                                          ),
                                          color:
                                          Color.fromARGB(255, 84, 0, 154),
                                        ),
                                        width: double.infinity,
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          incidentController
                                              .incidents[index].types!,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: "AbhayaLibre",
                                              fontSize: 25),
                                        ),
                                      ),
                                      SizedBox(height: 10.0),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text("Farmer :",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: "AbhayaLibre",
                                                  fontSize: 18)),
                                          Text(
                                              incidentController
                                                  .incidents[index].user!.name!,
                                              style: CropCareThemes.mainTextTheme
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text("Submit Date:",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: "AbhayaLibre",
                                                  fontSize: 18)),
                                          Text(
                                            incidentController
                                                .incidents[index].date!
                                                .toDate()
                                                .toString()
                                                .split(" ")
                                                .first,
                                            style: CropCareThemes.subTextTheme,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text("Damage Area:",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: "AbhayaLibre",
                                                  fontSize: 18)),
                                          Text(
                                            incidentController
                                                .incidents[index].acres!.toString(),
                                            style: CropCareThemes.subTextTheme,
                                          ),
                                        ],
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              primary: const Color.fromARGB(
                                                  255, 53, 0, 98)),
                                          onPressed: () {
                                            Get.toNamed("/IncidentInfo",
                                                arguments: incidentController
                                                    .incidents[index]);
                                          },
                                          child: const Text(
                                            "Check Details",
                                            style:
                                                CropCareThemes.buttonTextTheme,
                                          ),
                                        ),
                                      ),
                                    ]),
                              ),
                            ),
                          );
                        } else {
                          return Container(
                            width: 0,
                            height: 0,
                          );
                        }
                      }),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          )
        ],
      ),
    );
  }
}
