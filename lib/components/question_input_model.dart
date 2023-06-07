import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class QuestionInputModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for bool_input widget.
  bool? boolInputValue;
  // State field(s) for int8_input widget.
  TextEditingController? int8InputController;
  String? Function(BuildContext, String?)? int8InputControllerValidator;
  String? _int8InputControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '9zod7ctz' /* Field is required */,
      );
    }

    if (!RegExp('^-?[0-9]+\$').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // State field(s) for float8_input widget.
  TextEditingController? float8InputController;
  String? Function(BuildContext, String?)? float8InputControllerValidator;
  String? _float8InputControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '46no78t1' /* Field is required */,
      );
    }

    if (!RegExp('^-?[0-9]*.?[0-9]+\$').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // State field(s) for text_input widget.
  TextEditingController? textInputController;
  String? Function(BuildContext, String?)? textInputControllerValidator;
  String? _textInputControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'zq5ibz0i' /* Field is required */,
      );
    }

    if (val.length > 512) {
      return 'Maximum 512 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    int8InputControllerValidator = _int8InputControllerValidator;
    float8InputControllerValidator = _float8InputControllerValidator;
    textInputControllerValidator = _textInputControllerValidator;
  }

  void dispose() {
    int8InputController?.dispose();
    float8InputController?.dispose();
    textInputController?.dispose();
  }

  /// Additional helper methods are added here.

}
