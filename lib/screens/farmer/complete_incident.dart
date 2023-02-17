import 'package:cropcare/controllers/farmer_complete_incident_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/incident_status.dart';

class CompleteIncident extends GetWidget<FarmerCompleteIncidentController> {
  const CompleteIncident({Key? key}) : super(key: key);

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
                    "Completed Incidents",
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
                    if ((controller.completeIncidents.isNotEmpty)) {
                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 15, 8, 8),
                          child: ListView.builder(
                              itemCount: controller.completeIncidents.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      10.0, 0.0, 0, 10.0),
                                  child: Card(
                                    color: Colors.yellow[50],
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
                                                        .completeIncidents[
                                                            index]
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
                                                    .completeIncidents[index]
                                                    .types!,
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
                                                initiallyExpanded: true,
                                                trailing: SizedBox.shrink(),
                                                tilePadding: EdgeInsets.zero,
                                                title: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                      primary: controller
                                                                  .completeIncidents[
                                                                      index]
                                                                  .status ==
                                                              IncidentStatus
                                                                  .COMPLETED
                                                          ? const Color
                                                                  .fromARGB(255,
                                                              105, 241, 105)
                                                          : const Color
                                                                  .fromARGB(221,
                                                              238, 84, 38)),
                                                  onPressed: () {},
                                                  child: Text(
                                                    controller
                                                                .completeIncidents[
                                                                    index]
                                                                .status!
                                                                .name ==
                                                            "REJECTED"
                                                        ? controller
                                                            .completeIncidents[
                                                                index]
                                                            .status!
                                                            .name
                                                        : "ACCEPTED",
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
                                                          .completeIncidents[
                                                              index]
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
                                                                      .completeIncidents[
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
                                                    )
                                                  ],
                                                  if (controller
                                                          .completeIncidents[
                                                              index]
                                                          .rejectDate !=
                                                      null) ...[
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          0, 0, 40, 0),
                                                      child: Row(
                                                        children: [
                                                          const SizedBox(
                                                            child: Text(
                                                                "Rejected Date:",
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
                                                                      .completeIncidents[
                                                                          index]
                                                                      .rejectDate!
                                                                      .toDate()
                                                                      .toString()
                                                                      .split(
                                                                          " ")
                                                                      .first,
                                                                )),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                  if (controller
                                                          .completeIncidents[
                                                              index]
                                                          .completeDate !=
                                                      null) ...[
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          0, 0, 40, 0),
                                                      child: Row(
                                                        children: [
                                                          const SizedBox(
                                                            child: Text(
                                                                "Accepted Date:",
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
                                                                      .completeIncidents[
                                                                          index]
                                                                      .completeDate!
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
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          0, 0, 40, 0),
                                                      child: Row(
                                                        children: [
                                                          const SizedBox(
                                                            child: Text(
                                                                "Valued Amount:",
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
                                                                  "Rs. " +
                                                                      controller
                                                                          .completeIncidents[
                                                                              index]
                                                                          .amount
                                                                          .toString(),
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
                                                              "Comments:",
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
                                                                .completeIncidents[
                                                                    index]
                                                                .comment!),
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
                                                                .completeIncidents[
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
                                                                .completeIncidents[
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
