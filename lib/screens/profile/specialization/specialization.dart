import 'package:flutter/material.dart';
import 'package:girlzwhosell/screens/profile/specialization/specialization_add.dart';

class Specialization extends StatefulWidget {
  @override
  _SpecializationState createState() => _SpecializationState();
}

class _SpecializationState extends State<Specialization> {
  @override
  Widget build(BuildContext context) {

    void _onExitTap(){
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return SimpleDialog(
              title: Column(
                children: [
                  ListTile(
                    title: Text(
                      'Skill',
                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'You may add single or multiple skills',
                      style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0))
                        ),
                        labelText: 'Skill Description'
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      SizedBox(
                        child: FlatButton(
                          child: Text('Cancel',style: TextStyle(color: Colors.indigo)),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      SizedBox(
                        child: FlatButton(
                          child: Text('Save',style: TextStyle(color: Colors.indigo)),
                          onPressed: ()=> Navigator.pop(context)
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Specialization'),
        leading: IconButton(
          onPressed: ()=>Navigator.pop(context),
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(30.0),
            child: Container(
              height: 50,
              width: 300,
              child: FlatButton(
                onPressed: _onExitTap,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.add_circle_outline,color: Colors.white),
                    SizedBox(width: 10),
                    Text(
                      'Add Skill',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
                color: Colors.green,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(13.0),
            child: ListTile(
              leading: Icon(Icons.business_center,color: Colors.black54),
              title: Text(
                'Skill Description',
                style: TextStyle(color: Colors.black54),
              ),
              trailing: IconButton(
                onPressed: (){
                  Navigator.push(context,
                  MaterialPageRoute(builder:
                  (context)=>SpecialSkill())
                  );
                },
                icon: Icon(Icons.edit,color: Colors.black54),
                color: Colors.white54,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(13.0),
            child: ListTile(
              leading: Icon(Icons.transfer_within_a_station,color: Colors.black54),
              title: Text(
                'Extra Curricular Activities',
                style: TextStyle(color: Colors.black54),
              ),
              trailing: IconButton(
                onPressed: (){
                  Navigator.push(context,
                  MaterialPageRoute(builder:
                  (context)=>SpecialSkill())
                  );
                },
                icon: Icon(Icons.edit,color: Colors.black54),
                color: Colors.white54,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
