import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:girlzwhosell/screens/intro_pages/webview_for_employer_login.dart';
import 'package:girlzwhosell/screens/registration/superPowerPage.dart';
import 'package:girlzwhosell/utils/constants.dart';
import 'package:girlzwhosell/utils/constants2.dart';
import 'package:girlzwhosell/utils/size_config.dart';

class UserType extends StatefulWidget {
  int jobType;
  UserType({this.jobType});
  @override
  _UserTypeState createState() => _UserTypeState(jobType: jobType);
}

class _UserTypeState extends State<UserType> {
  int jobType;
  String _text = 'Hello!';
  String _text2 = 'Hi! Welcome to';
  String _text3 = 'Girlz Who Sell Career Conextions!';
  String _text4 = '';
  Color Color1 = Colors.blueGrey[300];
  // Color Color1 = Color.fromARGB(255, 112, 126, 148);
  void _doSomething() {
    setState(() {
      _text = 'Hello There!';
      _text2 = 'Welcome to career Conextions.';
      _text3 = 'Let\'s get you started!';
      _text4 = 'Are you a ..';
      // isSelected = true;
    });
  }

  TextEditingController textInputController = TextEditingController();

  List<String> _selectWhoYouAre = [
    'Job Seeker',
    'Mentor/Mentee',
    'Hiring',
  ];

  int selected = -1;

  GlobalKey<FormState> _formKey = GlobalKey();
  _UserTypeState({this.jobType});

  @override
  Widget build(BuildContext context) {
    var n = 3;
    var listOfContainers = <Padding>[];
    var list = List<int>.generate(n, (i) => i + 0);
    list.forEach((i) {
      Color borderColor = (i == selected)
          ? Color.fromRGBO(1, 82, 174, 1)
          : Color.fromRGBO(220, 225, 234, 1);
      return listOfContainers.add(
        Padding(
            padding: const EdgeInsets.only(
              left: 12,
              right: 12,
              top: 16,
            ),
            child: InkWell(
              onTap: () {
                setState(() {
                  selected = i;
                  print(i);
                });
                _doSomething();
                if(selected == 2){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>WebViewClass()));
                }
              },
              child: Container(
                width: 335,
                height: 56,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 2, color: borderColor),
                    borderRadius: const BorderRadius.all(Radius.circular(5))),
                child: ListTile(
                  title: Text(
                    '${_selectWhoYouAre[i]}',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Questrial',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400),
                  ),
                  trailing: selected == i
                      ? Icon(
                          Icons.check,
                          color: Color.fromRGBO(117, 162, 66, 1),
                        )
                      : null,
                ),
              ),
            )),
      );
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 30.0,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 27.5, right: 27.5),
                  child: Image.asset(
                    'assets/images/logo.png',
                    scale: 2.5,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 35.0),
                  child: Text(_text, style: HeadingStyle),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                    alignment: Alignment.center,
                    child: Text(_text2, style: subtitleStyle)),
                SizedBox(
                  height: 5,
                ),
                Text(_text3, style: subtitleStyle),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(_text4,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Colors.black,
                              fontFamily: 'Questrial'))),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: listOfContainers,
                ),
                SizedBox(height: 28),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(SizeConfig.screenWidth, 60.0),
                          primary: Color.fromARGB(255, 255, 65, 129),
                          //onSurface:  Colors.pinkAccent[200],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                      child: Text(
                        'Next',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.0,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SuperPowerPage()));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Please Select any type')));
                        }
                      }),
                ),
                SizedBox(
                  height: 26,
                ),
                Text("Terms & Conditions", style: TermsCondition),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// return Scaffold(
