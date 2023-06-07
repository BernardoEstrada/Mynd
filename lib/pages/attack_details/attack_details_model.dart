import '/backend/supabase/supabase.dart';
import '/components/boolean_details_row_widget.dart';
import '/components/debug_sheet_widget.dart';
import '/components/undo_delete_record_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class AttackDetailsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for DetailsSafe.
  late BooleanDetailsRowModel detailsSafeModel;
  // Model for DetailsAccompanied.
  late BooleanDetailsRowModel detailsAccompaniedModel;
  // Model for DetailsSource.
  late BooleanDetailsRowModel detailsSourceModel;
  // Model for DetailsGetAway.
  late BooleanDetailsRowModel detailsGetAwayModel;
  // Model for DetailsCaAct.
  late BooleanDetailsRowModel detailsCaActModel;
  // Model for DetailsPeople.
  late BooleanDetailsRowModel detailsPeopleModel;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // Stores action output result for [Backend Call - Update Row] action in Button widget.
  List<AttackReportsRow>? deletedRows;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    detailsSafeModel = createModel(context, () => BooleanDetailsRowModel());
    detailsAccompaniedModel =
        createModel(context, () => BooleanDetailsRowModel());
    detailsSourceModel = createModel(context, () => BooleanDetailsRowModel());
    detailsGetAwayModel = createModel(context, () => BooleanDetailsRowModel());
    detailsCaActModel = createModel(context, () => BooleanDetailsRowModel());
    detailsPeopleModel = createModel(context, () => BooleanDetailsRowModel());
  }

  void dispose() {
    detailsSafeModel.dispose();
    detailsAccompaniedModel.dispose();
    detailsSourceModel.dispose();
    detailsGetAwayModel.dispose();
    detailsCaActModel.dispose();
    detailsPeopleModel.dispose();
  }

  /// Additional helper methods are added here.

}
