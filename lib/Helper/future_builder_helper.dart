import 'package:flutter/material.dart';
class FutureBuilderHelper {
  static Widget build<T>(
      AsyncSnapshot<T> snapshot, {
        required Widget Function(T) onData,
        Widget? loadingWidget,
        Widget Function(Object)? onError,
        Widget? onEmpty, // Optional: Widget for empty data
      }) {
    switch (snapshot.connectionState) {
      case ConnectionState.waiting:
        return loadingWidget ?? const Center(child: CircularProgressIndicator());
      case ConnectionState.done:
        if (snapshot.hasError) {
          return onError != null ? onError(snapshot.error!) : Text('Error: ${snapshot.error}');
        }
        // Check for empty data (You can customize this logic based on your requirements)
        if (snapshot.data == null) {
          return onEmpty ?? Container(); // Display empty widget or nothing by default
        }
        return onData(snapshot.data as T);
      default:
        return Container(); // Handle other ConnectionState values if needed
    }
  }
}
