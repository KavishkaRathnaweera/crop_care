import 'dart:io';

import 'package:cropcare/controllers/media_picker_controller.dart';

import 'package:cropcare/screens/common/video_settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Camera extends GetView<CameraController> {
  const Camera({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Obx(() => Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        controller.swipeLeft();
                      },
                      icon: const Icon(Icons.keyboard_arrow_left),
                    ),
                    Expanded(
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Container(
                          width: double.infinity,
                          child: controller.medias!.isEmpty
                              ? FittedBox(
                                  child: Image.asset('assets/no-image.jpg'),
                                  fit: BoxFit.fill,
                                )
                              : controller.medias![controller.visibleFileIndex!]
                                          .type ==
                                      "Image"
                                  ? Image.file(File(controller
                                      .medias![controller.visibleFileIndex!]
                                      .file
                                      .path))
                                  : VideoDisplay(
                                      filePath: controller
                                          .medias![controller.visibleFileIndex!]
                                          .file
                                          .path,
                                    ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color.fromARGB(255, 2, 70, 2),
                            ),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        controller.swipeRight();
                      },
                      icon: const Icon(Icons.keyboard_arrow_right),
                    ),
                  ],
                )),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PopupMenuButton<int>(
                    child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromARGB(255, 216, 213, 213),
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(25)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Padding(
                                padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                                child: Icon(
                                  Icons.image_search,
                                  color: Colors.blue,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                                child: Text("Photo"),
                              ),
                            ],
                          ),
                        )),
                    itemBuilder: (context) => [
                          PopupMenuItem(
                            child: const Text("From Camera"),
                            onTap: () {
                              controller
                                  .pickImageFromCamera(ImageSource.camera);
                            },
                            value: 1,
                          ),
                          const PopupMenuDivider(),
                          PopupMenuItem(
                            child: const Text("From Gallery"),
                            onTap: () {
                              controller.pickImageFromGallery();
                            },
                            value: 2,
                          )
                        ]),
                IconButton(
                  onPressed: () {
                    controller.removeMedia();
                  },
                  icon: const Icon(Icons.delete),
                  color: Colors.red,
                ),
                PopupMenuButton<int>(
                    child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromARGB(255, 216, 213, 213),
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(25)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Padding(
                                padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                                child: Icon(
                                  Icons.video_camera_back,
                                  color: Colors.blue,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                                child: Text("Video"),
                              ),
                            ],
                          ),
                        )),
                    itemBuilder: (context) => [
                          PopupMenuItem(
                            child: const Text("From Camera"),
                            onTap: () {
                              controller.pickVideo(ImageSource.camera);
                            },
                            value: 1,
                          ),
                          const PopupMenuDivider(),
                          PopupMenuItem(
                            child: const Text("From Gallery"),
                            onTap: () {
                              controller.pickVideo(ImageSource.gallery);
                            },
                            value: 2,
                          )
                        ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
