
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//package that we are using to make this class fully functional
// email_validator: ^2.0.1
// slider_captcha: ^0.1.10
// file_picker: ^4.1.4
import 'package:email_validator/email_validator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:slider_captcha/slider_capchar.dart';
import 'package:http/http.dart' as http;
import 'package:slider_captcha/utils/insets.dart';

import 'package:file_picker/file_picker.dart';

import '../../consts/helper.dart';
import '../../helpers/svg/svg.dart';
import '../../model/help_form_model.dart';
import '../../utils/size_config.dart';
import 'package:url_launcher/url_launcher.dart';


class HelpForm extends StatefulWidget {
  @override
  _HelpFormState createState() => _HelpFormState();
}

class _HelpFormState extends State<HelpForm> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController userController = TextEditingController();
  final TextEditingController deviceController = TextEditingController();
  final TextEditingController catagoryController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _issueCategoryList = [
    'Login/Registration',
    'Technical Issues',
    'Billing/Payment',
    'Features/Functionality',
    'Account Management',
    'Content',
    'Accessibility',
    'Feedback/Suggestions',
    'Security/Privacy',
    'Other'
  ];

  late String _name;
  late String _email;
  late String _userId;
  late String _deviceInfo;
  String? _issueCategory;
  late String _issueDescription;
  bool? _privacycheckbox = false;
  bool _captchaValidated = false;

  @override
  void initState() {
    // checklogin();
    super.initState();
  }

  // Future<void> checklogin()async{
  //
  //   // final loginRepo = LoginRepo();
  //   // final loginModel = await loginRepo.getUserLogin('3310664758729', '123456');
  //   // print(loginModel.accessToken);
  //   // print(loginModel.user?.name);
  //   // print(loginModel.user?.role);
  //   // print(loginModel.user?.number);
  //
  //
  //
  // }

  @override
  Widget build(BuildContext context) {
    final SliderController controller = SliderController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              // UpdateNotifiction();
              // UpdateNotifictionColor();
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        title: Text(
          'Help',
          style: TextStyle(
            color: Colors.black,
            height: 1.5,
            fontSize: 20.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Padding(
                padding:
                EdgeInsets.only(top: 12, right: 2, left: 2),
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Field is required';
                    }
                    if (value!= null) {
                      return null;
                    } else {
                      return 'Please enter your name';
                    }
                  },
                  onSaved: (value) {
                    _name = nameController.text;
                  },
                  onChanged: (value) {
                    _name = value;
                  },
                  textAlignVertical: TextAlignVertical.center,
                  textInputAction: TextInputAction.next,
                  style: TextStyle(fontSize: 16,color: Colors.black),
                  cursorColor: Colors.blue,
                  decoration: getInputDecoration(
                    hint: 'Name',
                    errorColor: Colors.red,
                    darkMode: false,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                validator: validateEmail,
                onSaved: (value) {
                  _email = emailController.text;
                },
                onChanged: (value) {
                  _email = value;
                },
                textAlignVertical: TextAlignVertical.center,
                textInputAction: TextInputAction.next,
                style: TextStyle(fontSize: 16,color: Colors.black),
                cursorColor: Colors.blue,
                decoration: getInputDecoration(
                  hint: 'User Email',
                  errorColor: Colors.red,
                  darkMode: false,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                keyboardType: TextInputType.name,
                controller: userController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Field is required';
                  }
                  if (value!= null) {
                    return null;
                  } else {
                    return 'Please enter your user name';
                  }
                },
                onSaved: (value) {
                  _userId = userController.text;
                },
                onChanged: (value) {
                  _userId = value;
                },
                textAlignVertical: TextAlignVertical.center,
                textInputAction: TextInputAction.next,
                style: TextStyle(fontSize: 16,color: Colors.black),
                cursorColor: Colors.blue,
                decoration: getInputDecoration(
                  hint: 'User Name',
                  errorColor: Colors.red,
                  darkMode: false,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                keyboardType: TextInputType.name,
                controller: deviceController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Field is required';
                  }
                  if (value!= null) {
                    return null;
                  } else {
                    return 'Please enter your Device Info';
                  }
                },
                onSaved: (value) {
                  _deviceInfo = deviceController.text;
                },
                onChanged: (value) {
                  _deviceInfo = value;
                },
                textAlignVertical: TextAlignVertical.center,
                textInputAction: TextInputAction.next,
                style: TextStyle(fontSize: 16,color: Colors.black),
                cursorColor: Colors.blue,
                decoration: getInputDecoration(
                  hint: 'Device infomation',
                  errorColor: Colors.red,
                  darkMode: false,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              DropdownButtonFormField<String>(
                value: _issueCategory,
                decoration: getInputDecoration(
                  hint: 'Select Catagory',
                  errorColor: Colors.red,
                  darkMode: false,
                ),
                items: _issueCategoryList
                    .map((issueCategory) =>
                    DropdownMenuItem(
                        value: issueCategory, child: Text(issueCategory)))
                    .toList(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select an issue category';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _issueCategory = value;
                  });
                },
                onSaved: (value) {
                  _issueCategory = value;
                },
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: descriptionController,
                decoration: getInputDecoration(
                  hint: 'Description',
                  errorColor: Colors.red,
                  darkMode: false,
                ),
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description of your issue';
                  }
                  return null;
                },
                onSaved: (value) {
                  _issueDescription = descriptionController.text;
                },
                onChanged: (value){
                  _issueDescription = value;
                },
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: <Widget>[
                  Checkbox(
                      value: _privacycheckbox,
                      onChanged: (value) {
                        setState(() {
                          _privacycheckbox = value;
                        });
                      }
                  ),
                  GestureDetector(
                    onTap: () async{

                      //final url = 'https://biitsolutions.co.uk/girlzwhosell/policy';
                      final url = 'https://girlzwhosellcareerconextions.com/policy';
                      final uri = Uri.parse(url);
                      if (await canLaunchUrl(uri)){
                        await launchUrl(uri);
                      }else{
                        throw 'Could nott launch $url';
                      }


                        print('accepted privacy policy');
                    },
                      child: Text("Accept Our Privacy Policy",style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),)),
                ],),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50.0, right: 50.0,),
                child: SliderCaptcha(
                    controller: controller,
                    image: Image.asset(
                      'assets/rsz_girl.jpg',
                      fit: BoxFit.fitWidth,
                    ),
                    title: 'Slide to authenticate',
                    titleStyle: TextStyle(
                      fontFamily: 'Poppins',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 17.0,
                      //fontWeight: FontWeight.w700,
                    ),
                    colorBar: Color.fromRGBO(1, 82, 174, 1),
                    colorCaptChar: Color.fromRGBO(1, 82, 174, 1),
                    onConfirm: (value) async {
                      debugPrint(value.toString());
                      if(value){
                        _captchaValidated =  value;
                      }else{
                        _captchaValidated = value;
                      }
                      // return await Future.delayed(const Duration(seconds: 5)).then(
                      //       (value) {
                      //     controller.create.call();
                      //   },
                      // );
                    },
                    // captchaSize: 50,

                  ),
              ),
              SizedBox(
                height: 15,
              ),

              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: Container(
                  width: SizeConfig.screenWidth,
                  height: 55.0,
                  decoration: BoxDecoration(
                    // color:  Colors.red[100],
                    color: Color.fromRGBO(1, 82, 174, 1),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      uploadfile();
                    },
                    child: ListTile(
                      title: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            'Upload File (Optional)',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 17.0,
                              //fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 15,
              ),

              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: Container(
                  width: SizeConfig.screenWidth,
                  height: 55.0,
                  decoration: BoxDecoration(
                    // color:  Colors.red[100],
                    color: Color.fromRGBO(1, 82, 174, 1),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate() ) {

                        if (!_privacycheckbox! && _captchaValidated){
                          FlutterToastMsg('Please Accept Our Privacy Policy.');
                        } else if (!_captchaValidated && _privacycheckbox!){
                          FlutterToastMsg('Please Fill The Captcha.');
                        }else if (!_captchaValidated && !_privacycheckbox!){
                          FlutterToastMsg('Please Accept Our Privacy Policy and Fill the Captcha.');
                        }else{

                          postHelpForm();
                          Navigator.of(context).pop();
                        }


                        print("form is validatetd");
                      } else {
                        FlutterToastMsg('Please Fill All the Fields Properly Thank You!');
                        // At least one field is invalid, do not submit the form
                        print("form is not validatetd");
                      }
                    },
                    child: ListTile(
                      title: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            'Submit Form',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 17.0,
                              //fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? validateEmail(String? value) {

    if (value == null ||  value.isEmpty) {
      return 'Email is required';
    } else if (!EmailValidator.validate(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  void FlutterToastMsg(String message){
    Fluttertoast.showToast(
        msg: message,
        // toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }


  String filePath = "";
  Future uploadfile() async {

    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null){
      File file = File(result.files.single.path ?? "");

      String fileName = file.path.split('/').last;
      filePath = file.path;
    }

  }


  HelpForm_Model helpForm = HelpForm_Model();

  Future<HelpForm_Model> postHelpForm() async{
    var headers = {
      'Cookie': 'cf_use_ob=0'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://girlzwhosellcareerconextions.com/API/help_form.php'));
    request.fields.addAll({
      'name ': _name,
      'email': _email,
      'username': _userId,
      'device_info': _deviceInfo,
      'issue_catagory': _issueCategory!,
      'issue_description': _issueDescription,
    });

    if(filePath  !=  null && filePath != '' )
    {
      request.files.add(await http.MultipartFile.fromPath('attachment', filePath));
    }


    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      FlutterToastMsg('Form Submitted Successfully!');
      // FlutterToastMsg('File Uploaded Successfully!');
      print ('file uplaoded successfully');
      print(await response.stream.bytesToString());
    }
    else {
      FlutterToastMsg('Server Error Please Try Again Later!');
      print(response.reasonPhrase);
    }

    return helpForm;
  }


}
