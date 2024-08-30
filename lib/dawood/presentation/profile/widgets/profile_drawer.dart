import 'package:flutter/material.dart';
import 'package:girlzwhosell/dawood/domain/bottom_navigation_model.dart';
import 'package:girlzwhosell/dawood/domain/profile_menu_model.dart';
import 'package:girlzwhosell/dawood/presentation/common/custom_container_button.dart';
import 'package:girlzwhosell/dawood/presentation/common/custom_exist_alertDialog.dart';
import 'package:girlzwhosell/dawood/presentation/profile/viewmodel/profile_viewmodel.dart';
import 'package:girlzwhosell/dawood/presentation/profile/widgets/single_menu_element_template.dart';
import 'package:girlzwhosell/dawood/presentation/resources/color_manager.dart';
import 'package:girlzwhosell/dawood/presentation/resources/string_manger.dart';
import 'package:girlzwhosell/dawood/presentation/resources/value_manager.dart';
import 'package:girlzwhosell/screens/intro_pages/sign_in_page.dart';

class ProfileDrawer extends StatefulWidget {
  final CurrentUserDetails currentUserDetails;

  const ProfileDrawer({Key? key, required this.currentUserDetails})
      : super(key: key);

  @override
  State<ProfileDrawer> createState() =>
      _ProfileDrawerState(currentUserDetails: currentUserDetails);
}

class _ProfileDrawerState extends State<ProfileDrawer> {
  final CurrentUserDetails currentUserDetails;
  late ProfileViewModel _viewModel;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  _ProfileDrawerState({required this.currentUserDetails});
  @override
  void initState() {
    super.initState();
    _initializeViewModel();
  }

  void _initializeViewModel() {
    _viewModel = ProfileViewModel(currentUserDetails: currentUserDetails);
    _viewModel.start(context);
  }

  void _resetStreamIfNeeded() {
    _viewModel.dispose();
    _initializeViewModel(); // Reinitialize to reset stream
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
        onPointerUp: (PointerUpEvent event) {
// Reset the stream only when the drawer closes
          if (!_scaffoldKey.currentState!.isEndDrawerOpen) {
            _resetStreamIfNeeded();
          }
        },
        child: Drawer(
          backgroundColor: ColorManager.white,
          child: Column(
            children: [
              StreamBuilder(
                stream: _viewModel.outputProfileMenuList,
                builder: (context, snapshot) {
                  if (snapshot.hasData &&
                      snapshot.data != null &&
                      snapshot.data is List<ProfileMenuModel>) {
                    List<ProfileMenuModel> menu =
                        snapshot.data as List<ProfileMenuModel>;
                    return Container(
                      height: MediaQuery.of(context).size.height * .5,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        itemCount: menu.length,
                        itemBuilder: (context, listSnapshot) {
                          return singleMenuElement(menu[listSnapshot].title,
                              menu[listSnapshot].onTap);
                        },
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text('${AppString.error}: ${snapshot.error}');
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
              SizedBox(height: AppSize.s10),
              customContainerButton(AppString.logOut, () {
                customAlertDialog(
                    context: context,
                    title: AppString.logOutTitle,
                    onNO: () {
                      Navigator.of(context).pop(false);
                    },
                    onYes: () {
                      logOutUser();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignInPage()));
                    });
              }),
            ],
          ),
        ));
  }
}
