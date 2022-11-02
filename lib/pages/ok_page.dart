import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OkPage extends StatefulWidget {
  static const String routeName='/ok';
  const OkPage({Key? key}) : super(key: key);

  @override
  State<OkPage> createState() => _OkPageState();
}

class _OkPageState extends State<OkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ok Page'),
      ),
    );
  }
}
