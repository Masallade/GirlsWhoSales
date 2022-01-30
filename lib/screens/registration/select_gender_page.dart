import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:girlzwhosell/screens/registration/more_info.dart';
import 'package:girlzwhosell/utils/constants.dart';
import 'package:girlzwhosell/utils/size_config.dart';
import 'package:girlzwhosell/utils/strings.dart';


class SelectGender extends StatefulWidget {
  @override
  _SelectGenderState createState() => _SelectGenderState();
}

class _SelectGenderState extends State<SelectGender> {
  List<String> _selectGender = ['♂ Male', '♀ Female', ' ⚧  Other'];
  int _defaultChoiceIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _defaultChoiceIndex = 0;
  }

  Widget selectGender() {
    return Expanded(
      child: ListView.builder(
          itemCount: _selectGender.length,
          itemBuilder: (BuildContext context, int index) {
            return Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    width: SizeConfig.screenWidth,
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(left: 25.0,right: 25.0,top: 5.0,bottom: 5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        ChoiceChip(
                          label: Container(
                            width: SizeConfig.screenWidth,
                            child: Text(
                              _selectGender[index],
                              style: TextStyle(color: Colors.white, fontSize: 25.0),
                            ),
                          ),
                          backgroundColor: Colors.black26,
                          padding: EdgeInsets.all(15.0),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                          selected: _defaultChoiceIndex == index,
                          selectedColor: Theme.of(context).primaryColor,
                          onSelected: (bool selected) {
                            setState(() {
                              _defaultChoiceIndex = selected ? index : 0;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      //resizeToAvoidBottomPadding: false,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: <Widget>[
            BackgroundWidget(size: size),
            BackButtonPop(),
            SizedBox(
              height: 5.0,
            ),
            Container(
              alignment: Alignment.center,
              height: size.height,
              width: size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0, right: 50.0,top: 70.0),
                    child: LinearProgressIndicator(
                      backgroundColor: Color(0xFFD7D7D7),
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                      value: 0.7,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:15.0),
                    child: PageTitle(
                      titleText: Strings.titleText5,
                      fontSize: 25.0,
                    ),
                  ),
                  selectGender(),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: floatingActionButtonNext(
            context, MaterialPageRoute(builder: (context) => MoreInfo())),
      ),
      //bottomNavigationBar: BottomInfoBar(),
    );
  }
}
