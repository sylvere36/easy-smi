import 'dart:io';

import 'package:path_provider/path_provider.dart';

abstract class IDownloadService {
  /// Saves bytes response to a file with the provided filename in a platform-appropriate directory.
  /// Returns the absolute file path of the saved file.
  Future<String> saveBytesToFile({
    required List<int> bytes,
    required String filename,
    String? subdir,
  });
}

class DownloadService implements IDownloadService {
  @override
  Future<String> saveBytesToFile({
    required List<int> bytes,
    required String filename,
    String? subdir,
  }) async {
    // Use app documents directory (visible to app; shareable via share sheet if needed)
    final Directory baseDir = await getApplicationDocumentsDirectory();
    Directory targetDir = baseDir;
    if (subdir != null && subdir.trim().isNotEmpty) {
      targetDir = Directory('${baseDir.path}/$subdir');
      if (!await targetDir.exists()) {
        await targetDir.create(recursive: true);
      }
    }
    final filePath = '${targetDir.path}/$filename';
    final file = File(filePath);
    await file.writeAsBytes(bytes, flush: true);
    return filePath;
  }
}
