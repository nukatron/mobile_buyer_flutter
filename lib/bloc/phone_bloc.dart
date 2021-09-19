

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_buyer_flutter/data_layer/api_services.dart';
import 'package:mobile_buyer_flutter/data_layer/phone.dart';

class PhoneBloc extends Cubit<List<Phone>> {

  final _serviceApi = ApiServices();

  var _phones = <Phone>[];
  List<Phone> get favorite => _phones;

  PhoneBloc() : super([]) {
    fetchPhones();
  }

  void fetchPhones() async {
    _phones = await _serviceApi.fetchPhoneList();
   emit(List.from(_phones));
  }

  void toggleFavorite() {
    emit(List.from(_phones));
  }


}