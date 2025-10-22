import 'package:image_picker/image_picker.dart';

class LogicImages {
  static Future<void> pickImages(List<XFile> images) async {
    final ImagePicker picker = ImagePicker();

    if (images.length >= 5) {
      return;
    }

    final remaining = 5 - images.length;

    List<XFile> pickedImages = [];

    if (remaining == 1) {
      final XFile? singleImage = await picker.pickImage(
        source: ImageSource.gallery,
      );
      if (singleImage != null) pickedImages = [singleImage];
    } else {
      pickedImages = await picker.pickMultiImage(limit: remaining);
    }

    if (pickedImages.isNotEmpty) {
      final newImages = pickedImages.take(remaining).toList();
      images.addAll(newImages);
    }
  }

  static void removeImage(int index, List<XFile> images) {
    images.removeAt(index);
  }
}
