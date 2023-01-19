import 'package:flutter/widgets.dart';
import 'package:km_test/src/models/user_model.dart';
import 'package:km_test/src/service/user_service.dart';

class UserProvider with ChangeNotifier {
  late UserService _userService;

  String _myname = "";

  UserProvider() {
    _userService = UserService();
  }
  int _page = 1;
  bool _selected = false;
  List<UserModel>? _users;
  List<UserModel> get users => _users!;
  String get myname => _myname;
  bool get selected => _selected;

  void getName(name) {
    _myname = name;
    notifyListeners();
  }

  void selection() {
    _selected = true;
    notifyListeners();
  }

  Future<bool> saveAll() async {
    try {
      List<UserModel> result = await _userService.get(_page);
      _users = result;
      if (_page < 2) {
        _page = _page + 1;
      }
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> refreshData() async {
    try {
      _page = 1;
      List<UserModel> result = await _userService.get(_page);
      _users = result;
      if (_page < 2) {
        _page = _page + 1;
      }
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> nextPage() async {
    try {
      List<UserModel> result = await _userService.get(_page);
      _users = _users! + result;
      if (_page < 2) {
        _page = _page + 1;
      }
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }
}
