import 'package:flutter/cupertino.dart';
import 'package:tugas_4/models/items_model.dart';

class FavoriteBloc extends ChangeNotifier {
  int _count = 0;
  List<ItemModel> favorite = [];
  void incrementCount() {
    _count++;
    notifyListeners();
  }

  void decrementCount() {
    _count--;
    notifyListeners();
  }

  int get count {
    return _count;
  }

  void addItems(ItemModel data) {
    // object of the ItemModel
    favorite.add(data); // accessed from itemsModel list of type ItemModel class
    notifyListeners();
  }

  void removeItems(ItemModel data) {
    // object of the ItemModel
    favorite
        .remove(data); // accessed from itemsModel list of type ItemModel class
    notifyListeners();
  }

  List<ItemModel> get itemsModel {
    return favorite;
  }
}
