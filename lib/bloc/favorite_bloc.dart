import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_buyer_flutter/data_layer/phone.dart';

class FavoriteBloc extends Cubit<List<Phone>> {

  final _favorites = <Phone>[];
  List<Phone> get favorite => _favorites;

  FavoriteBloc() : super([]);

  void toggleFavorite(Phone phone) {
    if(_favorites.contains(phone)) {
      _favorites.removeWhere((item) => item.id == phone.id);
    } else {
      _favorites.add(phone);
    }
    emit(List.from(_favorites));
  }


}