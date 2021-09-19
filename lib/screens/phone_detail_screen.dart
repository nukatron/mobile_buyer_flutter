import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_buyer_flutter/components/image_container_widget.dart';
import 'package:mobile_buyer_flutter/constants.dart';
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
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.network(
                  phone.thumbUrl,
                  height: 250,
                  fit: BoxFit.fitHeight,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    phone.description ?? "",
                    style: kDetailTextStyle,
                  ),
                ),
              ],
            ),
            Container(
              color: kBgGreyOverlayColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Rating:${phone.rating}',
                      style: kDetailTextStyle,
                    ),
                    Text(
                      'Price:${phone.priceDisplay}',
                      style: kDetailTextStyle,
                    ),
                  ],
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}
