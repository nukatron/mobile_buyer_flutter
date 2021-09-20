import 'package:mobile_buyer_flutter/bloc/phone_bloc_base.dart';
import 'package:mobile_buyer_flutter/constants.dart';
import 'package:mobile_buyer_flutter/data_layer/phone.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' show json;

class FavoriteBloc extends PhoneBlocBase {

  FavoriteBloc() {
    read();
  }

  void toggleFavorite(Phone phone) {
    if(phones.contains(phone)) {
      phones.removeWhere((item) => item.id == phone.id);
    } else {
      phones.add(phone);
    }
    emitItem(withSort: true);
    saveFavorite();
  }

  void saveFavorite() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(kPrefKeyFavoriteList, json.encode(phones));
  }

  void read() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonObject = json.decode(prefs.getString(kPrefKeyFavoriteList) ?? '[]');
    phones = jsonObject.map<Phone>((json) => Phone.fromJson(json)).toList();
    emitItem();
  }
}