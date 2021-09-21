import 'package:mobile_buyer_flutter/bloc/phone_bloc_base.dart';
import 'package:mobile_buyer_flutter/data_layer/api_services.dart';
import 'package:mobile_buyer_flutter/data_layer/phone.dart';

class PhoneBloc extends PhoneBlocBase {

  late ApiServices _serviceApi;

  PhoneBloc(ApiServices apiServices) {
    _serviceApi = apiServices;
    fetchPhones();
  }

  void fetchPhones() async {
    try {
      phones = await _serviceApi.fetchPhoneList();
      emitItem(withSort: true);
    } catch (err) {
      emitError(err as Exception);
    }
  }

  void toggleUpdate() {
    emitItem();
  }
}
