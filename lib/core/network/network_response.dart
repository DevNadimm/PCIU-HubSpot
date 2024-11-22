class NetworkResponse {
  String errorMessage;
  dynamic responseData;
  final int statusCode;
  final bool isSuccess;

  NetworkResponse({
    required this.statusCode,
    required this.isSuccess,
    this.responseData,
    this.errorMessage = 'Something went wrong!',
  });
}
