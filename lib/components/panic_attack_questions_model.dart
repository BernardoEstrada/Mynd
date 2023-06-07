import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/question_input_widget.dart';
import '/components/select_report_widget.dart';
import '/components/thanks_for_anwering_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';

class PanicAttackQuestionsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for SwipeableStack widget.
  late SwipeableCardSectionController swipeableStackController;
  // Models for questionInput dynamic component.
  late FlutterFlowDynamicModels<QuestionInputModel> questionInputModels;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    swipeableStackController = SwipeableCardSectionController();
    questionInputModels = FlutterFlowDynamicModels(() => QuestionInputModel());
  }

  void dispose() {
    questionInputModels.dispose();
  }

  /// Additional helper methods are added here.

}
