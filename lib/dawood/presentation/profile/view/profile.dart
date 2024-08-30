import 'package:flutter/material.dart';
import 'package:girlzwhosell/dawood/domain/bottom_navigation_model.dart';
import 'package:girlzwhosell/dawood/domain/profile_menu_model.dart';
import 'package:girlzwhosell/dawood/presentation/common/custom_container_button.dart';
import 'package:girlzwhosell/dawood/presentation/common/custom_exist_alertDialog.dart';
import 'package:girlzwhosell/dawood/presentation/profile/viewmodel/profile_viewmodel.dart';
import 'package:girlzwhosell/dawood/presentation/profile/widgets/profile_drawer.dart';
import 'package:girlzwhosell/dawood/presentation/profile/widgets/profile_header.dart';
import 'package:girlzwhosell/dawood/presentation/profile/widgets/single_menu_element_template.dart';
import 'package:girlzwhosell/dawood/presentation/resources/color_manager.dart';
import 'package:girlzwhosell/dawood/presentation/resources/font_manager.dart';
import 'package:girlzwhosell/dawood/presentation/resources/string_manger.dart';
import 'package:girlzwhosell/dawood/presentation/resources/style_manager.dart';
import 'package:girlzwhosell/dawood/presentation/resources/value_manager.dart';
import 'package:girlzwhosell/screens/intro_pages/sign_in_page.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ProfileView extends StatefulWidget {
  final CurrentUserDetails currentUserDetails;
  ProfileView({Key? key, required this.currentUserDetails}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState(currentUserDetails: currentUserDetails);
}

class _ProfileViewState extends State<ProfileView> {
  final CurrentUserDetails currentUserDetails;
  late ProfileViewModel _viewModel;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  _ProfileViewState({required this.currentUserDetails});


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => customAlertDialog(context: context, title: AppString.logOutTitle, onNO: () {
        Navigator.of(context).pop(false);
      }, onYes: () {
        logOutUser();
        Navigator.push(context, MaterialPageRoute(builder: (context) => SignInPage()));
      }),
      child: Scaffold(

        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(AppString.profile),
        ),
        endDrawer:ProfileDrawer(currentUserDetails: currentUserDetails,),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ProfileHeader(
                context: context,
                currentUserDetails: currentUserDetails,
              ),
            ],
          ),
        ),
        ),

    );
  }


}

