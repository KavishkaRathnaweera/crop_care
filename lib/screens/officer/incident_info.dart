import 'package:cropcare/controllers/incident_controller.dart';
import 'package:cropcare/models/incident.dart';
import 'package:cropcare/models/incident_status.dart';
import 'package:cropcare/screens/common/theme.dart';
import 'package:cropcare/screens/common/video_settings.dart';
import 'package:cropcare/screens/officer/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IncidentInfo extends GetWidget<IncidentController> {
  IncidentInfo({Key? key}) : super(key: key);

  IncidentModel incident = Get.arguments;

  final TextEditingController commentController = TextEditingController();
  final TextEditingController amoountContorller = TextEditingController();
  final double labelWidth = 135;

  @override
  Widget build(BuildContext context) {
    IncidentController incidentController =
        Get.put<IncidentController>(IncidentController());
    return Scaffold(
      appBar: const OfficerAppBar(),
      body: Align(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Incident Details",
                style: CropCareThemes.titleTextTheme,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: labelWidth,
                          child: const Text(
                            "Name :",
                            style: CropCareThemes.subTextTheme,
                          ),
                        ),
                        Text(incident.user!.name!,
                            style: CropCareThemes.mainTextTheme),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: labelWidth,
                          child: const Text(
                            "Date :",
                            style: CropCareThemes.subTextTheme,
                          ),
                        ),
                        Text(
                            incident.date!.toDate().toString().split(" ").first,
                            style: CropCareThemes.mainTextTheme),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: labelWidth,
                          child: const Text(
                            "Location :",
                            style: CropCareThemes.subTextTheme,
                          ),
                        ),
                        Text(incident.user!.address!,
                            style: CropCareThemes.mainTextTheme),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: labelWidth,
                          child: const Text(
                            "Bank :",
                            style: CropCareThemes.subTextTheme,
                          ),
                        ),
                        Text(incident.user!.bankName!,
                            style: CropCareThemes.mainTextTheme),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: labelWidth,
                          child: const Text(
                            "Account No :",
                            style: CropCareThemes.subTextTheme,
                          ),
                        ),
                        Text(incident.user!.accountNum!,
                            style: CropCareThemes.mainTextTheme),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: labelWidth,
                          child: const Text(
                            "Crop Types :",
                            style: CropCareThemes.subTextTheme,
                          ),
                        ),
                        SizedBox(
                          width: 200,
                          child: Text(
                            incident.types!,
                            style: CropCareThemes.mainTextTheme,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: labelWidth,
                          child: const Text(
                            "Acres Affected :",
                            style: CropCareThemes.subTextTheme,
                          ),
                        ),
                        Text(incident.acres.toString(),
                            style: CropCareThemes.mainTextTheme),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: labelWidth,
                          child: const Text(
                            "Location coordinates :",
                            style: CropCareThemes.subTextTheme,
                          ),
                        ),
                        Text(incident.location.toString(),
                            style: CropCareThemes.mainTextTheme),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: labelWidth,
                          child: const Text(
                            "Distance Difference :",
                            style: CropCareThemes.subTextTheme,
                          ),
                        ),
                        Text(incident.distance.toString(),
                            style: CropCareThemes.mainTextTheme),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: labelWidth,
                          child: const Text(
                            "Description :",
                            style: CropCareThemes.subTextTheme,
                          ),
                        ),
                        SizedBox(
                          width: 200,
                          child: Text(
                            incident.description!,
                            style: CropCareThemes.mainTextTheme,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    _showStatus(),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Photos & Videos",
                      style: CropCareThemes.subTextTheme,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    _buildGridView(),
                    const SizedBox(
                      height: 20,
                    ),
                    _buildProgressButton(incidentController),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGridView() {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
      ),
      itemCount: incident.media!.length,
      itemBuilder: (context, index) {
        bool isVideo = incident.media![index].type == "Video";
        return GestureDetector(
          onTap: isVideo
              ? () => openVideoPlayer(incident.media![index].mediaRef!)
              : () => openImageViewer(incident.media![index].mediaRef!),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                color: Colors.white,
                child: Image.network(
                    isVideo
                        ? incident.media![index].thumbnail!
                        : incident.media![index].mediaRef!,
                    fit: BoxFit.cover),
              ),
              isVideo
                  ? const Icon(
                      Icons.play_circle_fill_rounded,
                      size: 32,
                      color: Colors.white70,
                    )
                  : Container(),
            ],
          ),
        );
      },
    );
  }

  Widget _showStatus() {
    switch (incident.status) {
      case IncidentStatus.NEW:
        return Row(
          children: [
            SizedBox(
              width: labelWidth,
              child: const Text(
                "Status :",
                style: CropCareThemes.subTextTheme,
              ),
            ),
            const Text("New", style: CropCareThemes.mainTextTheme),
          ],
        );
      case IncidentStatus.IN_PROGRESS:
        return Row(
          children: [
            SizedBox(
              width: labelWidth,
              child: const Text(
                "Status :",
                style: CropCareThemes.subTextTheme,
              ),
            ),
            const Text("In-Progress", style: CropCareThemes.mainTextTheme),
          ],
        );
      case IncidentStatus.COMPLETED:
        return Column(children: [
          Row(
            children: [
              SizedBox(
                width: labelWidth,
                child: const Text(
                  "Status :",
                  style: CropCareThemes.subTextTheme,
                ),
              ),
              const Text("Completed", style: CropCareThemes.mainTextTheme),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SizedBox(
                width: labelWidth,
                child: const Text(
                  "Amount :",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: "AbhayaLibre"),
                ),
              ),
              Text(incident.amount.toString(),
                  style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 8, 126, 12),
                      fontFamily: "AbhayaLibre")),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: labelWidth,
                child: const Text(
                  "Comment :",
                  style: CropCareThemes.subTextTheme,
                ),
              ),
              SizedBox(
                width: 200,
                child: Text(
                  incident.comment!,
                  style: CropCareThemes.mainTextTheme,
                ),
              ),
            ],
          )
        ]);

      default:
        return Container();
    }
  }

  Widget _buildProgressButton(IncidentController incidentController) {
    switch (incident.status) {
      case IncidentStatus.NEW:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                openAlertBox(incidentController);
              },
              style: ElevatedButton.styleFrom(primary: Colors.red),
              child: const Text(
                "Reject",
                style: CropCareThemes.buttonTextTheme,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                incidentController.setStatus(
                    incident.id!, IncidentStatus.IN_PROGRESS, '', 0.0);
              },
              style: ElevatedButton.styleFrom(primary: Colors.green),
              child: const Text(
                "In-Progress",
                style: CropCareThemes.buttonTextTheme,
              ),
            ),
          ],
        );

      case IncidentStatus.IN_PROGRESS:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                openAlertBox(incidentController);
              },
              style: ElevatedButton.styleFrom(primary: Colors.red),
              child: const Text(
                "Reject",
                style: CropCareThemes.buttonTextTheme,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                openPaymentAlertBox(incidentController);
              },
              style: ElevatedButton.styleFrom(primary: Colors.green),
              child: const Text(
                "Accept",
                style: CropCareThemes.buttonTextTheme,
              ),
            )
          ],
        );

      default:
        return Container();
    }
  }

  openImageViewer(String url) {
    Get.defaultDialog(
        title: "Preview",
        radius: 4,
        content: SizedBox(
          height: 300,
          child: Container(color: Colors.white, child: Image.network(url)),
        ));
  }

  openVideoPlayer(String url) {
    Get.defaultDialog(
        title: "Preview",
        radius: 4,
        content: SizedBox(
          height: 400,
          child: VideoDisplay(urlPath: url),
        ));
  }

  openAlertBox(IncidentController incidentController) {
    Get.defaultDialog(
        title: "",
        radius: 10,
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Confirm Rejection",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 8, 8, 56),
                  fontFamily: "AbhayaLibre"),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: commentController,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.newline,
              minLines: 1,
              maxLines: 5,
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                hintText: "reason",
                hintStyle: TextStyle(fontSize: 15),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.white70),
                  child: const Text(
                    "Cancel",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "AbhayaLibre",
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    incidentController.setStatus(incident.id!,
                        IncidentStatus.REJECTED, commentController.text, 0.0);
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                  child: const Text(
                    "Confirm",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "AbhayaLibre",
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )
          ],
        ));
  }

  openPaymentAlertBox(IncidentController incidentController) {
    Get.defaultDialog(
        title: "",
        radius: 10,
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Make Payment",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 8, 8, 56),
                  fontFamily: "AbhayaLibre"),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: amoountContorller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                hintText: "Amount (Rs.)",
                hintStyle: TextStyle(fontSize: 15),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: commentController,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.newline,
              minLines: 1,
              maxLines: 5,
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                hintText: "Leave a comment...",
                hintStyle: TextStyle(fontSize: 15),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.white70),
                  child: const Text(
                    "Cancel",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "AbhayaLibre",
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // incidentController.startPaymentOption(
                    //     incident.id!,
                    //     incident.user!.name!,
                    //     incident.user!.accountNum!,
                    //     incident.user!.bankName!,
                    //     commentController.text,
                    //     double.parse(amoountContorller.text),
                    //     incident.user!.address!,
                    //     incident.user!.fcmToken!);
                    incidentController.setStatus(
                        incident.id!, IncidentStatus.COMPLETED, commentController.text, double.parse(amoountContorller.text));
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                  child: const Text(
                    "Confirm",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "AbhayaLibre",
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
