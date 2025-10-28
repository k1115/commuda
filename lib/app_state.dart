import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      if (prefs.containsKey('ff_userInfo')) {
        try {
          final serializedData = prefs.getString('ff_userInfo') ?? '{}';
          _userInfo =
              UserInfoStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  UserInfoStruct _userInfo = UserInfoStruct.fromSerializableMap(jsonDecode(
      '{\"notification\":\"[]\",\"communityBookmarkId\":\"[]\",\"threadBookmarkId\":\"[]\"}'));
  UserInfoStruct get userInfo => _userInfo;
  set userInfo(UserInfoStruct value) {
    _userInfo = value;
    prefs.setString('ff_userInfo', value.serialize());
  }

  void updateUserInfoStruct(Function(UserInfoStruct) updateFn) {
    updateFn(_userInfo);
    prefs.setString('ff_userInfo', _userInfo.serialize());
  }

  int _selectedCommunity = -1;
  int get selectedCommunity => _selectedCommunity;
  set selectedCommunity(int value) {
    _selectedCommunity = value;
  }

  String _fcmToken = '';
  String get fcmToken => _fcmToken;
  set fcmToken(String value) {
    _fcmToken = value;
  }

  int _activeSort = 0;
  int get activeSort => _activeSort;
  set activeSort(int value) {
    _activeSort = value;
  }

  bool _valueForUpdate = false;
  bool get valueForUpdate => _valueForUpdate;
  set valueForUpdate(bool value) {
    _valueForUpdate = value;
  }

  int _selectedMenu = 0;
  int get selectedMenu => _selectedMenu;
  set selectedMenu(int value) {
    _selectedMenu = value;
  }

  List<int> _communityIds = [];
  List<int> get communityIds => _communityIds;
  set communityIds(List<int> value) {
    _communityIds = value;
  }

  void addToCommunityIds(int value) {
    communityIds.add(value);
  }

  void removeFromCommunityIds(int value) {
    communityIds.remove(value);
  }

  void removeAtIndexFromCommunityIds(int index) {
    communityIds.removeAt(index);
  }

  void updateCommunityIdsAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    communityIds[index] = updateFn(_communityIds[index]);
  }

  void insertAtIndexInCommunityIds(int index, int value) {
    communityIds.insert(index, value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
