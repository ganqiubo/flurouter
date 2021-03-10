import 'package:flurouter/router/OnRouterResult.dart';
import 'package:flurouter/router/RouterData.dart';
import 'package:flurouter/router/RouterManager.dart';
import 'package:flutter/material.dart';

class BaseStatelessWidget extends StatelessWidget with OnRouterResult {

  static const String TAG = "BaseStatelessWidget";
  RouterData arguments;
  RouterData backData;
  Map<String, Object> params;
  BuildContext context;

  void initBuild(BuildContext context){
    this.context = context;
    if(context==null){
      print(TAG + ", " + "context is null, need to super.initBuild()");
      return;
    }
    if(ModalRoute.of(context)==null || ModalRoute.of(context).settings==null){
      arguments = new RouterData();
    }else{
      arguments = ModalRoute.of(context).settings.arguments;
    }
    if(arguments == null || !(arguments is RouterData)){
      arguments = new RouterData();
    }
    if(arguments.params==null || !(arguments.params is Map)){
      arguments.params = new Map<String, Object>();
    }
    params = arguments.params;
    backData = new RouterData();
  }

  @override
  onPageResult(RouterData data) {
  }

  @override
  Widget build(BuildContext context) {
  }

  push(String path, {int resultCode}){
    if(context==null){
      print(TAG + ", " + "context is null, need to super.initBuild()");
      return;
    }
    RouterManager.push(context, path, this, resultCode: resultCode);
  }

  pushWithData(String path, RouterData arguments){
    if(context==null){
      print(TAG + ", " + "context is null, need to super.initBuild()");
      return;
    }
    RouterManager.pushWithData(context, path, arguments, this);
  }

  pop({RouterData result}){
    if(context==null){
      print(TAG + ", " + "context is null, need to super.initBuild()");
      return;
    }
    RouterManager.pop(context, result: result);
  }
}