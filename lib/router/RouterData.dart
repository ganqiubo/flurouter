class RouterData{
  int resultCode;
  Map<String, Object> params;

  RouterData({resultCode, params}){
    this.resultCode = resultCode??-2;
    this.params = params??new Map<String, Object>();
  }

  RouterData.fromRouterData(int resultCode, Map<String, Object> params) {
    this.resultCode = resultCode;
    this.params = params;
  }

  @override
  String toString() {
    return 'RouterData{resultCode: $resultCode, params: $params}';
  }
}