import 'package:flutter/cupertino.dart';
import 'package:girlzwhosell/new_widgets/company_card.dart';
import 'package:girlzwhosell/new_widgets/company_card2.dart';

class CardProvider extends ChangeNotifier{

  List <Widget> _listOfContainers = [];

  List <Widget> get listOfContainers => _listOfContainers;

  bool _isDragging = false;
  bool get isDragging => _isDragging;

  double _angle = 0;
  double get angle => _angle;

  Offset _position = Offset.zero;
  Offset get position => _position;

  Size _screenSize = Size.zero;

CardProvider(){
  resetCards();
}


  void setScreenSize(Size screenSize) => _screenSize = screenSize;


  void startPosition(DragStartDetails details ){
   _isDragging = true;
    notifyListeners();
  }

  void updatePosition(DragUpdateDetails details ){
   _position += details.delta;

   final x = _position.dx;
     _angle = 45 * x / _screenSize.width;

     notifyListeners();
  }
  void endPosition(){
     resetPosition();
  }

  void resetPosition(){
     _isDragging = false;
     _position = Offset.zero;
     _angle = 0;

    notifyListeners();
  }

  void resetCards (){

    _listOfContainers  = <Widget>[
      AllJobCard(),
      AllJobCard2(),
    ].reversed.toList();

    notifyListeners();
  }

}