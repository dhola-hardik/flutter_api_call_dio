import 'package:dio/dio.dart';

final title = "CustomLogInterceptor";

/// [CustomLogInterceptor] is used to print logs during network requests.
/// It's better to add [CustomLogInterceptor] to the tail of the interceptor queue,
/// otherwise the changes made in the interceptor behind A will not be printed out.
/// This is because the execution of interceptors is in the order of addition.
///
class CustomLogInterceptor extends Interceptor {
  CustomLogInterceptor({
    this.request = true,
    this.requestHeader = true,
    this.requestBody = false,
    this.responseHeader = true,
    this.responseBody = false,
    this.error = true,
    this.logPrint = print,
  });

  bool request;
  bool requestHeader;
  bool requestBody;
  bool responseBody;
  bool responseHeader;
  bool error;

  void Function(Object object) logPrint;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logPrint('************************* Request ************************');
    printKV('uri', options.uri);

    if (request) {
      printKV('method', options.method);
      // printKV('path', options.path);
      printKV('responseType', options.responseType.toString());
      printKV('extra', options.extra);
    }
    if (requestHeader) {
      logPrint('headers:');
      options.headers.forEach((key, v) => printKV(' $key', v));
    }
    if (requestBody) {
      logPrint('requestBodyData:');
      printAll(options.data);
    }
    logPrint('*************************************************');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logPrint('************************ Response ************************');
    printKV('uri', response.requestOptions.uri);
    _printResponse(response);
    logPrint('*************************************************');
    // return handler.next(response);
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (error) {
      logPrint('************************ DioError ************************');
      logPrint('uri: ${err.requestOptions.uri}');
      // logPrint('path: ${err.requestOptions.path}');
      logPrint('$err');
      if (err.response != null) {
        _printResponse(err.response!);
      }
      logPrint('*************************************************');
    }
    return super.onError(err, handler);
  }

  void _printResponse(Response response) {
    printKV('statusCode', response.statusCode!);
    if (responseHeader) {
      if (response.isRedirect == true) {
        printKV('redirect', response.realUri);
      }
      if (response.headers != null) {
        logPrint('headers:');
        response.headers.forEach((key, v) => printKV(' $key', v.join(',')));
      }
    }
    if (responseBody) {
      logPrint('Response Text:');
      //printAll(response.toString());

      final pattern = new RegExp('.{1,800}'); // 800 is the size of each chunk
      pattern
          .allMatches(response.toString())
          .forEach((match) => printAll(match.group(0)));
    }
  }

  void printKV(String key, Object v) {
    logPrint('$key: $v');
  }

  void printAll(msg) {
    msg.toString().split('\n').forEach(logPrint);
  }
}
