import 'package:flutter/material.dart';

class SpecialSkill extends StatefulWidget {
  @override
  _SpecialSkillState createState() => _SpecialSkillState();
}

class _SpecialSkillState extends State<SpecialSkill> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Specialization'),
        leading: IconButton(
          onPressed: ()=> Navigator.pop(context),
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))
                ),
                labelText: 'Skill Description'
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))
                ),
                labelText: 'Extra Curricular Activities',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
