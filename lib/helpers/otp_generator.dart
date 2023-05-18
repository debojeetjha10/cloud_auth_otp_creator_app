import 'dart:convert';

import 'package:cloud_auth/consts/constants.dart';
import 'package:crypto/crypto.dart';

Future<String> otpGenerator(String key) async {
  key = key +
      ((DateTime.now().millisecondsSinceEpoch / 10000).floor()).toString();
  String hashInHEX = sha256.convert(utf8.encode(key)).toString();
  print(hashInHEX);
  String otp = '';
  int toAdd = 1000;
  for (int i = 0; i < 4; i++) {
    int val = 0;
    for (int j = 0; j < 16; j++) {
      val += getChartoConstValue(hashInHEX[i * 16 + j]);
    }
    val %= 10;
    otp += (val % 10).toString();
    toAdd = (toAdd ~/ 10);
  }
  return otp;
}
