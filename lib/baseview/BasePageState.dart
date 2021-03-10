import 'package:flurouter/router/OnRouterResult.dart';
import 'package:flurouter/router/RouterData.dart';
import 'package:flurouter/router/RouterManager.dart';
import 'package:flutter/material.dart';

class BasePageState<T extends StatefulWidget> extends State<T> with OnRouterResult {

  RouterData arguments;
  RouterData backData;
  Map<String, Object> params;

  Widget build(BuildContext context) {
  }

  @override
  onPageResult(RouterData data) {
  }

  @override
  void initState() {
    super.initState();
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

  push(String path, {int resultCode}){
    RouterManager.push(context, path, this, resultCode: resultCode);
  }

  pushWithData(String path, RouterData arguments){
    RouterManager.pushWithData(context, path, arguments, this);
  }

  pop({RouterData result}){
    RouterManager.pop(context, result: result);
  }
}