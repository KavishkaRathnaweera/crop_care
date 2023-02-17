import 'package:cropcare/controllers/media_picker_controller.dart';
import 'package:cropcare/controllers/report_incident_controller.dart';
import 'package:cropcare/controllers/user_controller.dart';
import 'package:cropcare/screens/common/appbar.dart';
import 'package:cropcare/screens/farmer/media_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class ReportIncident extends GetView<ReportIncidentController> {
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController acresController = TextEditingController();

  final CameraController cameraController = Get.put(CameraController());
  final UserController userController = Get.put(UserController());

  ReportIncident({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
            appBar: const CropCareAppBar(
              visible: false,
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: const Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Padding(
                        padding: EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          "Report  Incident",
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
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 15, 8, 8),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: [
                              const SizedBox(
                                width: 100,
                                child: Text("Damaged Crop Types"),
                              ),
                              Expanded(
                                  child: Container(
                                child: GetX<ReportIncidentController>(
                                  builder: (_) {
                                    if (_.crops!.isNotEmpty) {
                                      return MultiSelectDialogField(
                                        items: _.crops!
                                            .map((e) => MultiSelectItem(e, e))
                                            .toList(),
                                        listType: MultiSelectListType.CHIP,
                                        onConfirm: (values) {
                                          controller.selectedCropTypes = values
                                              .map((e) => e.toString())
                                              .toList();
                                        },
                                      );
                                    } else {
                                      return const Center(
                                          child: SizedBox(
                                              height: 20,
                                              width: 20,
                                              child:
                                                  CircularProgressIndicator()));
                                    }
                                  },
                                ),
                                constraints: const BoxConstraints(
                                    minHeight: 100, minWidth: double.infinity),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color.fromARGB(255, 2, 70, 2),
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                ),
                              ))
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 100,
                                child: Text("Acres Affected"),
                              ),
                              Container(
                                child: TextFormField(
                                  controller: acresController,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'(^\d*\.?\d*)')),
                                  ],
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    contentPadding: EdgeInsets.only(
                                        left: 15,
                                        bottom: 11,
                                        top: 11,
                                        right: 15),
                                    hintText: "Number of acres",
                                    hintStyle: TextStyle(fontSize: 10),
                                  ),
                                ),
                                height: 50,
                                width: (MediaQuery.of(context).size.width) / 3,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color.fromARGB(255, 2, 70, 2),
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 100,
                                child: Text("Description"),
                              ),
                              Expanded(
                                  child: Container(
                                child: TextFormField(
                                  controller: descriptionController,
                                  keyboardType: TextInputType.multiline,
                                  textInputAction: TextInputAction.newline,
                                  minLines: 1,
                                  maxLines: 5,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    contentPadding: EdgeInsets.only(
                                        left: 15,
                                        bottom: 11,
                                        top: 11,
                                        right: 15),
                                    hintText: "Describe your incident...",
                                    hintStyle: TextStyle(fontSize: 10),
                                  ),
                                ),
                                height: 120,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color.fromARGB(255, 2, 70, 2),
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                ),
                              ))
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 100,
                                child: Text("Photos & Videos"),
                              ),
                              Expanded(
                                  child: SizedBox(
                                child: OutlinedButton.icon(
                                  icon: const Icon(Icons.image),
                                  label: const Text(
                                    "Select Images/Videos",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  onPressed: () => {
                                    Get.dialog(Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Camera(),
                                      ],
                                    )),
                                  },
                                  style: ElevatedButton.styleFrom(
                                    side: const BorderSide(
                                        width: 1.0,
                                        color: Color.fromARGB(255, 2, 70, 2)),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32.0),
                                    ),
                                  ),
                                ),
                                height: 50,
                              ))
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          ElevatedButton(
                            child: const Text("Submit"),
                            onPressed: () {
                              if (controller.selectedCrops.isEmpty ||
                                  acresController.value.text.isEmpty ||
                                  descriptionController.value.text.isEmpty) {
                                Get.snackbar(
                                    "Invalid Report", "Please fill all fields",
                                    snackPosition: SnackPosition.BOTTOM,
                                    snackStyle: SnackStyle.FLOATING,
                                    backgroundColor: Colors.red);
                              } else if (Get.find<CameraController>()
                                      .medias!
                                      .length <
                                  3) {
                                Get.snackbar("Invalid Report",
                                    "Please select at least 3 photos/videos",
                                    snackPosition: SnackPosition.BOTTOM,
                                    snackStyle: SnackStyle.FLOATING,
                                    backgroundColor: Colors.red);
                              } else {
                                controller.reportIncident(
                                    Get.find<UserController>().user,
                                    controller.selectedCrops,
                                    double.parse(acresController.text),
                                    descriptionController.text,
                                    Get.find<CameraController>().medias!);
                              }

                              if (controller.isLoading.value) {
                                Get.dialog(
                                    const Center(
                                        child: CircularProgressIndicator()),
                                    barrierDismissible: false);
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }

  Future<bool> _onBackPressed() {
    if (controller.selectedCrops.isNotEmpty ||
        acresController.value.text.isNotEmpty ||
        descriptionController.value.text.isNotEmpty ||
        Get.find<CameraController>().medias!.isNotEmpty) {
      Get.defaultDialog(
        title: "Are you sure?",
        middleText: "All changes will be lost",
        actions: [
          ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text("Cancel")),
          const SizedBox(
            width: 10,
          ),
          OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                    width: 1.0, color: Color.fromARGB(255, 2, 70, 2)),
              ),
              onPressed: () {
                Get.back(closeOverlays: true);
                controller.selectedCrops.clear();
              },
              child: const Text(
                "Confirm",
                style: TextStyle(color: Color.fromARGB(255, 2, 70, 2)),
              )),
        ],
      );
    } else {
      return Future.value(true);
    }
    return Future.value(false);
  }
}
