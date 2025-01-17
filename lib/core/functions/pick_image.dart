import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

Future<File?> pickImage({ImageSource? source}) async {
  try {
    final ImagePicker picker = ImagePicker();
    final XFile? image =
        await picker.pickImage(source: source ?? ImageSource.gallery);

    if (image != null) {
      return File(image.path);
    } else {
      return null;
    }
  } catch (e) {
    debugPrint('Error picking image: $e');
    return null;
  }
}
