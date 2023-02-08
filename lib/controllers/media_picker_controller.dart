import 'dart:io';

import 'package:cropcare/models/media.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:path_provider/path_provider.dart';

class CameraController extends GetxController {
  var selectedImagePath = ''.obs;
  final RxList<Media> _mediaList = <Media>[].obs;
  final Rx<int> _visibleFileIndex = 0.obs;

  List<Media>? get medias => _mediaList;
  int? get visibleFileIndex => _visibleFileIndex.value;

  void swipeRight() {
    if (_visibleFileIndex.value < _mediaList.length - 1) {
      _visibleFileIndex(_visibleFileIndex.value + 1);
    }
  }

  void swipeLeft() {
    if (_visibleFileIndex.value != 0) {
      _visibleFileIndex(_visibleFileIndex.value - 1);
    }
  }

  void pickImageFromGallery() async {
    final pickedFiles = await ImagePicker().pickMultiImage();

    if (pickedFiles != null) {
      _mediaList
          .addAll(pickedFiles.map((file) => Media(file: file, type: "Image")));
    }
  }

  void pickImageFromCamera(ImageSource imageSource) async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      _mediaList.add(Media(file: pickedFile, type: "Image"));
    }
  }

  void pickVideo(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickVideo(source: imageSource);

    if (pickedFile != null) {
      final bytes = await VideoThumbnail.thumbnailData(
        video: pickedFile.path,
        imageFormat: ImageFormat.JPEG,
        maxWidth: 128,
        quality: 25,
      );
      Directory tempDir = await getTemporaryDirectory();

      File thumbnail =
          await File('${tempDir.path}/${DateTime.now().toIso8601String()}.JPEG')
              .create();
      thumbnail.writeAsBytesSync(bytes!);

      _mediaList
          .add(Media(file: pickedFile, type: "Video", thumbnail: thumbnail));
    }
  }

  void removeMedia() {
    if (_mediaList.isNotEmpty) {
      _mediaList.removeAt(visibleFileIndex!);
      swipeLeft();
    }
  }
}
