import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';
import 'package:girlzwhosell/model/login_model.dart';
import 'package:girlzwhosell/model/token_model.dart';



class Storage extends StorageBase {

  static final Storage _instance = Storage._internal();

  factory Storage() {
    return _instance;
  }

  Storage._internal() {
    _storage = FlutterSecureStorage();
  }
}
abstract class StorageBase {

  @protected
  FlutterSecureStorage _storage;





  //////////token info///////////
  final key_token = 'key_token';
  final key_idforDevices = 'key_id';
  final name = 'name';
  final cnic = 'cnic';
  final dob = 'dob';
  final company = 'company';
  final email = 'email';
  final city = 'city';
  final cellPhone = 'cellPhone';
  final mailingAddress = 'mailingAddress';
  final key_VehDetails = 'key_VehDetails';


  final fcm_token = 'token';





  List<_SecItem> items = [];

  Future<String> get_idforDevices() async {

    try {
      return readWhereKey(key_idforDevices);
    } catch (err) {
      return null;
    }
  }
  Future<String> getCookie() async {

    try {
      return readWhereKey(key_token);
    } catch (err) {
      return null;
    }
  }

  Future<String> getfcm_token() async {

    try {
      return readWhereKey(fcm_token);
    } catch (err) {
      return null;
    }
  }

  Future<String> getUser_name() async {

    try {
      return readWhereKey(name);
    } catch (err) {
      return null;
    }
  }
  Future<String> getUser_email() async {

    try {
      return readWhereKey(email);
    } catch (err) {
      return null;
    }
  }
  Future<String> getUser_cnic() async {

    try {
      return readWhereKey(cnic);
    } catch (err) {
      return null;
    }
  }
  Future<String> getUser_cellPhone() async {

    try {
      return readWhereKey(cellPhone);
    } catch (err) {
      return null;
    }
  }
  Future<String> getUser_company() async {

    try {
      return readWhereKey(company);
    } catch (err) {
      return null;
    }
  }
  Future<String> getUser_city() async {

    try {
      return readWhereKey(city);
    } catch (err) {
      return null;
    }
  }
  Future<String> getUser_mailingAddress() async {

    try {
      return readWhereKey(mailingAddress);
    } catch (err) {
      return null;
    }
  }
  Future<String> getUser_dob() async {

    try {
      return readWhereKey(dob);
    } catch (err) {
      return null;
    }
  }


  // Future<List<VehDetails>> getAllDevices() async {
  //
  //   try {
  //     String visions = await readWhereKey(key_VehDetails);
  //     if(visions == null) {
  //       return new List<VehDetails>();
  //     } else {
  //       return (json.decode(visions) as List).map((i) =>
  //           VehDetails.fromJson(i)).toList();
  //     }
  //   } catch (err) {
  //     return null;
  //   }
  // }


  void updatetokenInfo(LoginModel resp) {
    addNewItem(key_token, jsonEncode(resp.seekerDetails[0].id));
    addNewItem(key_idforDevices, jsonEncode(resp.seekerDetails[0].firstname));
    addNewItem(name, jsonEncode(resp.seekerDetails[0].lastname));
    addNewItem(email, jsonEncode(resp.seekerDetails[0].email));
    addNewItem(cnic, jsonEncode(resp.seekerDetails[0].address));
    // addNewItem(cellPhone, jsonEncode(resp.userDetails.cellPhone));
    // addNewItem(company, jsonEncode(resp.userDetails.company));
    // addNewItem(city, jsonEncode(resp.userDetails.city));
    // addNewItem(mailingAddress, jsonEncode(resp.userDetails.mailingAddress));
    // addNewItem(dob, jsonEncode(resp.userDetails.dob));
    // addNewItem(key_VehDetails, jsonEncode(resp.vehDetails));

  }
  void updatetoken(TokenModel resp) {
    addNewItem(fcm_token, jsonEncode(resp.token));
  }

  //////////AllDevices////////////
  final key_device_status = 'key_device_status';
  final key_contact = 'key_contact';
  final key_positionId = '0';
  final key_device_id = 'key_device_id';
  final key_index = 'key_index';

  Future<String> get_DeviceID() async {

    try {
      return readWhereKey(key_device_id);
    } catch (err) {
      return null;
    }
  }
  Future<String> get_PositionID() async {

    try {
      return readWhereKey(key_positionId);
    } catch (err) {
      return null;
    }
  }

  Future<String> get_contact() async {

    try {
      return readWhereKey(key_contact);
    } catch (err) {
      return null;
    }
  }

  Future<String> get_index() async {

    try {
      return readWhereKey(key_index);
    } catch (err) {
      return null;
    }
  }



  void updateDeviceId(int resp) {

    addNewItem(key_device_id, resp.toString());
  }
  void updatePositionId(int resp) {

    addNewItem(key_positionId, resp.toString());

  }
  void updatecontact(String resp) {

    addNewItem(key_contact, resp.toString());

  }
  void updateindex(int resp) {

    addNewItem(key_index, resp.toString());

  }

  ////////////////////////////////////////////////////



  void deleteAll() async {
    await _storage.deleteAll();
    readAll();
  }

  void addNewItem(String key, String value) async {
    await _storage.write(key: key, value: value);
    //print('====================Added $key=====================');
    readAll();
  }


  void deleteItem(String key) async {
    await _storage.delete(key: key);
    //print('====================delete $key=====================');
    print("delete = "+key);
  }

  Future<String> readWhereKey(String key) async {

    final keyValue = await _storage.read(key: key);
    return keyValue;
  }

  Future<List<_SecItem>> readAll() async {

    final all = await _storage.readAll();
    return items = all.keys
        .map((key) => _SecItem(key, all[key]))
        .toList(growable: false);
  }
}

class _SecItem {
  _SecItem(this.key, this.value);

  final String key;
  final String value;
}