import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/panic_attack_questions_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class PanicAttackDataModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Slider_panicRate widget.
  double? sliderPanicRateValue;
  // State field(s) for SwitchListTile_safe widget.
  bool? switchListTileSafeValue;
  // State field(s) for SwitchListTile_accompanied widget.
  bool? switchListTileAccompaniedValue;
  // State field(s) for SwitchListTile_identifySource widget.
  bool? switchListTileIdentifySourceValue;
  // State field(s) for SwitchListTile_getAway widget.
  bool? switchListTileGetAwayValue;
  // State field(s) for SwitchListTile_canAct widget.
  bool? switchListTileCanActValue;
  // State field(s) for SwitchListTile_toPeople widget.
  bool? switchListTileToPeopleValue;
  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  AttackReportsRow? insertResponse;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    textController?.dispose();
  }

  /// Additional helper methods are added here.

}
