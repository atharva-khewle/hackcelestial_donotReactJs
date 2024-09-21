import 'dart:io';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

class ImageService{

  static BarcodeScanner scanner = BarcodeScanner();

  static Future<String> getImageFromCamera()async{

    XFile? pickedImage = await ImagePicker().pickImage(source: ImageSource.camera);
    final tempDir = await getTemporaryDirectory();
    final filePath = path.join(tempDir.path, 'temp_image.jpg');
    final imageFile = File(filePath);
    await imageFile.writeAsBytes(await pickedImage!.readAsBytes());

    InputImage inputImage = InputImage.fromFile(imageFile);
    List<Barcode> barcodes = await scanner.processImage(inputImage);
    print(barcodes.length);
    if(BarcodeType.url == barcodes.first.type){
      BarcodeUrl barcodeUrl = barcodes.first.value as BarcodeUrl;
      return barcodeUrl.url.toString();
    }
    //await deleteFile(imageFile);
    return "";
  }

  static Future<void> deleteFile(File imageFile)async{
    await imageFile.delete();
  }

}