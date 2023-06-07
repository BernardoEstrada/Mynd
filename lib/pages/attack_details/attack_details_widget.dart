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
import 'attack_details_model.dart';
export 'attack_details_model.dart';

class AttackDetailsWidget extends StatefulWidget {
  const AttackDetailsWidget({
    Key? key,
    required this.report,
  }) : super(key: key);

  final AttackReportsRow? report;

  @override
  _AttackDetailsWidgetState createState() => _AttackDetailsWidgetState();
}

class _AttackDetailsWidgetState extends State<AttackDetailsWidget> {
  late AttackDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AttackDetailsModel());

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: SpinKitThreeBounce(
              color: FlutterFlowTheme.of(context).secondary,
              size: 50.0,
            ),
          ),
        ),
      );
    }

    return Title(
        title: 'AttackDetails',
        color: FlutterFlowTheme.of(context).primary,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            resizeToAvoidBottomInset: false,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            floatingActionButton: Visibility(
              visible: FFAppState().debug,
              child: FloatingActionButton(
                onPressed: () async {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) {
                      return GestureDetector(
                        onTap: () =>
                            FocusScope.of(context).requestFocus(_unfocusNode),
                        child: Padding(
                          padding: MediaQuery.of(context).viewInsets,
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.7,
                            child: DebugSheetWidget(),
                          ),
                        ),
                      );
                    },
                  ).then((value) => setState(() {}));
                },
                backgroundColor: FlutterFlowTheme.of(context).accent3,
                elevation: 8.0,
                child: FaIcon(
                  FontAwesomeIcons.bug,
                  color: FlutterFlowTheme.of(context).accent1,
                  size: 30.0,
                ),
              ),
            ),
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              iconTheme:
                  IconThemeData(color: FlutterFlowTheme.of(context).secondary),
              automaticallyImplyLeading: true,
              title: Text(
                functions.capitalize(dateTimeFormat(
                  'MMMMEEEEd',
                  widget.report!.createdAt!,
                  locale: FFLocalizations.of(context).languageCode,
                )),
                textAlign: TextAlign.start,
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.of(context).secondary,
                      fontSize: 22.0,
                    ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 4.0,
            ),
            body: SafeArea(
              top: true,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'dgorumuu' /* Panic attack details */,
                            ),
                            style: FlutterFlowTheme.of(context).headlineLarge,
                          ),
                          Text(
                            '${dateTimeFormat(
                              'relative',
                              widget.report?.createdAt,
                              locale: FFLocalizations.of(context).languageCode,
                            )} (${dateTimeFormat(
                              'MMMEd',
                              widget.report?.createdAt,
                              locale: FFLocalizations.of(context).languageCode,
                            )})',
                            style: FlutterFlowTheme.of(context).titleMedium,
                          ),
                          if (FFAppState().debug)
                            SelectionArea(
                                child: Text(
                              valueOrDefault<String>(
                                widget.report?.id,
                                'repId',
                              ),
                              style: FlutterFlowTheme.of(context).titleMedium,
                            )),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '178yf368' /* Intensity  */,
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).titleLarge,
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'ss6tgt7a' /* (0-100) */,
                                  ),
                                  textAlign: TextAlign.start,
                                  style:
                                      FlutterFlowTheme.of(context).titleSmall,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 4.0, 0.0, 16.0),
                            child: CircularPercentIndicator(
                              percent: widget.report!.rate / 100,
                              radius: 60.0,
                              lineWidth: 12.0,
                              animation: true,
                              progressColor: () {
                                if (widget.report!.rate < 20) {
                                  return FlutterFlowTheme.of(context).secondary;
                                } else if (widget.report!.rate < 50) {
                                  return FlutterFlowTheme.of(context).warning;
                                } else {
                                  return FlutterFlowTheme.of(context).tertiary;
                                }
                              }(),
                              backgroundColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              center: Text(
                                formatNumber(
                                  widget.report!.rate,
                                  formatType: FormatType.custom,
                                  format: '#00',
                                  locale: '',
                                ),
                                style:
                                    FlutterFlowTheme.of(context).headlineSmall,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'ebb9jqmm' /* In that moment you... */,
                              ),
                              style: FlutterFlowTheme.of(context).titleLarge,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                wrapWithModel(
                                  model: _model.detailsSafeModel,
                                  updateCallback: () => setState(() {}),
                                  child: BooleanDetailsRowWidget(
                                    status: widget.report!.safe,
                                    text: FFLocalizations.of(context)
                                        .getVariableText(
                                      enText: widget.report!.safe
                                          ? 'Felt safe'
                                          : 'Did not feel safe',
                                      esText: widget.report!.safe
                                          ? 'Te sentiste seguro/a'
                                          : 'No te sentiste seguro/a',
                                    ),
                                  ),
                                ),
                                wrapWithModel(
                                  model: _model.detailsAccompaniedModel,
                                  updateCallback: () => setState(() {}),
                                  child: BooleanDetailsRowWidget(
                                    status: widget.report!.accompanied,
                                    text: FFLocalizations.of(context)
                                        .getVariableText(
                                      enText: widget.report!.safe
                                          ? 'Were accompanied'
                                          : 'Were not accompanied',
                                      esText: widget.report!.accompanied
                                          ? 'Estuviste acompañado/a'
                                          : 'No estuviste acompañado/a',
                                    ),
                                  ),
                                ),
                                wrapWithModel(
                                  model: _model.detailsSourceModel,
                                  updateCallback: () => setState(() {}),
                                  child: BooleanDetailsRowWidget(
                                    status: widget.report!.identifySource,
                                    text: FFLocalizations.of(context)
                                        .getVariableText(
                                      enText: widget.report!.identifySource
                                          ? 'Were able to identify the source'
                                          : 'Were unable to identify the source',
                                      esText: widget.report!.identifySource
                                          ? 'Pudiste identificar la fuente'
                                          : 'No pudiste identificar la fuente',
                                    ),
                                  ),
                                ),
                                wrapWithModel(
                                  model: _model.detailsGetAwayModel,
                                  updateCallback: () => setState(() {}),
                                  child: BooleanDetailsRowWidget(
                                    status: widget.report!.getAway,
                                    text: FFLocalizations.of(context)
                                        .getVariableText(
                                      enText: widget.report!.getAway
                                          ? 'Were able to get away from the situation'
                                          : 'Were not able to get away from the situation',
                                      esText: widget.report!.getAway
                                          ? 'Te pudiste alejar de la situación'
                                          : 'No te pudiste alejar de la situación',
                                    ),
                                  ),
                                ),
                                wrapWithModel(
                                  model: _model.detailsCaActModel,
                                  updateCallback: () => setState(() {}),
                                  child: BooleanDetailsRowWidget(
                                    status: widget.report!.canAct,
                                    text: FFLocalizations.of(context)
                                        .getVariableText(
                                      enText: widget.report!.canAct
                                          ? 'Were able to do something'
                                          : 'Were not able to do anything',
                                      esText: widget.report!.canAct
                                          ? 'Podías hacer algo al respecto'
                                          : 'No podías hacer nada al respecto',
                                    ),
                                  ),
                                ),
                                wrapWithModel(
                                  model: _model.detailsPeopleModel,
                                  updateCallback: () => setState(() {}),
                                  child: BooleanDetailsRowWidget(
                                    status: widget.report!.relatedToPeople,
                                    text: FFLocalizations.of(context)
                                        .getVariableText(
                                      enText: widget.report!.relatedToPeople
                                          ? 'Related the panic to other people'
                                          : 'Did not relate the panic to other people',
                                      esText: widget.report!.relatedToPeople
                                          ? 'Relacionaste el pánico a otra(s) persona(s)'
                                          : 'No relacionaste el pánico a nadie más',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (widget.report?.notes != null &&
                              widget.report?.notes != '')
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'cn6zh7vb' /* The notes you took */,
                                ),
                                style: FlutterFlowTheme.of(context).titleLarge,
                              ),
                            ),
                          if (widget.report?.notes != null &&
                              widget.report?.notes != '')
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 16.0),
                              child: Container(
                                width: 100.0,
                                constraints: BoxConstraints(
                                  minHeight: 48.0,
                                  maxHeight: 160.0,
                                ),
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 8.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 8.0, 16.0, 8.0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              widget.report?.notes,
                                              'No notes',
                                            ),
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          if (widget.report?.location != null &&
                              widget.report?.location != '')
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '3yld9lbr' /* Your location was */,
                                ),
                                style: FlutterFlowTheme.of(context).titleLarge,
                              ),
                            ),
                          if (widget.report?.location != null &&
                              widget.report?.location != '')
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 16.0),
                              child: Material(
                                color: Colors.transparent,
                                elevation: 1.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Container(
                                    width: 100.0,
                                    height: MediaQuery.of(context).size.height *
                                        0.2,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(8.0),
                                      shape: BoxShape.rectangle,
                                    ),
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Visibility(
                                      visible:
                                          widget.report?.location != null &&
                                              widget.report?.location != '',
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Builder(builder: (context) {
                                          final _googleMapMarker =
                                              currentUserLocationValue;
                                          return FlutterFlowGoogleMap(
                                            controller:
                                                _model.googleMapsController,
                                            onCameraIdle: (latLng) => _model
                                                .googleMapsCenter = latLng,
                                            initialLocation: _model
                                                    .googleMapsCenter ??=
                                                LatLng(13.106061, -59.613158),
                                            markers: [
                                              if (_googleMapMarker != null)
                                                FlutterFlowMarker(
                                                  _googleMapMarker.serialize(),
                                                  _googleMapMarker,
                                                ),
                                            ],
                                            markerColor:
                                                GoogleMarkerColor.magenta,
                                            mapType: MapType.normal,
                                            style: GoogleMapStyle.aubergine,
                                            initialZoom: 14.0,
                                            allowInteraction: false,
                                            allowZoom: true,
                                            showZoomControls: true,
                                            showLocation: false,
                                            showCompass: false,
                                            showMapToolbar: false,
                                            showTraffic: false,
                                            centerMapOnMarkerTap: true,
                                          );
                                        }),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 16.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                var confirmDialogResponse = await showDialog<
                                        bool>(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text(
                                              FFLocalizations.of(context)
                                                  .getVariableText(
                                            enText:
                                                'Are you sure you want to delete this report?',
                                            esText:
                                                '¿Está seguro de que desea eliminar este reporte?',
                                          )),
                                          content: Text(
                                              FFLocalizations.of(context)
                                                  .getVariableText(
                                            enText:
                                                'This action cannot be undone',
                                            esText:
                                                'Esta acción no se puede deshacer',
                                          )),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext, false),
                                              child: Text(
                                                  FFLocalizations.of(context)
                                                      .getVariableText(
                                                enText: 'Cancel',
                                                esText: 'Cancelar',
                                              )),
                                            ),
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext, true),
                                              child: Text(
                                                  FFLocalizations.of(context)
                                                      .getVariableText(
                                                enText: 'Delete',
                                                esText: 'Eliminar',
                                              )),
                                            ),
                                          ],
                                        );
                                      },
                                    ) ??
                                    false;
                                if (confirmDialogResponse) {
                                  _model.deletedRows =
                                      await AttackReportsTable().update(
                                    data: {
                                      'deleted': true,
                                    },
                                    matchingRows: (rows) => rows.eq(
                                      'id',
                                      widget.report?.id,
                                    ),
                                    returnRows: true,
                                  );
                                  if (_model.deletedRows?.length == 1) {
                                    setState(() {
                                      FFAppState().refreshReports = true;
                                      FFAppState().recentlyDeletedReport =
                                          widget.report!.id;
                                    });
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          FFLocalizations.of(context)
                                              .getVariableText(
                                            enText: 'Report deleted',
                                            esText: 'Reporte eliminado',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                        ),
                                        duration: Duration(milliseconds: 3000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context).error,
                                        action: SnackBarAction(
                                          label: FFLocalizations.of(context)
                                              .getVariableText(
                                            enText: 'Recover',
                                            esText: 'Recuperar',
                                          ),
                                          textColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          onPressed: () async {
                                            showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              barrierColor: Colors.transparent,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return GestureDetector(
                                                  onTap: () =>
                                                      FocusScope.of(context)
                                                          .requestFocus(
                                                              _unfocusNode),
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.of(context)
                                                            .viewInsets,
                                                    child: Container(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.0,
                                                      child:
                                                          UndoDeleteRecordWidget(),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then((value) => setState(() {}));
                                          },
                                        ),
                                      ),
                                    );
                                    context.pop();
                                  } else {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('Error'),
                                          content: Text(
                                              FFLocalizations.of(context)
                                                  .getVariableText(
                                            enText:
                                                'There was an error deleting the report',
                                            esText:
                                                'Hubo un error al eliminar el reporte',
                                          )),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
                                }

                                setState(() {});
                              },
                              text: FFLocalizations.of(context).getText(
                                'akf2u9am' /* Delete report */,
                              ),
                              icon: FaIcon(
                                FontAwesomeIcons.trashAlt,
                              ),
                              options: FFButtonOptions(
                                height: 50.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).tertiary,
                                textStyle:
                                    FlutterFlowTheme.of(context).titleLarge,
                                elevation: 3.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          Container(
                            width: 100.0,
                            height: 32.0,
                            decoration: BoxDecoration(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
