

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_buyer_flutter/data_layer/phone.dart';

class PhoneDetailScreen extends StatelessWidget {

  final Phone phone;
  PhoneDetailScreen({Key? key, required this.phone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(phone.name),
      ),
      body: Container(),
    );
  }
}
