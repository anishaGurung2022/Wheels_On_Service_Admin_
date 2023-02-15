import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageUpload extends StatefulWidget {
  const ImageUpload({super.key});

  @override
  State<ImageUpload> createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  //File? _pickedImage;
  File? pickedFile;
  final ImagePicker _picker = ImagePicker();
  Uint8List webImage = Uint8List(8);

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: () async {
      var imageForSendToAPI;
      final temp = (await ImagePicker()
          .getImage(source: ImageSource.camera, imageQuality: 80));
      if (imageForSendToAPI != null) {
        imageForSendToAPI = await temp?.readAsBytes();
      } else {
        print("No image has been picked");
      }
      setState(() {});
      child:
      (pickedFile == null)
          ? Container(
              width: Get.width / 2,
              height: Get.height / 4,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.add_a_photo),
            )
          : Container(
              width: Get.width / 2,
              height: Get.height / 4,
              decoration: BoxDecoration(
                //image from file
                image: DecorationImage(
                    image: FileImage(
                      File(pickedFile!.path),
                    ),
                    fit: BoxFit.cover),
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.add_a_photo),
            );
    });
  }

  // Future<void> _pickImage() async {
  //   XFile? image = await _picker.pickImage(source: ImageSource.gallery);
  //   if (image != null) {
  //     var f = await image.readAsBytes();
  //     setState(() {
  //       webImage = f;
  //       pickedFile = f;
  //     });
  //   } else {
  //     print('No image has been picked.');
  //   }
  // }
}
