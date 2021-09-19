import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_buyer_flutter/data_layer/phone.dart';
import 'package:mobile_buyer_flutter/data_layer/sort_type.dart';

abstract class PhoneBlocBase extends Cubit<List<Phone>> {

  var _sortType = SortType.none;
  var phones = <Phone>[];

  PhoneBlocBase(List<Phone> initialState) : super(initialState);

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
    emit(List.from(phones));
  }

}