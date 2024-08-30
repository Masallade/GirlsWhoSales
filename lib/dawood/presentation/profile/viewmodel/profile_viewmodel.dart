import 'dart:async';
import 'package:girlzwhosell/dawood/data/delete_account.dart';
import 'package:girlzwhosell/dawood/presentation/common/custom_exist_alertDialog.dart';
import 'package:flutter/material.dart';
import 'package:girlzwhosell/dawood/domain/bottom_navigation_model.dart';
import 'package:girlzwhosell/dawood/domain/profile_menu_model.dart';
import 'package:girlzwhosell/dawood/presentation/base/base_viewmodel.dart';
import 'package:girlzwhosell/dawood/presentation/resources/routes_manager.dart';
import 'package:girlzwhosell/dawood/presentation/resources/string_manger.dart';

class ProfileViewModel implements BaseViewModel,ProfileViewModelInput,ProfileViewModelOutputs{
  CurrentUserDetails currentUserDetails;
  StreamController<List<ProfileMenuModel>> _streamController = StreamController<List<ProfileMenuModel>>();

  ProfileViewModel({required this.currentUserDetails});


  @override
  void start(BuildContext context) {
    _list=getProfileModelMenuList(context);
    _sinkProfileModelMenu();
  }


  @override
  void dispose() {
    _streamController.close();
  }


  @override
  Sink get inputProfileMenuList {
    return _streamController.sink;
  }



  @override
  Stream<List<ProfileMenuModel>> get outputProfileMenuList => _streamController.stream;



  //*********************Private***************************//
  late List<ProfileMenuModel> _list;
  List<ProfileMenuModel> getProfileModelMenuList(BuildContext context){
    return [
      ProfileMenuModel(title: '${AppString.my} ${AppString.profile}', onTap: () {Navigator.pushNamed(context, Routes.editProfilePagePath,arguments: currentUserDetails);},),
      ProfileMenuModel(title: '${AppString.my} ${AppString.cv}', onTap: () {Navigator.pushNamed(context, Routes.cvUpdatePath,arguments: currentUserDetails);},),
      ProfileMenuModel(title: '${AppString.changedPassword}', onTap: () {Navigator.pushNamed(context, Routes.currentPasswordPath,arguments: currentUserDetails.user_Id);},),
      ProfileMenuModel(title: '${AppString.notifications}', onTap: () {Navigator.pushNamed(context, Routes.notificationScreenPath,arguments: currentUserDetails.user_Id);},),
      ProfileMenuModel(title: '${AppString.help}', onTap: () {Navigator.pushNamed(context, Routes.helpFormPath);},),
      ProfileMenuModel(title: '${AppString.delete} ${AppString.account}', onTap: (){customAlertDialog(context: context, title: AppString.deleteTitle,
          onYes: (){
        String Id = currentUserDetails.user_Id;
        DeleteAccount(Id,context);
      }, onNO:() => Navigator.pop(context));},
      )
    ];
  }

  //*********************Private******************end*******//


  //*********************public***************************//
  void _sinkProfileModelMenu(){
    inputProfileMenuList.add(_list);
  }
  //*********************public*******************end******//

}

abstract class ProfileViewModelInput{
  Sink get inputProfileMenuList;

}

abstract class ProfileViewModelOutputs{
  Stream<List<ProfileMenuModel>> get outputProfileMenuList;

}




