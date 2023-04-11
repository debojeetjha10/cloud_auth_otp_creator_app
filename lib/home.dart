import 'package:cloud_auth/pages/qr_view.dart';
import 'package:cloud_auth/styles/dynamic_styles.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';



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
        }, child: Icon(Icons.add , size: DynamicStyles.of(context).fromWidth(10),),
      ),
      appBar: AppBar(title: const Text('Cloud Authentication')),
      body: Center(),
    );
  }
}
