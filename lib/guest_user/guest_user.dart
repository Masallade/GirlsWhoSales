import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';

import '../http/Requests.dart';
import '../model/search_model.dart';
import 'dart:convert';

import '../new_widgets/search_widget.dart';
import '../screens/intro_pages/sign_in_page.dart';

class GuestUser extends StatefulWidget {
  const GuestUser({Key? key}) : super(key: key);

  @override
  State<GuestUser> createState() => _GuestUserState();
}

class _GuestUserState extends State<GuestUser> {

  String location = '';
  List<SearchModel> joblist = [];

  bool isLoading = true;
  String dataText = '';

  @override
  void initState() {
    super.initState();
    init();
    // loadData("query");

  }

  Future init() async {
    final search = await loadData(location);
    if (search !=   null){
      setState(() {
        joblist = search;
      });
      // setState(() => this.joblist = search);
    }else{
      print("search result is null");
    }

  }

   Future<List<SearchModel>> loadData(String query) async {
     setState(() {
       isLoading = true;
     });

    final url = "https://girlzwhosellcareerconextions.com/API/jobs_list.php";
     final response = await http.get(Uri.parse(url));
     print("Status Code is: ${response.statusCode}");
     final List data = json.decode(response.body);

    try {

      if (response.statusCode == 200) {


        setState(() {
          dataText = 'loading data successfully';
          isLoading = false;
        });

        print("Response is: ${response.body}");
        return data
            .map((json) => SearchModel.fromJson(json))
            .where((element) {
          final title = element.title ?? '';
          final location = element.location ?? '';
          final searchLower = query.toLowerCase();

          final titleLower = title.toLowerCase();
          final locationLower = location.toLowerCase();

          return titleLower.contains(searchLower) ||
              locationLower.contains(searchLower);
        }).toList();

      }
    } catch (e) {
      print("Error in exception: ${e.toString()}");
      setState(() {
        dataText = 'Error loading data';
        isLoading = false;
      });
    }
     return data
         .map((json) => SearchModel.fromJson(json))
         .where((element) {
       final title = element.title ?? '';
       final location = element.location ?? '';
       final searchLower = query.toLowerCase();

       final titleLower = title.toLowerCase();
       final locationLower = location.toLowerCase();

       return titleLower.contains(searchLower) ||
           locationLower.contains(searchLower);
     }).toList();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Guest User'),
      ),
      body: isLoading
             ? Center(
        child: CircularProgressIndicator(),
      )
             :Column(
        children: [
          // Container(
          //     decoration: BoxDecoration(
          //         color: Colors.pinkAccent[200],
          //         borderRadius: BorderRadius.only(
          //             bottomLeft: Radius.circular(30),
          //             bottomRight: Radius.circular(30))),
          //     child: Column(
          //       children: [
          //         buildSearch(),
          //         buildSearch2(),
          //       ],
          //     )),
          Expanded(
            child: ListView.builder(
                itemCount: joblist != null ? joblist.length : 0,
                // itemCount: joblist.length == null ? 0 : joblist.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: (){
                        Alert(
                          context: context,
                          type: AlertType.info,
                          title: "Login Required",
                          desc: "To View Job Details Please Login!",
                          buttons: [
                            DialogButton(
                              child: Text(
                                "Login",
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                              onPressed: (){
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => SignInPage()));
                              },
                              color: Color.fromRGBO(0, 179, 134, 1.0),//(225, 50, 50, 1.0)
                            ),
                            DialogButton(
                              child: Text(
                                "Cancel",
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                              onPressed: () => Navigator.pop(context),
                              color: Color.fromRGBO(225, 50, 50, 1.0),//(0, 179, 134, 1.0)
                            )
                          ],
                        ).show();
                      },
                      child: buildList(joblist[index]));
                }),
          ),
        ],
      ),
      // body: Center(
      //   child: isLoading
      //       ? CircularProgressIndicator()
      //       : Text(dataText),
      // ),
    );
  }
  Widget buildSearch() => SearchWidget(
    text: location,
    hintText: 'Job Title',
    onChanged: searchData,
  );
  Widget buildSearch2() => SearchWidgettwo(
    text: location,
    hintText: 'Location',
    onChanged: searchData,
  );

  Future searchData(String query) async {
    final search = await Requests.getSearch(query);
    if (!mounted) return;
    setState(() {
      this.location = query;
      this.joblist = search!;
    });
  }

  Widget buildList(SearchModel jobslist) => Padding(
    padding: const EdgeInsets.only(left: 12.0, right: 12.0),
    child: Card(
      child: ListTile(
        leading: Image.network(
          jobslist.companyLogo ?? Placeholder() as String,
          fit: BoxFit.cover,
          width: 50,
          height: 50,
        ),
        title: Align(
            alignment: Alignment.center,
            child: Text(
              jobslist.title ?? " ",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                color: Colors.black,
                fontSize: 16.0,
                //fontWeight: FontWeight.w700,
              ),
            )),
        subtitle: Column(
          children: [
            Text(
              '${jobslist.experience ?? " "}',
              style: TextStyle(
                fontFamily: 'Questrial',
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w400,
                color: Colors.blueGrey,
                fontSize: 14.0,
                //fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '${jobslist.location ?? " "}',
              style: TextStyle(
                fontFamily: 'Questrial',
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w400,
                color: Colors.blueGrey,
                fontSize: 14.0,
                //fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '\$${jobslist.minSalary ?? " " + jobslist.maxSalary! ?? " "}',
              style: TextStyle(
                fontFamily: 'Questrial',
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w400,
                color: Colors.blueGrey,
                fontSize: 14.0,
                //fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
