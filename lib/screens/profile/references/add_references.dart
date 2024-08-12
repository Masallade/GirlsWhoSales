import 'package:flutter/material.dart';
import 'package:girlzwhosell/screens/profile/references/references_null.dart';
import 'package:girlzwhosell/utils/constants.dart';
import 'package:girlzwhosell/utils/strings.dart';
import 'package:girlzwhosell/widgets/header.dart';



class AddReferences extends StatefulWidget {
  @override
  _AddReferencesState createState() => _AddReferencesState();
}

class _AddReferencesState extends State<AddReferences> {
  List<String> _selectRelationChoice = ['Relative', 'Family Friend', 'Trainer', 'Academic', 'Professional'];
  int? _defaultRelationChoiceIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _defaultRelationChoiceIndex = 0;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: header2(
        context,
        titleText: Strings.references,
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                  minWidth: viewportConstraints.maxWidth),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: <Widget>[
                      TextField(
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.teal,
                          ),
                          decoration: InputDecoration(
                            hintText: "Name*",
                            labelText: 'Name*',
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blueAccent, width: 32.0),
                                borderRadius: BorderRadius.circular(10.0)),
                          )),
                      Divider(),
                      TextField(
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.teal,
                          ),
                          decoration: InputDecoration(
                            hintText: "Organization*",
                            labelText: 'Organization*',
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blueAccent, width: 32.0),
                                borderRadius: BorderRadius.circular(10.0)),
                          )),
                      Divider(),
                      TextField(
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.teal,
                          ),
                          decoration: InputDecoration(
                            hintText: "Designaion*",
                            labelText: 'Designaion*',
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blueAccent, width: 32.0),
                                borderRadius: BorderRadius.circular(10.0)),
                          )),
                      Divider(),
                      TextField(
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.teal,
                          ),
                          decoration: InputDecoration(
                            hintText: "Address",
                            labelText: 'Address',
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blueAccent, width: 32.0),
                                borderRadius: BorderRadius.circular(10.0)),
                          )),
                      Divider(),
                      TextField(
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.teal,
                          ),
                          decoration: InputDecoration(
                            hintText: "Phone Number(Office)",
                            labelText: 'Phone Number(Office)',
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blueAccent, width: 32.0),
                                borderRadius: BorderRadius.circular(10.0)),
                          )),
                      Divider(),
                      TextField(
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.teal,
                          ),
                          decoration: InputDecoration(
                            hintText: "Mobile No.",
                            labelText: 'Mobile No.',
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blueAccent, width: 32.0),
                                borderRadius: BorderRadius.circular(10.0)),
                          )),
                      Divider(),
                      TextField(
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.teal,
                          ),
                          decoration: InputDecoration(
                            hintText: "Email Address",
                            labelText: 'Email Address"',
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blueAccent, width: 32.0),
                                borderRadius: BorderRadius.circular(10.0)),
                          )),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            'Relation*',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      Wrap(
                        spacing: 5.0,
                        children: List<Widget>.generate(
                          5,
                              (int index) {
                            return ChoiceChip(
                              label: Text(
                                _selectRelationChoice[index],
                                style: TextStyle(color: Colors.white, fontSize: 15.0),
                              ),
                              backgroundColor: Colors.black26,
                              padding: EdgeInsets.all(5.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                              selected: _defaultRelationChoiceIndex == index,
                              selectedColor: Theme.of(context).primaryColor,
                              onSelected: (bool selected) {
                                setState(() {
                                  _defaultRelationChoiceIndex = selected ? index : 0;
                                });
                              },
                            );
                          },
                        ).toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: floatingActionButtonNext(
          context, MaterialPageRoute(builder: (context) => ReferencesNull())),
     // bottomNavigationBar: BottomInfoBar(),

    );
  }
}
