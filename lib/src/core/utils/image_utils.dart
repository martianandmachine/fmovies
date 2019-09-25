import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ImageUtils {

  Future<BitmapDescriptor> getIcon(double scale, urlAsset) async {
    return BitmapDescriptor.fromBytes(
        await _getBytesFromCanvas(scale, urlAsset));
  }


  Future<Uint8List> _getBytesFromCanvas(double scale, urlAsset) async {

    final PictureRecorder pictureRecorder = PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);

    final ByteData datai = await rootBundle.load(urlAsset);
    var imaged = await decodeImageFromList(new Uint8List.view(datai.buffer));

    double width = ((imaged.width.toDouble() * scale).toInt()).toDouble();
    double height = ((imaged.height.toDouble() * scale).toInt()).toDouble();

    canvas.drawImageRect(imaged, Rect.fromLTRB(0.0, 0.0, imaged.width.toDouble(), imaged.height.toDouble()),
      Rect.fromLTRB(0.0, 0.0, width, height),
      new Paint(),
    );

    final img = await pictureRecorder.endRecording().toImage(width.toInt(), height.toInt());
    final data = await img.toByteData(format: ImageByteFormat.png);
    return data.buffer.asUint8List();
  }
}
