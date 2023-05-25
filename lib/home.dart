import 'dart:io';

import 'package:cloud_auth/helpers/otp_generator.dart';
import 'package:cloud_auth/pages/qr_view.dart';
import 'package:cloud_auth/styles/dynamic_styles.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

Future<String> readKey() async {
  final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
  final file = File('${appDocumentsDir.path}/keyfile.txt');
  String key = await file.readAsString();
  return key;
}

Future<String> getOTP() async {
  String key = await readKey();
  String otp = await otpGenerator(key);
  return otp;
}

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const QRViewExample(),
            ));
          },
          child: Icon(
            Icons.add,
            size: DynamicStyles.of(context).fromWidth(10),
          ),
        ),
        appBar: AppBar(
            title: Row(children: [
          const Text('Cloud Authentication'),
          IconButton(
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => const MyHome(),
              ),
            ),
            icon: const Icon(
              Icons.refresh,
            ),
          ),
        ])),
        body: FutureBuilder(
          future: getOTP(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Center(
                  child: Text(
                snapshot.data.toString(),
                style: const TextStyle(fontSize: 20),
              ));
            }
            return const Center(
                child: Text(
              "no data",
              style:  TextStyle(fontSize: 20),
            ));
          },
        ));
  }
}
