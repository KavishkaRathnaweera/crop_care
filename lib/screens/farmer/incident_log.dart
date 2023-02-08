import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/incident_log_controller.dart';
import '../../models/incident_status.dart';

class IncidentLog extends GetWidget<IncidentLogController> {
  const IncidentLog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: const Align(
              alignment: FractionalOffset.bottomCenter,
              child: Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    "Incident Log",
                    style: TextStyle(
                        fontFamily: "AbhayaLibre",
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/vegies-other.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            height: 150,
            width: double.infinity,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(
                  () {
                    if ((controller.newIncidents.isNotEmpty)) {
                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 15, 8, 8),
                          child: ListView.builder(
                              itemCount: controller.newIncidents.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      10.0, 0.0, 0, 10.0),
                                  child: Card(
                                    shadowColor:
                                        const Color.fromARGB(255, 37, 87, 39),
                                    elevation: 5,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                    controller
                                                        .newIncidents[index]
                                                        .date!
                                                        .toDate()
                                                        .toString()
                                                        .split(" ")
                                                        .first,
                                                    style: const TextStyle(
                                                        fontFamily:
                                                            "AbhayaLibre",
                                                        fontSize: 18)),
                                              ],
                                            ),
                                            Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Text(
                                                controller
                                                    .newIncidents[index].types!,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 15),
                                              ),
                                            ),
                                            Theme(
                                              data: Theme.of(context).copyWith(
                                                  dividerColor:
                                                      Colors.transparent),
                                              child: ExpansionTile(
                                                tilePadding: EdgeInsets.zero,
                                                title: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                      primary: controller
                                                                  .newIncidents[
                                                                      index]
                                                                  .status ==
                                                              IncidentStatus.NEW
                                                          ? const Color
                                                                  .fromARGB(255,
                                                              115, 188, 236)
                                                          : const Color
                                                                  .fromARGB(221,
                                                              248, 244, 8)),
                                                  onPressed: () {},
                                                  child: Text(
                                                    controller
                                                        .newIncidents[index]
                                                        .status!
                                                        .name
                                                        .split("_")
                                                        .join(" "),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontFamily:
                                                            "AbhayaLibre",
                                                        fontSize: 18),
                                                  ),
                                                ),
                                                children: [
                                                  if (controller
                                                          .newIncidents[index]
                                                          .reviewDate !=
                                                      null) ...[
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          0, 0, 40, 0),
                                                      child: Row(
                                                        children: [
                                                          const SizedBox(
                                                            child: Text(
                                                                "Reviewed Date:",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontFamily:
                                                                        "AbhayaLibre",
                                                                    fontSize:
                                                                        18)),
                                                          ),
                                                          Expanded(
                                                            child: Align(
                                                                alignment:
                                                                    Alignment
                                                                        .topRight,
                                                                child: Text(
                                                                  controller
                                                                      .newIncidents[
                                                                          index]
                                                                      .reviewDate!
                                                                      .toDate()
                                                                      .toString()
                                                                      .split(
                                                                          " ")
                                                                      .first,
                                                                )),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(0, 0, 40, 0),
                                                    child: Row(
                                                      children: [
                                                        const SizedBox(
                                                          child: Text(
                                                              "Description:",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontFamily:
                                                                      "AbhayaLibre",
                                                                  fontSize:
                                                                      18)),
                                                        ),
                                                        const SizedBox(
                                                          width: 20,
                                                        ),
                                                        Expanded(
                                                          child: Align(
                                                            alignment: Alignment
                                                                .topRight,
                                                            child: Text(controller
                                                                .newIncidents[
                                                                    index]
                                                                .description!),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(0, 0, 40, 0),
                                                    child: Row(
                                                      children: [
                                                        const SizedBox(
                                                          child: Text("Acres:",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontFamily:
                                                                      "AbhayaLibre",
                                                                  fontSize:
                                                                      18)),
                                                        ),
                                                        const SizedBox(
                                                          width: 20,
                                                        ),
                                                        Expanded(
                                                          child: Align(
                                                            alignment: Alignment
                                                                .topRight,
                                                            child: Text(controller
                                                                .newIncidents[
                                                                    index]
                                                                .acres!
                                                                .toString()),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ]),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
