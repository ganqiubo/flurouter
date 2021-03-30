class FluRouterData{
  int resultCode;
  Map<String, Object> params;

  FluRouterData({resultCode, params}){
    this.resultCode = resultCode??-2;
    this.params = params??new Map<String, Object>();
  }

  FluRouterData.fromRouterData(int resultCode, Map<String, Object> params) {
    this.resultCode = resultCode;
    this.params = params;
  }

  @override
  String toString() {
    return 'FluRouterData{resultCode: $resultCode, params: $params}';
  }
}