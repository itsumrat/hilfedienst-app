import 'dart:io';
import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

Future<File> signatureKeyToFile(GlobalKey<SfSignaturePadState> signatureKey)async{
  final data = await signatureKey.currentState!.toImage(pixelRatio: 3.0);
  final bytes = await data.toByteData(format: ImageByteFormat.png);
  final encoded = bytes!.buffer.asUint8List();
  final file = File('${Directory.systemTemp.path}/signature.png');
  await file.writeAsBytes(encoded);
  return file;
}