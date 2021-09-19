import 'package:mobile_buyer_flutter/bloc/phone_bloc_base.dart';
import 'package:mobile_buyer_flutter/data_layer/api_services.dart';
import 'package:mobile_buyer_flutter/data_layer/phone.dart';

class PhoneBloc extends PhoneBlocBase {

  final _serviceApi = ApiServices();

  List<Phone> get phoneList => phones;

  PhoneBloc() : super([]) {
    fetchPhones();
  }

  void fetchPhones() async {
    phones = await _serviceApi.fetchPhoneList();
    emitItem(withSort: true);
  }

  void toggleUpdate() {
    emitItem();
  }
}
