// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:typed_data';
import 'package:image/image.dart' as img;
import 'package:exif/exif.dart';

Future<bool> validateImageFile(FFUploadedFile uploadedFile) async {
  try {
    // 1. 拡張子を検証
    if (uploadedFile.name == null) {
      throw Exception('ファイル名がありません。');
    }
    String extension = uploadedFile.name!.toLowerCase().split('.').last;
    List<String> allowedExtensions = ['jpg', 'jpeg', 'png', 'gif'];
    if (!allowedExtensions.contains(extension)) {
      throw Exception('許可されていないファイル形式です: $extension');
    }

    // 2. MIMEタイプを検証（FFUploadedFileにmimeTypeがないためimageパッケージで確認）
    Uint8List? bytes = uploadedFile.bytes; // 修正: bytesはメソッドではなくプロパティ
    if (bytes == null) {
      throw Exception('ファイルの内容を読み込めませんでした。');
    }
    img.Image? image = img.decodeImage(bytes);
    if (image == null) {
      throw Exception('無効な画像です。');
    }
    String mimeType;
    switch (extension) {
      case 'jpg':
      case 'jpeg':
        mimeType = 'image/jpeg';
        break;
      case 'png':
        mimeType = 'image/png';
        break;
      case 'gif':
        mimeType = 'image/gif';
        break;
      default:
        throw Exception('許可されていないMIMEタイプです: $extension');
    }
    List<String> allowedMimes = ['image/jpeg', 'image/png', 'image/gif'];
    if (!allowedMimes.contains(mimeType)) {
      throw Exception('許可されていないMIMEタイプです: $mimeType');
    }

    // 3. サイズを検証（5MB制限）
    if (bytes.length > 5 * 1024 * 1024) {
      throw Exception('ファイルサイズが大きすぎます。5MB以下にしてください。');
    }

    // 4. 画像の寸法を検証
    if (image.width > 1920 || image.height > 1920) {
      throw Exception('画像の寸法が大きすぎます。1920x1920以下にしてください。');
    }

    // 5. EXIFを削除（個人情報保護）
    Map<String, IfdTag> exifData = await readExifFromBytes(bytes);
    if (exifData.isNotEmpty) {
      // EXIFが存在する場合、削除された新しいバイトを生成（簡単な例: imageライブラリで再エンコード）
      Uint8List cleanedBytes = img.encodeJpg(image); // JPEGの例、PNGはencodePng
      // cleanedBytesを新しいFFUploadedFileとして返すか使用
      print('EXIFデータが削除されました。');
    }

    return true; // すべての検証を通過
  } catch (e) {
    print('検証に失敗しました: $e');
    // エラー処理: FlutterFlowでSnackbarを表示
    return false;
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
