import 'package:flurouter/router/OnRouterResult.dart';
import 'package:flurouter/router/FluRouterData.dart';
import 'package:flutter/material.dart';

class FluRouterManager{
  static final String TAG = "RouterManager";
  static Map<String, WidgetBuilder> routers;

  static init(Map routes){
    FluRouterManager.routers = routes;
  }

  static pushWithData(BuildContext context,String path, FluRouterData arguments, OnRouterResult onResult){
    if(routers == null || path==null || routers[path]==null){
      print(TAG + ", the path is not exit");
      return;
    }
    Navigator.of(context).pushNamed(path, arguments: arguments).then((data){
      if(onResult != null){
        onResult.onPageResult(data);
      }
    });
  }

  static push(BuildContext context, String path, OnRouterResult onResult, {int resultCode}){
    if(routers == null || path==null){
      print(TAG + ", the path is not exit");
      return;
    }
    int tempResultCode = resultCode==null?-2:resultCode;
    List<String> paths = path.split("?");
    Map<String, Object> argumentData = new Map();
    if(paths.length >= 2){
      List<String> argumentLists = paths.elementAt(1).split("&");
      for(int i=0;i<argumentLists.length;i++){
        List<String> itemArguments = argumentLists.elementAt(i).split("=");
        if(itemArguments.length>=2){
          argumentData[itemArguments[0]] = itemArguments[1];
        }
      }
    }
    path = paths.elementAt(0);
    if(routers[path] == null){
      print(TAG + ", the path is not exit");
      return;
    }
    Navigator.of(context).pushNamed(path, arguments: new FluRouterData.fromRouterData(tempResultCode, argumentData)).then((data){
      if(onResult != null){
        onResult.onPageResult(data);
      }
    });
  }

  static pop(BuildContext context, {FluRouterData result}){
    Navigator.of(context).pop(result);
  }

}