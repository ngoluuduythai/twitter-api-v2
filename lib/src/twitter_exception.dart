// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// Package imports:
import 'package:http/http.dart';

/// This class indicates that an unexpected error occurred when communicating
/// with the Twitter API.
class TwitterException implements Exception {
  /// Returns the new instance of [TwitterException].
  TwitterException(this.message, this.response, [String? body])
      : body = response is Response ? response.body : body;

  /// The error message
  final String message;

  /// The response from the Twitter API.
  final BaseResponse response;

  /// The body of the response.
  ///
  /// Equal to [Response.body] if [response] is a [Response]. Otherwise set to
  /// the event of a [StreamedResponse] that caused this exception (if
  /// available).
  final String? body;

  @override
  String toString() {
    final buffer = StringBuffer()
      ..writeln('TwitterException: $message\n')
      ..writeln('  ✅ Status Code:')
      ..writeln('   ${response.statusCode}\n')
      ..writeln('  ✅ Request:')
      ..writeln('   ${response.request}\n')
      ..writeln('  ✅ Headers:')
      ..writeln('   ${response.headers}\n');

    if (body != null) {
      buffer
        ..writeln('  ✅ Body:')
        ..writeln('   $body\n');
    }

    buffer
      ..writeln('  Please create an Issue if you have a question '
          'or suggestion for this exception.')
      ..writeln('  https://github.com/twitter-dart/twitter-api-v2/issues');

    return buffer.toString();
  }
}
