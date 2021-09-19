

import 'dart:async';

import 'package:mobile_buyer_flutter/bloc/base_bloc.dart';
import 'package:mobile_buyer_flutter/data_layer/api_services.dart';
import 'package:mobile_buyer_flutter/data_layer/phone.dart';

class PhoneBloc implements BaseBloc {

  final _serviceApi = ApiServices();
  final _controller = StreamController<List<Phone>>();


  //getter the stream
  Stream<List<Phone>> get phoneStream => _controller.stream;

  void fetchPhones() async {
    final results = await _serviceApi.fetchPhoneList();
    _controller.sink.add(results);
  }

  @override
  void dispose() {
    _controller.close();
  }

}