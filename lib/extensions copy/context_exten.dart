import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  
  Future goto(String path, {Object? args, bool clear = false})async{
    if(clear){
      await Navigator.pushNamedAndRemoveUntil(this, path, (route) => false, arguments: args);
    }else{
      await Navigator.pushNamed(this, path, arguments: args);
    }
  }

  ThemeData theme(){
    return Theme.of(this);
  }

  double sw(){
    return MediaQuery.of(this).size.width;
  }

  double sh(){
    return MediaQuery.of(this).size.height;
  }

  back(){
    Navigator.pop(this);
  }
}