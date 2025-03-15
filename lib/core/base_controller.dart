import 'package:edge_detection/utils/snacbar.dart';
import 'package:flutter/services.dart';

class BaseController {
  Object? _exception;
  Object? get exception {
    return _exception;
  }

  set setException(Object? name) {
    _exception = name;
    showSnacBar(msg: errorMsg());
  }

  String errorMsg() {
    try {
      if (_exception is PlatformException) {
        final parser = _exception as PlatformException;
        return parser.message ?? "Something went wrong! Try again";
      }
      return "There was an error: $_exception'";
    } catch (e) {
      return "Something went wrong! Try again";
    }
  }
}