//   appBar: AppBar(
//     backgroundColor: Colors.transparent,
//     elevation: 0,
//     leading: IconButton(
//       onPressed: () {
//         Navigator.of(context).pop();
//       },
//       icon: Icon(Icons.arrow_back,color: Colors.black,size: 30.0,),
//     ),
//   ),
//   body: GestureDetector(
//     onTap: () => FocusScope.of(context).unfocus(),
//     child: SingleChildScrollView(
//       physics: AlwaysScrollableScrollPhysics(),
//       child: Column(
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.only(left: 27.5,right: 27.5),
//             child: Image.asset(
//               'assets/images/logo.png',
//               scale: 2.5,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 35.0),
//             child: Text(_text, style: HeadingStyle),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Align(
//               alignment: Alignment.center,
//               child: Text(_text2, style: subtitleStyle)),
//           SizedBox(
//             height: 5,
//           ),
//           Text(_text3, style: subtitleStyle),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 children: <Widget>[
//                   SizedBox(
//                     height: 30,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 12.0 , right: 12.0),
//                     child: Align(
//                         alignment: Alignment.topLeft,
//                         child: Text(_text4,
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w400,
//                                 fontSize: 15,
//                                 fontFamily: 'Questrial'))),
//                   ),
//                   SizedBox(
//                     height: 16,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 12.0 , right: 12.0),
//                     child: Container(
//                       width: SizeConfig.screenWidth,
//                       height: 60.0,
//                       decoration: BoxDecoration(
//                           boxShadow: [
//                             BoxShadow(
//                               color: isSelected
//                                   ? Colors.blue[800]
//                                   : Colors.blue[50],
//                               blurRadius: 4,
//                               offset: Offset(0, 0), // Shadow position
//                             ),
//                           ],
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(5.0),
//                           border: Border.all(color: Color1.withOpacity(0.6))),
//                       child: GestureDetector(
//                         onTap: () {
//                           _doSomething();
//                         },
//                         child: ListTile(
//                           // leading:  Radio(
//                           //   value: 0,
//                           //   groupValue: _radioValue,
//                           //   onChanged: _handleRadioValueChange,
//                           // ),
//                           title: Padding(
//                             padding: const EdgeInsets.only(left: 24.0 ,top: 16.0,bottom: 16.0,right: 95.0),
//                             child: Text(
//                               'Job Seeker',
//                               style: TextStyle(
//                                 fontFamily: 'Poppins',
//                                 fontWeight: FontWeight.w400,
//                                 color: Colors.black
//                               ),
//                             ),
//                           ),
//                           trailing: isSelected
//                               ? Icon(
//                                   Icons.check,
//                                   color: Colors.green,
//                                 )
//                               : null,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 16,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 12.0 , right: 12.0),
//                     child: Container(
//                       width: SizeConfig.screenWidth,
//                       height: 60.0,
//                       decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(5.0),
//                           border: Border.all(
//                               color: Colors.blueGrey[
//                                   300].withOpacity(0.6))), //color: Color.fromARGB(255, 112, 126, 148),)),
//                       child: GestureDetector(
//                         onTap: () {
//                           //_doSomethingtwo( );
//                         },
//                         child: ListTile(
//                           // leading: new Radio(
//                           //   value: 1,
//                           //   groupValue: _radioValue,
//                           //   onChanged: _handleRadioValueChange,),
//                           title: Padding(
//                             padding: const EdgeInsets.only(left: 24.0 ,top: 16.0,bottom: 16.0,right: 95.0),
//                             child: Text(
//                               'Mentor/Mentee',
//                                style: TextStyle(
//                                 fontFamily: 'Poppins',
//                                 fontWeight: FontWeight.w400,
//                                 color: Colors.black
//                             ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 16,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 12.0 , right: 12.0),
//                     child: Container(
//                       //key: IsBox3,
//                       width: SizeConfig.screenWidth,
//                       height: 60.0,
//                       decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(5.0),
//                           border:
//                               Border.all(color: Colors.blueGrey[300].withOpacity(0.6))),
//                       child: GestureDetector(
//                         onTap: () {
//                           print('tapping');
//             Navigator.push(context, MaterialPageRoute(builder: (context)=>WebViewClass()));
//
//                         },
//                         child: ListTile(
//                           // leading: new Radio(
//                           //   value: 2,
//                           //   groupValue: _radioValue,
//                           //   onChanged: _handleRadioValueChange,
//                           // ),
//                           title: Padding(
//                             padding: const EdgeInsets.only(left: 24.0 ,top: 16.0,bottom: 16.0,right: 95.0),
//                             child: Text(
//                               'Hiring',
//                               style: TextStyle(
//                                   fontFamily: 'Poppins',
//                                   fontWeight: FontWeight.w400,
//                                   color: Colors.black
//                               ),
//                             ),
//                           ),
//                           // trailing: isSelected ==true
//                           //     ? Icon(
//                           //   Icons.check,
//                           //   color: Colors.green,
//                           // )
//                           //     : null,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 28,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 12.0 , right: 12.0),
//                     child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                             fixedSize:
//                                 Size(SizeConfig.screenWidth, 60.0),
//                             primary:
//                                 Color.fromARGB(255, 255, 65, 129),
//                             //onSurface:  Colors.pinkAccent[200],
//                             shape: RoundedRectangleBorder(
//                                 borderRadius:
//                                     BorderRadius.circular(5.0))),
//                         child: Text(
//                           'Next',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 17.0,
//                             fontFamily: 'Poppins',
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         onPressed: () {
//                           if (_formKey.currentState.validate()) {
//                             _formKey.currentState.save();
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) =>
//                                         SuperPowerPage()));
//                           } else {
//                             ScaffoldMessenger.of(context)
//                                 .showSnackBar(SnackBar(
//                                     content: Text(
//                                         'Please Select any type')));
//                           }
//                         }),
//                   ),
//                   SizedBox(
//                     height: 26,
//                   ),
//                   Text("Terms & Conditions", style: TermsCondition),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//   ),
// );
//
