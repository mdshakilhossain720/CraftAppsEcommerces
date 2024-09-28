class NetWorkResponse {
  final int responseCode;
  final String errorMessage;
  final dynamic responseData;
  final bool isSuccess;

  NetWorkResponse({
    required this.responseCode,
    this.errorMessage = 'some thing is wrong',
    this.responseData,
    required this.isSuccess,
  });
}
