import 'package:edge_detection/utils/snacbar.dart';
import 'package:flutter/services.dart';

/// Base controller class to manage exceptions and display error messages.
class BaseController {
  /// Holds the exception object.
  Object? _exception;

  /// Getter for the exception.
  Object? get exception {
    return _exception;
  }

  /// Setter for handling exceptions.
  /// - Stores the exception.
  /// - Displays an error message using a snackbar.
  set setException(Object? name) {
    _exception = name;
    showSnacBar(msg: errorMsg());
  }

  /// Generates an error message based on the exception type.
  /// - If the exception is a `PlatformException`, it returns the provided message.
  /// - Otherwise, returns a generic error message.
  String errorMsg() {
    try {
      if (_exception is PlatformException) {
        final parser = _exception as PlatformException;
        return parser.message ?? "Something went wrong! Try again";
      }
      return "There was an error: $_exception";
    } catch (e) {
      return "Something went wrong! Try again";
    }
  }
}
