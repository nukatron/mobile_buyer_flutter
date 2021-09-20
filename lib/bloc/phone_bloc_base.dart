import 'dart:async';

import 'package:mobile_buyer_flutter/bloc/bloc.dart';
import 'package:mobile_buyer_flutter/data_layer/phone.dart';
import 'package:mobile_buyer_flutter/data_layer/sort_type.dart';
import 'package:rxdart/rxdart.dart';

abstract class PhoneBlocBase extends Bloc {

  var _sortType = SortType.none;
  var phones = <Phone>[];

  final _controller = BehaviorSubject<List<Phone>>();
  Stream<List<Phone>> get phoneStream => _controller.stream;

  void updateSortedList(SortType sortType) {
    _sortType = sortType;
    emitItem(withSort: true);
  }

  void emitItem({bool withSort = false}) {
    if(withSort) {
      phones.sort((a, b) {
        if (_sortType == SortType.lowestPrice) {
          return a.price > b.price ? 1 : -1;
        } else if (_sortType == SortType.highestPrice) {
          return b.price > a.price ? 1 : -1;
        } else if (_sortType == SortType.rating) {
          return b.rating > a.rating ? 1 : -1;
        } else {
          return 0;
        }
      });
    }
    _controller.sink.add(List.from(phones));
  }

  @override
  void dispose() {
    _controller.close();
  }

}