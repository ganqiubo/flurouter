import 'package:flurouter/router/OnRouterResult.dart';
import 'package:flurouter/router/FluRouterData.dart';
import 'package:flurouter/router/FluRouterManager.dart';
import 'package:flutter/material.dart';

class FlurouterPageState<T extends StatefulWidget> extends State<T> with OnRouterResult {

  FluRouterData arguments;
  FluRouterData backData;
  Map<String, Object> params;

  Widget build(BuildContext context) {
  }

  @override
  onPageResult(FluRouterData data) {
  }

  @override
  void initState() {
    super.initState();
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

  push(String path, {int resultCode}){
    FluRouterManager.push(context, path, this, resultCode: resultCode);
  }

  pushWithData(String path, FluRouterData arguments){
    FluRouterManager.pushWithData(context, path, arguments, this);
  }

  pop({FluRouterData result}){
    FluRouterManager.pop(context, result: result);
  }
}