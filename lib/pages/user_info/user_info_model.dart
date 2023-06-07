import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/debug_sheet_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/permissions_util.dart';
import 'dart:async';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class UserInfoModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool requestCompleted = false;
  String? requestLastUniqueKey;
  // State field(s) for Switch_user_exists_check widget.
  bool? switchUserExistsCheckValue;
  // State field(s) for text_age widget.
  TextEditingController? textAgeController;
  String? Function(BuildContext, String?)? textAgeControllerValidator;
  String? _textAgeControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '5gncvnrb' /* Field is required */,
      );
    }

    if (!RegExp('^(1[6-9]|[2-9]\\d)\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'q571qp3d' /* Enter a valid age between 16 a... */,
      );
    }
    return null;
  }

  // State field(s) for DropDown_gender widget.
  String? dropDownGenderValue;
  FormFieldController<String>? dropDownGenderValueController;
  // State field(s) for DropDown_country widget.
  int? dropDownCountryValue;
  FormFieldController<int>? dropDownCountryValueController;
  // State field(s) for DropDown_state widget.
  int? dropDownStateValue;
  FormFieldController<int>? dropDownStateValueController;
  // State field(s) for Switch_anxietyDiagnose widget.
  bool? switchAnxietyDiagnoseValue;
  // State field(s) for Switch_depressionDiagnose widget.
  bool? switchDepressionDiagnoseValue;
  // State field(s) for Switch_adhdDiagnose widget.
  bool? switchAdhdDiagnoseValue;
  // State field(s) for Switch_anxietyTreated widget.
  bool? switchAnxietyTreatedValue;
  // State field(s) for Switch_depressionTreated widget.
  bool? switchDepressionTreatedValue;
  // State field(s) for Switch_adhdTreated widget.
  bool? switchAdhdTreatedValue;
  // State field(s) for Switch_location widget.
  bool? switchLocationValue;
  // State field(s) for Switch_biometric widget.
  bool? switchBiometricValue;
  // State field(s) for DropDown_lang widget.
  String? dropDownLangValue;
  FormFieldController<String>? dropDownLangValueController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    textAgeControllerValidator = _textAgeControllerValidator;
  }

  void dispose() {
    textAgeController?.dispose();
  }

  /// Additional helper methods are added here.

  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleted;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
