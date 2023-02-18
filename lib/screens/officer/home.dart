import 'package:cropcare/controllers/incident_controller.dart';
import 'package:cropcare/models/incident_status.dart';
import 'package:cropcare/screens/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OfficerHome extends StatelessWidget {
  OfficerHome({Key? key}) : super(key: key);

  IncidentController incidentController =
      Get.put<IncidentController>(IncidentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/officer-home.png"),
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
                    child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 15, 8, 8),
                  child: ListView.builder(
                      itemCount: incidentController.incidents.length,
                      itemBuilder: (BuildContext context, int index) {
                        if ((incidentController.incidents[index].status ==
                            IncidentStatus.NEW)) {
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
                                  const Color.fromARGB(255, 37, 87, 39),
                                  elevation: 5,
                                  child: InkWell(
                                    onTap: () {
                                      Get.toNamed("/IncidentInfo",
                                          arguments: incidentController
                                              .incidents[index]);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            ListTile(
                                              leading: const Icon(Icons.album,
                                                  color: Color.fromARGB(
                                                      255, 71, 3, 128),
                                                  size: 45),
                                              title: Text(
                                                incidentController
                                                    .incidents[index]
                                                    .user!
                                                    .name!,
                                                style:
                                                    CropifyThemes.mainTextTheme,
                                              ),
                                              subtitle: Column(
                                                children: [
                                                  Align(
                                                      alignment:
                                                          Alignment.bottomLeft,
                                                      child: SizedBox(
                                                          width: 250,
                                                          child: Text(
                                                            incidentController
                                                                .incidents[
                                                                    index]
                                                                .types!,
                                                            style: CropifyThemes
                                                                .subTextTheme,
                                                          ))),
                                                  Align(
                                                      alignment:
                                                          Alignment.bottomLeft,
                                                      child: SizedBox(
                                                          width: 200,
                                                          child: Text(
                                                            incidentController
                                                                .incidents[
                                                                    index]
                                                                .date!
                                                                .toDate()
                                                                .toString()
                                                                .split(" ")
                                                                .first,
                                                          ))),
                                                ],
                                              ),
                                              // subtitle: Text('Modern Talking Album'),
                                            ),
                                          ]),
                                    ),
                                  )));
                        } else {
                          return Container(
                            width: 0,
                            height: 0,
                          );
                        }
                      }),
                ));
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
