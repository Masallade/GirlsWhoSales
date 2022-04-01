import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:girlzwhosell/model/jobtitle_model.dart';
import 'package:girlzwhosell/screens/registration/job-type.dart';
import 'package:girlzwhosell/utils/constants2.dart';
import 'package:girlzwhosell/utils/size_config.dart';
import 'package:multi_select_flutter/bottom_sheet/multi_select_bottom_sheet_field.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:http/http.dart'as http;



class Animal {
  final int id;
  final String name;

  Animal({
    this.id,
    this.name,
  });
}

// ignore: must_be_immutable
class SuperPowerPage extends StatefulWidget {
  List<superPowerModel> selecjobsTypes = [];
 final String Button;
  SuperPowerPage({Key key ,this.selecjobsTypes,this.Button}) : super(key: key);

  @override
  _SuperPowerPageState createState() => _SuperPowerPageState(selecjobsTypes: selecjobsTypes, Button: Button);
}

class _SuperPowerPageState extends State<SuperPowerPage> {

  List<superPowerModel> selecjobsTypes = [];
  String Button ='';
  _SuperPowerPageState({this.selecjobsTypes,this.Button});

  static List<superPowerModel> _data = [];
  Future<List<superPowerModel>> getProvinceList() async {

    final response = await http.get(Uri.parse("https://biitsolutions.co.uk/girlzwhosell/API/categories.php"));

   setState(() {
     _data = parseProvinces(response.body);
   });
    print('category response${response.body}');
    return parseProvinces(response.body);
  }
  List<superPowerModel> parseProvinces(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<superPowerModel>((json) => superPowerModel.fromJson(json)).toList();
  }

  @override
  void initState() {
    getProvinceList();
   // print('${_data.length}');
    super.initState();
  }

  final _multiSelectKey = GlobalKey<FormFieldState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios,color: Colors.black,size: 30.0,),
        ),
      ) ,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 27.5,right: 27.5),
              child: Image.asset(
                'assets/images/logo.png',
                scale: 2.7,
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 45.0),
                  child: LinearProgressIndicator(
                    minHeight: 10.0,
                    backgroundColor: Colors.grey[300],
                    valueColor:
                    AlwaysStoppedAnimation<Color>(Colors.blue[800]),
                    value: 0.2,
                  ),
                ),
                SizedBox(height: 5,),
                Padding(
                  padding: const EdgeInsets.only(left: 280.0),
                  child: Text('15%' , textAlign: TextAlign.end, style: TextStyle(color: Colors.blueGrey[300] , fontFamily: 'Poppins' , fontWeight: FontWeight.w600),   ),
                ),
              ],
            ),
            SizedBox(
              height: 37,
            ),
            Text(
                'Great! Just a few \n more steps to go!',
                overflow: TextOverflow.visible,
            textAlign: TextAlign.center,
                style: HeadingStyle),
            SizedBox(
              height: 20,
            ),
            Text('Please answer the following questions to\n proceed to registration.',
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center,
                style: subtitleStyle),
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: Text(
                      "What's your superpower?",
                      overflow: TextOverflow.visible,
                      textAlign: TextAlign.start,
                    style: TextStyle(
                      height: 1.5,
                      fontSize: 16.0,
                      fontFamily: 'Questrial',
                      fontWeight: FontWeight.w400,
                      color: Colors.black
                    ),),

                ),
                SizedBox(width: 14,),
                Image.asset('assets/images/heart.png'),
              ],
            ),
        SizedBox(height: 16,),
          //  buildFilterChips(),
            Padding(
              padding: const EdgeInsets.only(left: 24.0 ,right: 24.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    MultiSelectBottomSheetField<superPowerModel>(
                     checkColor: Colors.pinkAccent,
                      backgroundColor: Colors.white,
                      cancelText:Text('Cancel' , style: TextStyle(
                       fontFamily: 'Poppins',
                       fontStyle: FontStyle.normal,
                       fontWeight: FontWeight.w600,
                       color: Colors.pinkAccent[200],
                       fontSize: 24.0,

                     ),),
                      autovalidateMode: AutovalidateMode.always,
                      confirmText: Text('ok' , style: TextStyle(
                            fontFamily: 'Poppins',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                          color: Colors.pinkAccent[200],
                            fontSize: 24.0,
                      ),),
                       initialValue: selecjobsTypes,
                       key: _multiSelectKey,
                       initialChildSize: 0.7,
                       maxChildSize: 0.95,
                       title: Text("Job Categories" , style: TextStyle(
                         fontFamily: 'Poppins',
                         fontStyle: FontStyle.normal,
                         fontWeight: FontWeight.w500,
                         color: Colors.black,
                         fontSize: 17.0,
                         //fontWeight: FontWeight.w700,
                       ),),
                       buttonText: Text('Job Categories', style: TextStyle(
                         fontFamily: 'Poppins',
                         fontStyle: FontStyle.normal,
                         fontWeight: FontWeight.w500,
                         color: Colors.black,
                         fontSize: 17.0,
                         //fontWeight: FontWeight.w700,
                       ),),

                       items: _data.map((item) => MultiSelectItem<superPowerModel>(item, item.name)).toList(),
                       searchable: true,

                      validator: (values) {
                        if (values == null || values.isEmpty) {
                          return "Select Only Three";
                        }
                        return null;
                      },
                       onConfirm: (values) {
                         setState(() {
                           selecjobsTypes = values;
                         });
                        print('selected : ${selecjobsTypes}');
                         selecjobsTypes.forEach((item) {
                           print("${item.id} ${item.name}");
                           Button = "${Button ?? " "} ${item.name}";
                         });
                         _multiSelectKey.currentState.validate();
                       },
                       chipDisplay: MultiSelectChipDisplay(
                         chipColor: Colors.pinkAccent[200],
                         textStyle: TextStyle(
                           fontFamily: 'Questrial',
                           fontSize: 16,
                           fontWeight: FontWeight.w400,
                           fontStyle: FontStyle.normal,
                           color: Colors.white,
                         ),
                         scrollBar: HorizontalScrollBar(
                           isAlwaysShown: true
                         ),
                         onTap: (item) {
                           setState(() {
                             selecjobsTypes.remove(item);
                           });
                            print('removed : ${selecjobsTypes}');
                           _multiSelectKey.currentState.validate();
                         },
                       ),
                     ),
                  ],
                ),
              ),
              ),
            SizedBox(height: 70,),
            Padding(
              padding: const EdgeInsets.only(left: 20.0 , right: 20.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize:
                    Size(SizeConfig.screenWidth, 60.0),
                    primary: Color.fromARGB(255, 255, 65, 129),
                    //onSurface:  Colors.pinkAccent[200],
                    shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(5.0))),
                child: Text(
                  'Next',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.0,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,),
                ),
                onPressed:() {
                  if( _multiSelectKey.currentState.validate()){
                    _multiSelectKey.currentState.save();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => JobType(selecjobsTypes: selecjobsTypes,Button:Button)));
                 }else{
                    return SnackBar(content: Text('Please Select Categories To Proceed Next'));
                 }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


