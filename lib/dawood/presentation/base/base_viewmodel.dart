import 'package:flutter/material.dart';

abstract class BaseViewModel implements BaseViewModelInput,BaseViewModelOutput{

}

abstract class BaseViewModelInput{
  void start(BuildContext context);
  void dispose();
}

abstract class BaseViewModelOutput{

}