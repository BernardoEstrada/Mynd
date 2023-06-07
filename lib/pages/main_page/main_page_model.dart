import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/debug_btn_widget.dart';
import '/components/panic_attack_data_widget.dart';
import '/components/panic_attack_report_widget.dart';
import '/components/undo_delete_record_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';

class MainPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  bool requestCompleted1 = false;
  String? requestLastUniqueKey1;
  bool biometricPassed = false;
  // Model for DebugBtn component.
  late DebugBtnModel debugBtnModel;
  bool requestCompleted2 = false;
  String? requestLastUniqueKey2;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    debugBtnModel = createModel(context, () => DebugBtnModel());
  }

  void dispose() {
    debugBtnModel.dispose();
  }

  /// Additional helper methods are added here.

  Future waitForRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleted1;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleted2;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
