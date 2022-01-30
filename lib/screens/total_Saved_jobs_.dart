// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:qjobs/model/SavedJobsModel.dart';
// import 'package:qjobs/model/login_model.dart';
// import 'package:qjobs/screens/SavedItem_detail.dart';
// import 'package:qjobs/utils/constants.dart';
// import 'package:qjobs/utils/size_config.dart';
// import 'package:http/http.dart'as http;
//
// class SavedJobss extends StatefulWidget {
//   final user_id;
//   final List<SavedJobs> savedjobs;
//   const SavedJobss({Key key, this.user_id,this.savedjobs}) : super(key: key);
//
//   @override
//   _SavedJobssState createState() =>
//       _SavedJobssState(user_id: user_id , savedjobs: savedjobs);
// }
//
// class _SavedJobssState extends State<SavedJobss> {
//   final user_id;
//   final List<SavedJobs> savedjobs;
//   _SavedJobssState({this.user_id,this.savedjobs});
//  // AllSavedJobss allSavedJobs = AllSavedJobss();
//   @override
//   void initState(){
//     super.initState();
//     userSavedjobs();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0.0,
//         centerTitle: true,
//         leading: IconButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             icon: Icon(
//               Icons.arrow_back_ios,
//               color: Colors.black,
//             )),
//         title: Text(
//           'Saved Jobs',
//           style: TextStyle(
//             color: Colors.black,
//             height: 1.5,
//             fontSize: 20.0,
//             fontFamily: 'Poppins',
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//       ),
//       body: ListView(
//         children: [
//           SingleChildScrollView(
//             scrollDirection: Axis.vertical,
//             child: Container(
//               height: SizeConfig.screenHeight,
//               child: ListView.builder(
//                   itemCount: allSavedJobs.savedJobs.length,
//                   itemBuilder: (context, index) {
//                     return Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Container(
//                         padding: EdgeInsets.only(top: 20),
//                         height: 200,
//                         width: 300,
//                         decoration: BoxDecoration(
//                           //  border: Border.all(color: Colors.grey[300]),
//                         ),
//                         child: GestureDetector(
//                           onTap: (){
//                             setState(() {
//
//                             });
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) =>  SavedScreenDetailTwo(user_Id:user_id ,savedJobs: allSavedJobs.savedJobs[index],),
//                               ),
//                             );
//                           },
//                           child: Card(
//                             shape: Border(left: BorderSide(color: Colors.pinkAccent[200], width: 5)),
//                             elevation: 1.0,
//                             child: Padding(
//                               padding: const EdgeInsets.all(20.0),
//                               child: ListTile(
//                                 // leading: Container(
//                                 //   height: 50,
//                                 //   width: 50,
//                                 //     child: Image.network('${base_Url + jobDetails[index].company_logo == null ? '' :base_Url + jobDetails[index].company_logo }')),
//                                 title: Padding(
//                                   padding: const EdgeInsets.only(left: 10.0),
//                                   child: Text(
//                                     '${allSavedJobs.savedJobs[index].title}',
//                                     style: TextStyle(
//                                       fontFamily: 'Poppins',
//                                       fontStyle: FontStyle.normal,
//                                       fontWeight: FontWeight.w600,
//                                       color: Colors.black,
//                                       fontSize: 20.0,
//                                       //fontWeight: FontWeight.w700,
//                                     ),
//                                   ),
//                                 ),
//                                 subtitle: Column(
//                                   children: [
//                                     SizedBox(
//                                       height: 10,
//                                     ),
//                                     Text(
//                                       '${allSavedJobs.savedJobs[index].companyName}',
//                                       style: TextStyle(
//                                         fontFamily: 'Questrial',
//                                         fontStyle: FontStyle.normal,
//                                         fontWeight: FontWeight.w500,
//                                         color: Colors.black,
//                                         fontSize: 20.0,
//                                         //fontWeight: FontWeight.w700,
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       height: 20,
//                                     ),
//                                     Text(
//                                       '\$${allSavedJobs.savedJobs[index].minSalary + '-'}' + '\$${allSavedJobs.savedJobs[index].maxSalary + '/month'}',
//                                       style: TextStyle(
//                                         fontFamily: 'Questrial',
//                                         fontStyle: FontStyle.normal,
//                                         fontWeight: FontWeight.w500,
//                                         color: Colors.black,
//                                         fontSize: 20.0,
//                                         //fontWeight: FontWeight.w700,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     );
//                   }),
//             ),
//           )
//         ],
//       ),
//     );
//   }
//   Future<AllSavedJobss> userSavedjobs() async {
//
//     final url = "https://biitsolutions.co.uk/girlzwhosell/API/fetch_saved_jobs.php?user_id=${user_id}";
//     try {
//       final response = await http.get(Uri.parse(url));
//       if (response.statusCode == 200) {
//         print("Response is: ${response.body}");
//         print("Status Code is: ${response.statusCode}");
//         allSavedJobs = AllSavedJobss.fromJson(json.decode(response.body));
//         return allSavedJobs;
//       }
//     } catch (e) {
//       print("Error in exception::: ${e.toString()}");
//     }
//   }
// }