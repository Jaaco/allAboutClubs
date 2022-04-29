import 'package:all_about_clubs/services/club_api.dart';
import 'package:flutter/cupertino.dart';

import '../models/club.dart';

class ClubProvider extends ChangeNotifier {
  List<Club> _clubList = [];
  bool _sortByName = true;
  bool _noRespone = false;

  List<Club> get clubs => _clubList;
  bool get noResponse => _noRespone;

  ClubProvider() {
    _initialData();
  }

  Future<void> _initialData() async {
    List<Club> _clubsFromApi = await ClubApi().fetchClubs();
    if (_clubsFromApi.isEmpty) _noRespone = true;
    _clubList = _clubsFromApi;
    sortClubs();
    notifyListeners();
  }

  void sortClubs() {
    if (_sortByName) {
      _clubList.sort(
        (a, b) => a.name.compareTo(
          b.name,
        ),
      );
    } else {
      _clubList.sort(
        (a, b) => a.value.compareTo(b.value),
      );
      _clubList = _clubList.reversed.toList();
    }
    _sortByName = !_sortByName;
    notifyListeners();
  }
}
