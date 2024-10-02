import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      _teamNum = prefs.getString('ff_teamNum') ?? _teamNum;
    });
    _safeInit(() {
      _teamName = prefs.getString('ff_teamName') ?? _teamName;
    });
    _safeInit(() {
      _displayName = prefs.getString('ff_displayName') ?? _displayName;
    });
    _safeInit(() {
      _premiumTeam = prefs.getBool('ff_premiumTeam') ?? _premiumTeam;
    });
    _safeInit(() {
      _teamID = prefs.getInt('ff_teamID') ?? _teamID;
    });
    _safeInit(() {
      _ongoingEvent = prefs.getBool('ff_ongoingEvent') ?? _ongoingEvent;
    });
    _safeInit(() {
      _verified = prefs.getBool('ff_verified') ?? _verified;
    });
    _safeInit(() {
      _HomePageACAW = prefs.getStringList('ff_HomePageACAW') ?? _HomePageACAW;
    });
    _safeInit(() {
      _HomePageAW = prefs.getStringList('ff_HomePageAW') ?? _HomePageAW;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _teamNum = '';
  String get teamNum => _teamNum;
  set teamNum(String value) {
    _teamNum = value;
    prefs.setString('ff_teamNum', value);
  }

  String _teamName = '';
  String get teamName => _teamName;
  set teamName(String value) {
    _teamName = value;
    prefs.setString('ff_teamName', value);
  }

  String _displayName = '';
  String get displayName => _displayName;
  set displayName(String value) {
    _displayName = value;
    prefs.setString('ff_displayName', value);
  }

  bool _premiumTeam = false;
  bool get premiumTeam => _premiumTeam;
  set premiumTeam(bool value) {
    _premiumTeam = value;
    prefs.setBool('ff_premiumTeam', value);
  }

  bool _makePhoto = false;
  bool get makePhoto => _makePhoto;
  set makePhoto(bool value) {
    _makePhoto = value;
  }

  String _filePath = '';
  String get filePath => _filePath;
  set filePath(String value) {
    _filePath = value;
  }

  int _index = 1;
  int get index => _index;
  set index(int value) {
    _index = value;
  }

  int _cameraDirection = 1;
  int get cameraDirection => _cameraDirection;
  set cameraDirection(int value) {
    _cameraDirection = value;
  }

  DateTime? _currentDate;
  DateTime? get currentDate => _currentDate;
  set currentDate(DateTime? value) {
    _currentDate = value;
  }

  int _teamID = 0;
  int get teamID => _teamID;
  set teamID(int value) {
    _teamID = value;
    prefs.setInt('ff_teamID', value);
  }

  dynamic _nullval;
  dynamic get nullval => _nullval;
  set nullval(dynamic value) {
    _nullval = value;
  }

  bool _ongoingEvent = false;
  bool get ongoingEvent => _ongoingEvent;
  set ongoingEvent(bool value) {
    _ongoingEvent = value;
    prefs.setBool('ff_ongoingEvent', value);
  }

  String _chatTeamNum = '';
  String get chatTeamNum => _chatTeamNum;
  set chatTeamNum(String value) {
    _chatTeamNum = value;
  }

  bool _verified = false;
  bool get verified => _verified;
  set verified(bool value) {
    _verified = value;
    prefs.setBool('ff_verified', value);
  }

  bool _messageMenuOpen = false;
  bool get messageMenuOpen => _messageMenuOpen;
  set messageMenuOpen(bool value) {
    _messageMenuOpen = value;
  }

  dynamic _APIResponse1;
  dynamic get APIResponse1 => _APIResponse1;
  set APIResponse1(dynamic value) {
    _APIResponse1 = value;
  }

  dynamic _APIResponse2;
  dynamic get APIResponse2 => _APIResponse2;
  set APIResponse2(dynamic value) {
    _APIResponse2 = value;
  }

  dynamic _APIResponse3;
  dynamic get APIResponse3 => _APIResponse3;
  set APIResponse3(dynamic value) {
    _APIResponse3 = value;
  }

  dynamic _APIResponse4;
  dynamic get APIResponse4 => _APIResponse4;
  set APIResponse4(dynamic value) {
    _APIResponse4 = value;
  }

  dynamic _APIResponse5;
  dynamic get APIResponse5 => _APIResponse5;
  set APIResponse5(dynamic value) {
    _APIResponse5 = value;
  }

  dynamic _APIResponse6;
  dynamic get APIResponse6 => _APIResponse6;
  set APIResponse6(dynamic value) {
    _APIResponse6 = value;
  }

  dynamic _APIResponse7;
  dynamic get APIResponse7 => _APIResponse7;
  set APIResponse7(dynamic value) {
    _APIResponse7 = value;
  }

  dynamic _APIResponse8;
  dynamic get APIResponse8 => _APIResponse8;
  set APIResponse8(dynamic value) {
    _APIResponse8 = value;
  }

  int _TimeZoneOffset = 0;
  int get TimeZoneOffset => _TimeZoneOffset;
  set TimeZoneOffset(int value) {
    _TimeZoneOffset = value;
  }

  dynamic _APIResponse9;
  dynamic get APIResponse9 => _APIResponse9;
  set APIResponse9(dynamic value) {
    _APIResponse9 = value;
  }

  String _SortBy = 'teamNum';
  String get SortBy => _SortBy;
  set SortBy(String value) {
    _SortBy = value;
  }

  dynamic _APIResponse10;
  dynamic get APIResponse10 => _APIResponse10;
  set APIResponse10(dynamic value) {
    _APIResponse10 = value;
  }

  dynamic _APIResponse11;
  dynamic get APIResponse11 => _APIResponse11;
  set APIResponse11(dynamic value) {
    _APIResponse11 = value;
  }

  dynamic _APIResponse12;
  dynamic get APIResponse12 => _APIResponse12;
  set APIResponse12(dynamic value) {
    _APIResponse12 = value;
  }

  dynamic _APIResponse13;
  dynamic get APIResponse13 => _APIResponse13;
  set APIResponse13(dynamic value) {
    _APIResponse13 = value;
  }

  dynamic _APIResponse14;
  dynamic get APIResponse14 => _APIResponse14;
  set APIResponse14(dynamic value) {
    _APIResponse14 = value;
  }

  dynamic _APIResponse15;
  dynamic get APIResponse15 => _APIResponse15;
  set APIResponse15(dynamic value) {
    _APIResponse15 = value;
  }

  dynamic _APIResponse16;
  dynamic get APIResponse16 => _APIResponse16;
  set APIResponse16(dynamic value) {
    _APIResponse16 = value;
  }

  dynamic _APIResponse17;
  dynamic get APIResponse17 => _APIResponse17;
  set APIResponse17(dynamic value) {
    _APIResponse17 = value;
  }

  dynamic _APIResponse18;
  dynamic get APIResponse18 => _APIResponse18;
  set APIResponse18(dynamic value) {
    _APIResponse18 = value;
  }

  dynamic _APIResponse19;
  dynamic get APIResponse19 => _APIResponse19;
  set APIResponse19(dynamic value) {
    _APIResponse19 = value;
  }

  dynamic _APIResponse20;
  dynamic get APIResponse20 => _APIResponse20;
  set APIResponse20(dynamic value) {
    _APIResponse20 = value;
  }

  dynamic _APIResponse21;
  dynamic get APIResponse21 => _APIResponse21;
  set APIResponse21(dynamic value) {
    _APIResponse21 = value;
  }

  List<String> _HomePageACAW = ['Event Info', 'Next Match'];
  List<String> get HomePageACAW => _HomePageACAW;
  set HomePageACAW(List<String> value) {
    _HomePageACAW = value;
    prefs.setStringList('ff_HomePageACAW', value);
  }

  void addToHomePageACAW(String value) {
    HomePageACAW.add(value);
    prefs.setStringList('ff_HomePageACAW', _HomePageACAW);
  }

  void removeFromHomePageACAW(String value) {
    HomePageACAW.remove(value);
    prefs.setStringList('ff_HomePageACAW', _HomePageACAW);
  }

  void removeAtIndexFromHomePageACAW(int index) {
    HomePageACAW.removeAt(index);
    prefs.setStringList('ff_HomePageACAW', _HomePageACAW);
  }

  void updateHomePageACAWAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    HomePageACAW[index] = updateFn(_HomePageACAW[index]);
    prefs.setStringList('ff_HomePageACAW', _HomePageACAW);
  }

  void insertAtIndexInHomePageACAW(int index, String value) {
    HomePageACAW.insert(index, value);
    prefs.setStringList('ff_HomePageACAW', _HomePageACAW);
  }

  List<String> _HomePageAW = ['Upcoming Events'];
  List<String> get HomePageAW => _HomePageAW;
  set HomePageAW(List<String> value) {
    _HomePageAW = value;
    prefs.setStringList('ff_HomePageAW', value);
  }

  void addToHomePageAW(String value) {
    HomePageAW.add(value);
    prefs.setStringList('ff_HomePageAW', _HomePageAW);
  }

  void removeFromHomePageAW(String value) {
    HomePageAW.remove(value);
    prefs.setStringList('ff_HomePageAW', _HomePageAW);
  }

  void removeAtIndexFromHomePageAW(int index) {
    HomePageAW.removeAt(index);
    prefs.setStringList('ff_HomePageAW', _HomePageAW);
  }

  void updateHomePageAWAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    HomePageAW[index] = updateFn(_HomePageAW[index]);
    prefs.setStringList('ff_HomePageAW', _HomePageAW);
  }

  void insertAtIndexInHomePageAW(int index, String value) {
    HomePageAW.insert(index, value);
    prefs.setStringList('ff_HomePageAW', _HomePageAW);
  }

  dynamic _teamInfoAPI;
  dynamic get teamInfoAPI => _teamInfoAPI;
  set teamInfoAPI(dynamic value) {
    _teamInfoAPI = value;
  }

  dynamic _APIWorldSkills;
  dynamic get APIWorldSkills => _APIWorldSkills;
  set APIWorldSkills(dynamic value) {
    _APIWorldSkills = value;
  }

  final _userDocQueryManager = FutureRequestManager<UsersRecord>();
  Future<UsersRecord> userDocQuery({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<UsersRecord> Function() requestFn,
  }) =>
      _userDocQueryManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearUserDocQueryCache() => _userDocQueryManager.clear();
  void clearUserDocQueryCacheKey(String? uniqueKey) =>
      _userDocQueryManager.clearRequest(uniqueKey);
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
