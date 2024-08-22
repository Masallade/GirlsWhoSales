import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:girlzwhosell/dawood/domain/bottom_navigation_model.dart';
import 'package:girlzwhosell/model/SavedJobsModel.dart';
import 'package:girlzwhosell/screens/SavedItem_detail.dart';
import 'package:girlzwhosell/utils/constants.dart';
import 'package:girlzwhosell/utils/size_config.dart';
import 'package:http/http.dart' as http;

class AllSavedJobs extends StatefulWidget {
  final CurrentUserDetails currentUserDetails;
  const AllSavedJobs(
      {Key? key,required this.currentUserDetails})
      : super(key: key);

  @override
  _AllSavedJobsState createState() => _AllSavedJobsState(currentUserDetails: currentUserDetails);
}

class _AllSavedJobsState extends State<AllSavedJobs> {
  CurrentUserDetails currentUserDetails;
  bool isloading = false;
  _AllSavedJobsState({required this.currentUserDetails});

  Future<String> loadViewData() async {
    currentUserDetails.savedJobs = await request(context, false);
    return "OK";
  }

  void initState() {
    super.initState();
    print('${currentUserDetails.user_Id}');
    print('uname: ${currentUserDetails.uName}');
    print('Pass${currentUserDetails.password}');
    print('name ${currentUserDetails.firstName}');
    //  appiedDashboadJobs();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: loadViewData(),
        builder: (context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            Container();
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0.0,
                centerTitle: true,
                leading: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    )),
                title: Text(
                  'Saved Jobs',
                  style: TextStyle(
                    color: Colors.black,
                    height: 1.5,
                    fontSize: 20.0,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              body: ListView(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Container(
                      height: SizeConfig.screenHeight! *0.9,
                      child: currentUserDetails.savedJobs == null
                          ? Container(
                              child: Center(
                                child: Text(
                                  'No Saved Jobs',
                                  style: TextStyle(
                                      fontFamily: 'Questrial',
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            )
                          : ListView.builder(
                              itemCount: currentUserDetails.savedJobs!.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              SavedScreenDetailTwo(
                                            savedJobs: currentUserDetails.savedJobs![index],
                                            user_Id: currentUserDetails.user_Id,
                                            uName: currentUserDetails.uName,
                                            password: currentUserDetails.password,
                                            firstName: currentUserDetails.firstName,
                                            cv: currentUserDetails.cv,
                                            resume: currentUserDetails.resumee,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Card(
                                      // color: Colors.yellow,
                                      shape: Border.all(
                                          color: Color.fromRGBO(
                                              238, 242, 248, 1),
                                      ),
                                      elevation: 1.0,
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: ListTile(
                                          leading: Container(
                                            height: 50,
                                            width: 50,
                                            child: Image.network(
                                                currentUserDetails.savedJobs![index].companyLogo!),
                                          ),
                                          title: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 30.0),
                                            child: Text(
                                              '${currentUserDetails.savedJobs![index].title}',
                                              style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 20,
                                                  fontWeight:
                                                      FontWeight.w500),
                                            ),
                                          ),
                                          subtitle: Column(
                                            children: [
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 30.0),
                                                  child: Text(
                                                    '${currentUserDetails.savedJobs![index].companyName}',
                                                    style: TextStyle(
                                                      fontFamily: 'Questrial',
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors
                                                          .blueGrey[300],
                                                      fontSize: 18.0,
                                                      //fontWeight: FontWeight.w700,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 16),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.only(
                                                        left: 30.0),
                                                child: Align(
                                                  alignment:
                                                      Alignment.topLeft,
                                                  child: Text(
                                                    ' \$ ${currentUserDetails.savedJobs![index].minSalary! + '-'}' +
                                                        '\$${currentUserDetails.savedJobs![index].maxSalary! + '/month'}',
                                                    style: TextStyle(
                                                      fontFamily: 'Questrial',
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors
                                                          .blueGrey[300],
                                                      fontSize: 14.0,
                                                      //fontWeight: FontWeight.w700,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                    ),
                  )
                ],
              ),
            );
          } else {
            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 38),
                child: Center(
                  child: isloading
                      ? CircularProgressIndicator(
                          backgroundColor: Colors.red,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.green),
                        )
                      : Text(
                          "Loading ...",
                          style: TextStyle(
                              fontFamily: 'Questrial',
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.pinkAccent),
                        ),
                ),
              ),
            );
          }
        });
  }

  // ignore: missing_return
  Future<List<SavedJobs>?> request(
      BuildContext context, bool showLoading) async {
    String get_key_url =
        "https://girlzwhosellcareerconextions.com/API/fetch_saved_jobs.php?user_id=${currentUserDetails.user_Id}";

    // http.Response response;
    try {
      final GlobalKey<State> _keyLoader = new GlobalKey<State>();

      if (showLoading) showLoadingDialog(context, _keyLoader);

      final http.Response response = await http.get(Uri.parse(get_key_url));
      print("email,${get_key_url}");
      if (showLoading)
        Navigator.of(_keyLoader.currentContext!, rootNavigator: true).pop();

      if (response.statusCode == 200) {
        AllSavedJobss resp = AllSavedJobss.fromJson(json.decode(response.body));
        print(response.statusCode);
        print(response.body);

        if (resp.status == 100) {
          showDialogCustom(
              context,
              "Failed",
              resp.message!.length == 0 ? "record not found" : resp.message,
              "OK");
          return [];
        }
        // totalSavedJobs = resp.savedJobs.length;
        return resp.savedJobs;
      }
    } catch (error) {
      Future.delayed(
          Duration.zero,
          () => dataSuccessfullyLoaded(
              context,
              getTranslated(context, 'Not_Found'),
              getTranslated(context, 'Data_Not_Found'),
              getTranslated(context, 'OK')));
      return [];
    }
  }
}
