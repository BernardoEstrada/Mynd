import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/schema/structs/index.dart';
import 'backend/supabase/supabase.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _anonymous = await secureStorage.getBool('ff_anonymous') ?? _anonymous;
    });
    await _safeInitAsync(() async {
      _completedDataEntry =
          await secureStorage.getBool('ff_completedDataEntry') ??
              _completedDataEntry;
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_AnonymousUserLogin') != null) {
        try {
          final serializedData =
              await secureStorage.getString('ff_AnonymousUserLogin') ?? '{}';
          _AnonymousUserLogin = AnonymousUserLoginStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      _debug = await secureStorage.getBool('ff_debug') ?? _debug;
    });
    await _safeInitAsync(() async {
      _firstTimeOpeningTheApp =
          await secureStorage.getBool('ff_firstTimeOpeningTheApp') ??
              _firstTimeOpeningTheApp;
    });
    await _safeInitAsync(() async {
      _biometricAuth =
          await secureStorage.getBool('ff_biometricAuth') ?? _biometricAuth;
    });
    await _safeInitAsync(() async {
      _logLocation =
          await secureStorage.getBool('ff_logLocation') ?? _logLocation;
    });
    await _safeInitAsync(() async {
      _preferredLang =
          await secureStorage.getString('ff_preferredLang') ?? _preferredLang;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  bool _anonymous = true;
  bool get anonymous => _anonymous;
  set anonymous(bool _value) {
    _anonymous = _value;
    secureStorage.setBool('ff_anonymous', _value);
  }

  void deleteAnonymous() {
    secureStorage.delete(key: 'ff_anonymous');
  }

  bool _completedDataEntry = false;
  bool get completedDataEntry => _completedDataEntry;
  set completedDataEntry(bool _value) {
    _completedDataEntry = _value;
    secureStorage.setBool('ff_completedDataEntry', _value);
  }

  void deleteCompletedDataEntry() {
    secureStorage.delete(key: 'ff_completedDataEntry');
  }

  AnonymousUserLoginStruct _AnonymousUserLogin = AnonymousUserLoginStruct();
  AnonymousUserLoginStruct get AnonymousUserLogin => _AnonymousUserLogin;
  set AnonymousUserLogin(AnonymousUserLoginStruct _value) {
    _AnonymousUserLogin = _value;
    secureStorage.setString('ff_AnonymousUserLogin', _value.serialize());
  }

  void deleteAnonymousUserLogin() {
    secureStorage.delete(key: 'ff_AnonymousUserLogin');
  }

  void updateAnonymousUserLoginStruct(
      Function(AnonymousUserLoginStruct) updateFn) {
    updateFn(_AnonymousUserLogin);
    secureStorage.setString(
        'ff_AnonymousUserLogin', _AnonymousUserLogin.serialize());
  }

  bool _debug = false;
  bool get debug => _debug;
  set debug(bool _value) {
    _debug = _value;
    secureStorage.setBool('ff_debug', _value);
  }

  void deleteDebug() {
    secureStorage.delete(key: 'ff_debug');
  }

  bool _justOpenedTheApp = true;
  bool get justOpenedTheApp => _justOpenedTheApp;
  set justOpenedTheApp(bool _value) {
    _justOpenedTheApp = _value;
  }

  bool _firstTimeOpeningTheApp = true;
  bool get firstTimeOpeningTheApp => _firstTimeOpeningTheApp;
  set firstTimeOpeningTheApp(bool _value) {
    _firstTimeOpeningTheApp = _value;
    secureStorage.setBool('ff_firstTimeOpeningTheApp', _value);
  }

  void deleteFirstTimeOpeningTheApp() {
    secureStorage.delete(key: 'ff_firstTimeOpeningTheApp');
  }

  bool _biometricAuth = false;
  bool get biometricAuth => _biometricAuth;
  set biometricAuth(bool _value) {
    _biometricAuth = _value;
    secureStorage.setBool('ff_biometricAuth', _value);
  }

  void deleteBiometricAuth() {
    secureStorage.delete(key: 'ff_biometricAuth');
  }

  bool _logLocation = false;
  bool get logLocation => _logLocation;
  set logLocation(bool _value) {
    _logLocation = _value;
    secureStorage.setBool('ff_logLocation', _value);
  }

  void deleteLogLocation() {
    secureStorage.delete(key: 'ff_logLocation');
  }

  String _preferredLang = 'en';
  String get preferredLang => _preferredLang;
  set preferredLang(String _value) {
    _preferredLang = _value;
    secureStorage.setString('ff_preferredLang', _value);
  }

  void deletePreferredLang() {
    secureStorage.delete(key: 'ff_preferredLang');
  }

  bool _refreshReports = false;
  bool get refreshReports => _refreshReports;
  set refreshReports(bool _value) {
    _refreshReports = _value;
  }

  String _recentlyDeletedReport = '';
  String get recentlyDeletedReport => _recentlyDeletedReport;
  set recentlyDeletedReport(String _value) {
    _recentlyDeletedReport = _value;
  }

  final _availableGendersManager =
      FutureRequestManager<List<GendersByLangRow>>();
  Future<List<GendersByLangRow>> availableGenders({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<GendersByLangRow>> Function() requestFn,
  }) =>
      _availableGendersManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearAvailableGendersCache() => _availableGendersManager.clear();
  void clearAvailableGendersCacheKey(String? uniqueKey) =>
      _availableGendersManager.clearRequest(uniqueKey);

  final _allCountriesManager = FutureRequestManager<List<CountriesRow>>();
  Future<List<CountriesRow>> allCountries({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<CountriesRow>> Function() requestFn,
  }) =>
      _allCountriesManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearAllCountriesCache() => _allCountriesManager.clear();
  void clearAllCountriesCacheKey(String? uniqueKey) =>
      _allCountriesManager.clearRequest(uniqueKey);

  final _allStatesManager = FutureRequestManager<List<StatesRow>>();
  Future<List<StatesRow>> allStates({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<StatesRow>> Function() requestFn,
  }) =>
      _allStatesManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearAllStatesCache() => _allStatesManager.clear();
  void clearAllStatesCacheKey(String? uniqueKey) =>
      _allStatesManager.clearRequest(uniqueKey);

  final _userIdOnDataTableManager = FutureRequestManager<List<UserDataRow>>();
  Future<List<UserDataRow>> userIdOnDataTable({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<UserDataRow>> Function() requestFn,
  }) =>
      _userIdOnDataTableManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearUserIdOnDataTableCache() => _userIdOnDataTableManager.clear();
  void clearUserIdOnDataTableCacheKey(String? uniqueKey) =>
      _userIdOnDataTableManager.clearRequest(uniqueKey);

  final _supportedLangsManager =
      FutureRequestManager<List<SupportedLangsRow>>();
  Future<List<SupportedLangsRow>> supportedLangs({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<SupportedLangsRow>> Function() requestFn,
  }) =>
      _supportedLangsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearSupportedLangsCache() => _supportedLangsManager.clear();
  void clearSupportedLangsCacheKey(String? uniqueKey) =>
      _supportedLangsManager.clearRequest(uniqueKey);

  final _questionsLatestManager =
      FutureRequestManager<List<QuestionsUnexpiredRandomRow>>();
  Future<List<QuestionsUnexpiredRandomRow>> questionsLatest({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<QuestionsUnexpiredRandomRow>> Function() requestFn,
  }) =>
      _questionsLatestManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearQuestionsLatestCache() => _questionsLatestManager.clear();
  void clearQuestionsLatestCacheKey(String? uniqueKey) =>
      _questionsLatestManager.clearRequest(uniqueKey);

  final _reportTypesManager = FutureRequestManager<List<ReportsByLangRow>>();
  Future<List<ReportsByLangRow>> reportTypes({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<ReportsByLangRow>> Function() requestFn,
  }) =>
      _reportTypesManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearReportTypesCache() => _reportTypesManager.clear();
  void clearReportTypesCacheKey(String? uniqueKey) =>
      _reportTypesManager.clearRequest(uniqueKey);

  final _latestReportsManager = FutureRequestManager<List<AttackReportsRow>>();
  Future<List<AttackReportsRow>> latestReports({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<AttackReportsRow>> Function() requestFn,
  }) =>
      _latestReportsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearLatestReportsCache() => _latestReportsManager.clear();
  void clearLatestReportsCacheKey(String? uniqueKey) =>
      _latestReportsManager.clearRequest(uniqueKey);

  final _reportsSummaryManager =
      FutureRequestManager<List<AttackReportsSummaryRow>>();
  Future<List<AttackReportsSummaryRow>> reportsSummary({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<AttackReportsSummaryRow>> Function() requestFn,
  }) =>
      _reportsSummaryManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearReportsSummaryCache() => _reportsSummaryManager.clear();
  void clearReportsSummaryCacheKey(String? uniqueKey) =>
      _reportsSummaryManager.clearRequest(uniqueKey);
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
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

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
