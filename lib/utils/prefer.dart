import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  static SharedPreferences _prefsInstance;

  static const String KEY_LANGUAGE_CODE = 'LANGUAGE_CODE';
  static const String KEY_COUNTRY_CODE = 'COUNTRY_CODE';
  static const String KEY_IS_LOGGED_IN = 'IS_LOGGED_IN';
  static const String KEY_TOKEN = 'TOKEN';
  static const String KEY_USER_INFO = 'USER_INFO';
  static const String USER_ID = 'USER_ID';
  static const String REGION = 'REGION';
  static const String REGION_ID = 'REGION_ID';
  static const String CITY_ID = 'CITY_ID';
  static const String CITY = 'CITY';

  static bool _initCalled = false;

  static const String USER_TYPE ='USER_TYPE';

  static Future<void> init() async {
    _initCalled = true;
    _prefsInstance = await _prefs;
    print("init called");
  }

  static void dispose() {
    _prefs = null;
    _prefsInstance = null;
    print("Dispose called");
  }

  static Set<String> getKeys() {
    assert(_initCalled,
    "Prefs.init() must be called first in an initState() preferably!");
    assert(_prefsInstance != null,
    "Maybe call Prefs.getKeysF() instead. SharedPreferneces not ready yet!");
    return _prefsInstance.getKeys();
  }

  static Future<Set<String>> getKeysF() async {
    Set<String> value;
    if (_prefsInstance == null) {
      var instance = await _prefs;
      value = instance?.getKeys() ?? Set();
    } else {
      value = getKeys();
    }
    return value;
  }

  static dynamic get(String key) {
    assert(_initCalled,
    "Prefs.init() must be called first in an initState() preferably!");
    assert(_prefsInstance != null,
    "Maybe call Prefs.getKeysF() instead. SharedPreferneces not ready yet!");
    return _prefsInstance.get(key);
  }

  // Returns a Future<dynamic>
  static Future<dynamic> getF(String key) async {
    dynamic value;
    if (_prefsInstance == null) {
      var instance = await _prefs;
      value = instance?.get(key);
    } else {
      value = get(key);
    }
    return value;
  }

  static bool getBool(String key, [bool defValue]) {
    assert(_initCalled,
    "Prefs.init() must be called first in an initState() preferably!");
    assert(_prefsInstance != null,
    "Maybe call Prefs.getKeysF() instead. SharedPreferneces not ready yet!");

    return _prefsInstance.getBool(key) ?? defValue ?? false;
  }

  // Returns a Future<bool>
  static Future<bool> getBoolF(String key, [bool defValue]) async {
    bool value;
    if (_prefsInstance == null) {
      var instance = await _prefs;
      value = instance?.getBool(key) ?? defValue ?? false;
    } else {
      value = getBool(key);
    }
    return value;
  }

  static int getInt(String key, [int defValue]) {
    assert(_initCalled,
    "Prefs.init() must be called first in an initState() preferably!");
    assert(_prefsInstance != null,
    "Maybe call Prefs.getKeysF() instead. SharedPreferneces not ready yet!");

    return _prefsInstance.getInt(key) ?? defValue ?? 0;
  }

  // Returns a Future<int>
  static Future<int> getIntF(String key, [int defValue]) async {
    int value;
    if (_prefsInstance == null) {
      var instance = await _prefs;
      value = instance?.getInt(key) ?? defValue ?? 0;
    } else {
      value = getInt(key);
    }
    return value;
  }

  static double getDouble(String key, [double defValue]) {
    assert(_initCalled,
    "Prefs.init() must be called first in an initState() preferably!");
    assert(_prefsInstance != null,
    "Maybe call Prefs.getKeysF() instead. SharedPreferneces not ready yet!");

    return _prefsInstance.getDouble(key) ?? defValue ?? 0.0;
  }

  // Returns a Future<double>
  static Future<double> getDoubleF(String key, [double defValue]) async {
    double value;
    if (_prefsInstance == null) {
      var instance = await _prefs;
      value = instance?.getDouble(key) ?? defValue ?? 0.0;
    } else {
      value = getDouble(key);
    }
    return value;
  }

  static String getString(String key, [String defValue]) {
    assert(_initCalled,
    "Prefs.init() must be called first in an initState() preferably!");
    assert(_prefsInstance != null,
    "Maybe call Prefs.getKeysF() instead. SharedPreferneces not ready yet!");

    return _prefsInstance.getString(key) ?? defValue ?? "";
  }

  // Returns a Future<String>
  static Future<String> getStringF(String key, [String defValue]) async {
    String value;
    if (_prefsInstance == null) {
      var instance = await _prefs;
      value = instance?.getString(key) ?? defValue ?? "";
    } else {
      value = getString(key);
    }
    return value;
  }

  static List<String> getStringList(String key, [List<String> defValue]) {
    assert(_initCalled,
    "Prefs.init() must be called first in an initState() preferably!");
    assert(_prefsInstance != null,
    "Maybe call Prefs.getKeysF() instead. SharedPreferneces not ready yet!");

    return _prefsInstance.getStringList(key) ?? defValue ?? [""];
  }

  // Returns a Future<List<String>>
  static Future<List<String>> getStringListF(String key,
      [List<String> defValue]) async {
    List<String> value;
    if (_prefsInstance == null) {
      var instance = await _prefs;
      value = instance?.getStringList(key) ?? defValue ?? [""];
    } else {
      value = getStringList(key);
    }
    return value;
  }

  // Save Boolean value to persistent storage
  static Future<bool> setBool(String key, bool value) async {
    var instance = await _prefs;
    return instance?.setBool(key, value) ?? Future.value(false);
  }

  // Save Integer value to persistent storage
  static Future<bool> setInt(String key, int value) async {
    var instance = await _prefs;
    return instance?.setInt(key, value) ?? Future.value(false);
  }

  // Save Double value to persistent storage
  static Future<bool> setDouble(String key, double value) async {
    var instance = await _prefs;
    return instance?.setDouble(key, value) ?? Future.value(false);
  }

  // Save String value to persistent storage
  static Future<bool> setString(String key, String value) async {
    var instance = await _prefs;
    return instance?.setString(key, value) ?? Future.value(false);
  }

  // Save StringList value to persistent storage
  static Future<bool> setStringList(String key, List<String> value) async {
    var instance = await _prefs;
    return instance?.setStringList(key, value) ?? Future.value(false);
  }

  // Removes an entry from persistent storage
  static Future<bool> remove(String key) async {
    var instance = await _prefs;
    return instance?.remove(key) ?? Future.value(false);
  }

  // Returns true once persistent storage has been cleared
  static Future<bool> clear() async {
    var instance = await _prefs;
    print('PREFS CLEARED');
    return instance?.clear() ?? Future.value(false);
  }

  // Save Language Code value to persistent storage
  static Future<bool> setLanguageCode(String value) async {
    var instance = await _prefs;
    return instance?.setString(KEY_LANGUAGE_CODE, value) ?? Future.value(false);
  }

  static String getLanguageCode([String defValue]) {
    assert(_initCalled,
    "Prefs.init() must be called first in an initState() preferably!");
    assert(_prefsInstance != null,
    "Maybe call Prefs.getKeysF() instead. SharedPreferneces not ready yet!");

    return _prefsInstance.getString(KEY_LANGUAGE_CODE) ?? defValue ?? "";
  }

  // Save Country Code value to persistent storage
  static Future<bool> setCountryCode(String value) async {
    var instance = await _prefs;
    return instance?.setString(KEY_COUNTRY_CODE, value) ?? Future.value(false);
  }

  static String getCountryCode([String defValue]) {
    assert(_initCalled,
    "Prefs.init() must be called first in an initState() preferably!");
    assert(_prefsInstance != null,
    "Maybe call Prefs.getKeysF() instead. SharedPreferneces not ready yet!");

    return _prefsInstance.getString(KEY_COUNTRY_CODE) ?? defValue ?? "";
  }



  static Future<bool> setLoggedIn(bool value) async {
    print('LOGGED_IN_STATUS: ${value}');
    var instance = await _prefs;
    return instance?.setBool(KEY_IS_LOGGED_IN, value) ?? Future.value(false);
  }

  static bool isLoggedIn() {
    return _prefsInstance.getBool(KEY_IS_LOGGED_IN) ?? false ?? false;
  }



  /*static Future<bool> setOfficerDetails(OfficerData officer) async {
    var instance = await _prefs;
//    setUserID(user?.data?.userId);
//    setToken(user?.data?.token);
//    instance?.setString(Constant.PROFILE_IMG_URL, user?.data?.profileUrl);
    return instance?.setString(KEY_USER_INFO, jsonEncode(officer)) ??
        Future.value(null);
  }

  static  OfficerData getOfficer() {
    return _prefsInstance.getString(KEY_USER_INFO) != null
        ? OfficerData.fromJson(
        json.decode(_prefsInstance.getString(KEY_USER_INFO)) ??
            null ??
            null)
        : null;
  }*/

  static String getToken() {
    return _prefsInstance.getString(KEY_TOKEN) ?? '' ?? '';
  }

  static Future<bool> setToken(String token) async {
    var instance = await _prefs;
    return instance?.setString(KEY_TOKEN, token) ?? '';
  }

  static String getUserID() {
    return _prefsInstance.getString(USER_ID) ?? '' ?? '';
  }

  static Future<bool> setUserID(String userID) async {
    var instance = await _prefs;
    return instance?.setString(USER_ID, userID) ?? '';
  }


  static int getUserLoginType() {
    return _prefsInstance.getInt(USER_TYPE) ?? 0 ?? 0;
  }

  /*1 = Applicant
  * 2= Officer
  * 3 = Admin
  * 4= Tp Validator*/

  static Future<bool> setUserLoginType(int userType) async {
    var instance = await _prefs;
    return instance?.setInt(USER_TYPE, userType) ?? 0;
  }


}

