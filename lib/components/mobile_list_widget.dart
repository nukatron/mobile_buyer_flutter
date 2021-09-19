import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_buyer_flutter/components/mobile_tile_widget.dart';
import 'package:mobile_buyer_flutter/data_layer/api_services.dart';
import 'package:mobile_buyer_flutter/data_layer/phone.dart';

class MobileListWidget extends StatefulWidget {
  const MobileListWidget({Key? key}) : super(key: key);

  @override
  _MobileListWidgetState createState() => _MobileListWidgetState();
}

class _MobileListWidgetState extends State<MobileListWidget> {

  final _client = ApiServices();
  var _mobileList = <Phone>[];
  bool isWaiting = false;

  @override
  void initState() {
    super.initState();
    updateUi();
  }

  void updateUi() async {
    isWaiting = true;
    List<Phone> phoneList = await _client.fetchPhoneList();
    isWaiting = false;
    setState(() {
      _mobileList = phoneList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: _mobileList.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder:  (context, index) {
        final phone = _mobileList[index];
        return MobileTileWidget(phone: phone,);
      },
    );
  }
}


class MobileListWidgetBkk extends StatelessWidget {

  final _client = ApiServices();

  final mobileList = <Phone>[
    Phone(id: 1, name: 'Moto E4 Plus', brand: 'Samsung', rating: 4.9, price: 179.99, thumbUrl: "https://cdn.mos.cms.futurecdn.net/grwJkAGWQp4EPpWA3ys3YC-650-80.jpg", description: "First place in our list goes to the excellent Moto E4 Plus. It's a cheap phone that features phenomenal battery life, a fingerprint scanner and a premium feel design, plus it's a lot cheaper than the Moto G5 below. It is a little limited with its power, but it makes up for it by being able to last for a whole two days from a single charge. If price and battery are the most important features for you, the Moto E4 Plus will suit you perfectly." ),
    Phone(id: 2, name: 'Nokia 6', brand: 'Nokia', rating: 4.6, price: 199.99, thumbUrl: "https://cdn.mos.cms.futurecdn.net/8LWUERoxMAWavvVAAbxuac-650-80.jpg", description: "Nokia is back in the mobile phone game and after a small price drop to the Nokia 6 we've now seen it enter our best cheap phone list. It comes with a Full HD 5.5-inch display, full metal design and a fingerprint scanner for added security. The battery isn't incredible on the Nokia 6, but it's not awful either making this one of our favorite affordable phones on the market right now." ),
    Phone(id: 3, name: 'Moto G4 Plus', brand: 'Motorola', rating: 4.7, price: 179, thumbUrl: "https://cdn.mos.cms.futurecdn.net/52JJgbgWiGftNHV5UmMDfS-650-80.jpg", description: "The spec for the G4 Plus is much the same as it was on the Moto G4, but it also comes with a fingerprint scanner and an improved camera. The 16MP rear shooter is arguably one of the most impressive phone cameras at the sub-£200 mark. There's no NFC so you won't be able to use Android Pay on the Moto G4 Plus, but a bright display and strong performance is sure to make up for it." ),
    Phone(id: 4, name: 'Moto G5', brand: 'Motorola', rating: 3.8, price: 165, thumbUrl: "https://cdn.mos.cms.futurecdn.net/DcUtY6YfhoajHnoKUgGFqn-650-80.jpg", description: "Motorola's Moto G5, a former best cheap phone in the world, has slipped a few places thanks to better priced alternatives, plus the introduction of the new G5S. The Moto G5 comes with a metal design, 1080p display and fingerprint scanner. You won't get the fastest chipset on this list or NFC with the Moto G5, but as an all-round product the cheap Motorola phone will serve you well." ),
    Phone(id: 5, name: 'Sony Xperia L1', brand: 'Motorola', rating: 4.3, price: 171.99, thumbUrl: "https://cdn.mos.cms.futurecdn.net/7dUFmtHkmH7La9dFzew7Ri-650-80.jpg", description: "Currently the only Sony handset to take a position in our best cheap phone list, the Xperia L1 is a low priced handset that does okay but won't blow your socks off. Other phones in this list are far more impressive as this doesn't have a fingerprint scanner or stunning camera. That said, the price is low and if you really, really like the design of Sony handsets everything here could add up to being your best choice for a cheap phone. We particularly liked the 5.5-inch display - despite its 720p resolution - and the expandable storage too, which allows you to use microSD cards up to 256GB. " ),
  ];

  MobileListWidgetBkk({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ListView.separated(
      itemCount: mobileList.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder:  (context, index) {
        final phone = mobileList[index];
        return MobileTileWidget(phone: phone,);
      },
    );
  }
}
