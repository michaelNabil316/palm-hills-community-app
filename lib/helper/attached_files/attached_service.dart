// import 'dart:convert';
// import 'dart:developer';
// import 'dart:typed_data';
// import 'package:file_picker/file_picker.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:mime/mime.dart';
// import 'package:path_provider/path_provider.dart';
// import 'dart:io';
// import 'attached_model.dart';

// class AttachmentServices {
//   static String downloadPath = "/storage/emulated/0/Download/";
//   static Future<String> convertBase64ToFile(
//       {required String base64String, required String fileName}) async {
//     Directory appDocDir = await getApplicationSupportDirectory();
//     String iosDownloadPath = appDocDir.path;
//     String filePath =
//         Platform.isIOS ? "$iosDownloadPath/$fileName" : downloadPath + fileName;

//     // Decode the Base64 string
//     if (await File(filePath).exists()) {
//       int count = 1;
//       String newFileName;
//       do {
//         newFileName =
//             '${getFileNameWithoutExtension(fileName)}$count.${getFileExtension(fileName)}';
//         count++;
//       } while (await File(Platform.isIOS
//               ? "$iosDownloadPath/$fileName"
//               : downloadPath + fileName)
//           .exists());
//       filePath = Platform.isIOS
//           ? "$iosDownloadPath/$newFileName"
//           : downloadPath + newFileName;
//     }
//     // Create a new file in the documents directory
//     File file = File(filePath);

//     Uint8List bytes = base64Decode(base64String);
//     await file
//         .writeAsBytes(bytes)
//         .then((value) => log("downloaded succcessfuly"))
//         .onError((error, stackTrace) => log("downloaded failed"));

//     return file.path;
//   }

//   /// To Convert The String With Space in Attachment With Spase To Snack Case
//   /// EX: "Method Statement Attachment" -> "method_statement_attachment"
//   static String convertToSnakeCase(String input) {
//     return input.toLowerCase().replaceAll(' ', '_');
//   }

//   /// Extract File Extension From The Mime Type EX: "image/png" -> ".png"
//   static String extractFileExtension(String mimeType) {
//     int slashIndex = mimeType.lastIndexOf('/');
//     if (slashIndex != -1 && slashIndex < mimeType.length - 1) {
//       return mimeType.substring(slashIndex + 1);
//     }
//     return '';
//   }

//   /// Save file on device
//   static downloadBase64File(
//       {required String fileName,
//       required String mimeType,
//       required String base64String}) async {
//     final fileNameConverted = AttachmentServices.convertToSnakeCase(fileName);
//     String fileExtension = AttachmentServices.extractFileExtension(mimeType);
//     String filePAth = await AttachmentServices.convertBase64ToFile(
//         fileName: "$fileNameConverted.$fileExtension",
//         base64String: base64String);

//     Get.log('========== filePathNAME  : $filePAth ============');
//   }

//   static String getFileNameWithoutExtension(String fileName) {
//     final dotIndex = fileName.lastIndexOf('.');
//     return dotIndex != -1 ? fileName.substring(0, dotIndex) : fileName;
//   }

//   static String getFileExtension(String fileName) {
//     final dotIndex = fileName.lastIndexOf('.');
//     return dotIndex != -1 ? fileName.substring(dotIndex + 1) : '';
//   }

//   ///pick file from device

//   static Future<File?> pickFile() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['jpg', 'pdf', 'doc', 'png', 'txt', 'jpeg'],
//     );

//     if (result != null) {
//       File file = File(result.files.single.path!);
//       return file;
//     } else {
//       log("No file selected");

//       return null;
//     }
//   }

//   ///pick Multiple Files from device
//   static Future<List<File>?> pickMultipleFiles() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       allowMultiple: true,
//       type: FileType.custom,
//       allowedExtensions: ['jpg', 'pdf', 'doc', 'png', 'txt', 'jpeg'],
//     );

//     if (result != null) {
//       List<File> files = result.files.map((file) => File(file.path!)).toList();
//       return files;
//     } else {
//       log("No file selected");
//       return null;
//     }
//   }

//   /// get file size by MB
//   static Future<double> getFileSizeInMB({required File file}) async {
//     int fileSizeInBytes = await file.length();
//     double fileSizeInMB = fileSizeInBytes / (1024 * 1024);
//     return fileSizeInMB;
//   }

//   /// convert file to base64
//   static Future<String?> convertFileToBase64({required File file}) async {
//     try {
//       List<int> fileBytes = await file.readAsBytes();
//       String base64String = base64Encode(fileBytes);
//       return base64String;
//     } catch (e) {
//       log("error in convertFileToBase64 >" + e.toString());
//       return null;
//     }
//   }

//   /// Convert List Of Files To List Of Attachments
//   static Future<List<Attachment>> convertListOfFilesToListOfAttachments(
//       {required List<File> files,
//       required String objectId,
//       required String objectTypeCode}) async {
//     List<Attachment> attachments = [];
//     for (File file in files) {
//       String? base64Body =
//           await AttachmentServices.convertFileToBase64(file: file);
//       String? mimeType = lookupMimeType(file.path);
//       String fileName = file.path.split('/').last;
//       Attachment attachment = Attachment(
//         noteText: fileName,
//         filename: fileName,
//         objectIdValue: objectId.toString(),
//         objectTypeCode: objectTypeCode,
//         documentBody: base64Body,
//         mimeType: mimeType,
//       );
//       attachments.add(attachment);
//     }
//     return attachments;
//   }
// }
