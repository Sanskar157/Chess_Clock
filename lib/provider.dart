import 'package:flutter/material.dart';
import 'dart:async';

class ChessClock extends ChangeNotifier {
  Duration _whiteTime = const Duration(minutes: 10);
  Duration _blackTime = const Duration(minutes: 10);
  bool _isWhiteTurn = true;
  bool _isRunning = false;

  Duration get whiteTime => _whiteTime;
  Duration get blackTime => _blackTime;
  bool get isWhiteTurn => _isWhiteTurn;
  bool get isRunning => _isRunning;

  void startStop() {
    _isRunning = !_isRunning;
    notifyListeners();
    if (_isRunning) {
      _startTimer();
    }
  }

  void _startTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!_isRunning) {
        timer.cancel();
        return;
      }
      if (_isWhiteTurn) {
        if (_whiteTime.inSeconds > 0) {
          _whiteTime -= const Duration(seconds: 1);
        } else {
          timer.cancel();
          
        }
      } else {
        if (_blackTime.inSeconds > 0) {
          _blackTime -= const Duration(seconds: 1);
        } else {
          timer.cancel();
        }
      }
      notifyListeners();
    });
  }

  void switchTurn() {
    _isWhiteTurn = !_isWhiteTurn;
    notifyListeners();
  }

  void reset() {
    _whiteTime = const Duration(minutes: 10);
    _blackTime = const Duration(minutes: 10);
    _isWhiteTurn = true;
    _isRunning = false;
    notifyListeners();
  }
}
