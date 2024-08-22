import 'package:flutter/material.dart';
import 'package:girlzwhosell/dawood/domain/bottom_navigation_model.dart';
import 'package:girlzwhosell/dawood/domain/profile_menu_model.dart';
import 'package:girlzwhosell/dawood/presentation/common/custom_container_button.dart';
import 'package:girlzwhosell/dawood/presentation/common/custom_exist_alertDialog.dart';
import 'package:girlzwhosell/dawood/presentation/profile/viewmodel/profile_viewmodel.dart';
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
  _ProfileViewState createState() =>
      _ProfileViewState(currentUserDetails: currentUserDetails);
}

class _ProfileViewState extends State<ProfileView> {
  final CurrentUserDetails currentUserDetails;
  _ProfileViewState({required this.currentUserDetails});
  late ProfileViewModel _viewModel;

  late SharedPreferences logindata;
  String? username;

  @override
  void initState() {
    super.initState();
    _viewModel = ProfileViewModel(currentUserDetails: currentUserDetails);
    _viewModel.start(context);
    print('${currentUserDetails.firstName}');
    print('${currentUserDetails.nationality}');
    print('${currentUserDetails.profile}');
    print('${currentUserDetails.title}');
    print('${currentUserDetails.user_Id}');
    print('${currentUserDetails.uName}');
    print('${currentUserDetails.password}');
    //  getUserData();
  }

  void getUserData() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata.getString('username');
    });
  }

  @override
  Widget build(BuildContext context) {
    // SizeConfig().init(context);
    return WillPopScope(
      onWillPop: () => customAlertDialog(context:context,title:AppString.logOutTitle,onNO: () {
        Navigator.of(context).pop(false);},
          onYes: () {
            logOutUser();
            Navigator.push(context, MaterialPageRoute(builder: (context) => SignInPage())); }),
      child: Scaffold(
        backgroundColor: ColorManager.white,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: AppSize.s10,
              ),
              ProfileHeader(
                  context: context,
                  image: currentUserDetails.profile ?? "",
                  name: currentUserDetails.firstName ?? "",
                  title: currentUserDetails.title ?? ""),
              SizedBox(
                height: AppSize.s10,
              ),
              StreamBuilder(
                  stream: _viewModel.outputProfileMenuList,
                  builder: (context, snapShot) {
                    if (snapShot.hasData &&
                        snapShot.data != null &&
                        snapShot.data is List<ProfileMenuModel>) {
                      List<ProfileMenuModel> menu =
                          snapShot.data as List<ProfileMenuModel>;
                      return Container(
                        height: MediaQuery.of(context).size.height * .5,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                            itemCount: menu.length,
                            itemBuilder: (context, listSnapShot) {
                              return singleMenuElement(menu[listSnapShot].title,
                                  menu[listSnapShot].onTap);
                            }),
                      );
                    } else if (snapShot.hasError) {
                      return Text('${AppString.error}: ${snapShot.error}');
                    } else {
                      return CircularProgressIndicator();
                    }
                  }),
              customContainerButton(AppString.logOut, () {customAlertDialog(context:context, title: AppString.logOutTitle,onNO: () {
                Navigator.of(context).pop(false);},
                  onYes: () {
                logOutUser();
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignInPage())); });})

            ],
          ),
        ),
      ),
    );
  }








}

