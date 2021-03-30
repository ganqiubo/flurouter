import 'package:flurouter/router/OnRouterResult.dart';
import 'package:flurouter/router/FluRouterData.dart';
import 'package:flurouter/router/FluRouterManager.dart';
import 'package:flutter/material.dart';

class FlurouterStatelessWidget extends StatelessWidget with OnRouterResult {

  static const String TAG = "BaseStatelessWidget";
  FluRouterData arguments;
  FluRouterData backData;
  Map<String, Object> params;
  BuildContext context;

  void initBuild(BuildContext context){
    this.context = context;
    if(context==null){
      print(TAG + ", " + "context is null, need to super.initBuild()");
      return;
    }
    if(ModalRoute.of(context)==null || ModalRoute.of(context).settings==null){
      arguments = new FluRouterData();
    }else{
      arguments = ModalRoute.of(context).settings.arguments;
    }
    if(arguments == null || !(arguments is FluRouterData)){
      arguments = new FluRouterData();
    }
    if(arguments.params==null || !(arguments.params is Map)){
      arguments.params = new Map<String, Object>();
    }
    params = arguments.params;
    backData = new FluRouterData();
  }

  @override
  onPageResult(FluRouterData data) {
  }

  @override
  Widget build(BuildContext context) {
  }

  push(String path, {int resultCode}){
    if(context==null){
      print(TAG + ", " + "context is null, need to super.initBuild()");
      return;
    }
    FluRouterManager.push(context, path, this, resultCode: resultCode);
  }

  pushWithData(String path, FluRouterData arguments){
    if(context==null){
      print(TAG + ", " + "context is null, need to super.initBuild()");
      return;
    }
    FluRouterManager.pushWithData(context, path, arguments, this);
  }

  pop({FluRouterData result}){
    if(context==null){
      print(TAG + ", " + "context is null, need to super.initBuild()");
      return;
    }
    FluRouterManager.pop(context, result: result);
  }
}