import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'month_details_model.dart';
export 'month_details_model.dart';

class MonthDetailsWidget extends StatefulWidget {
  const MonthDetailsWidget({
    Key? key,
    required this.monthDetails,
  }) : super(key: key);

  final AttackReportsSummaryRow? monthDetails;

  @override
  _MonthDetailsWidgetState createState() => _MonthDetailsWidgetState();
}

class _MonthDetailsWidgetState extends State<MonthDetailsWidget> {
  late MonthDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MonthDetailsModel());

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

    return Title(
        title: 'MonthDetails',
        color: FlutterFlowTheme.of(context).primary,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 55.0,
                icon: FaIcon(
                  FontAwesomeIcons.chevronLeft,
                  color: FlutterFlowTheme.of(context).secondary,
                  size: 25.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              title: Text(
                functions.dateToMonthsAgo(widget.monthDetails!.startTime!, 0,
                    FFLocalizations.of(context).languageCode),
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.of(context).secondary,
                      fontSize: 22.0,
                    ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                    child: FutureBuilder<List<AttackReportsRow>>(
                      future: FFAppState().latestReports(
                        uniqueQueryKey:
                            '${dateTimeFromSecondsSinceEpoch(functions.unixTrunc(getCurrentTimestamp.secondsSinceEpoch, 3600)).toString()}_${functions.dateToMonthsAgo(widget.monthDetails!.startTime!, 0, 'en')}',
                        requestFn: () => AttackReportsTable().queryRows(
                          queryFn: (q) => q
                              .eq(
                                'deleted',
                                false,
                              )
                              .gte(
                                'created_at',
                                supaSerialize<DateTime>(
                                    widget.monthDetails?.startTime),
                              )
                              .lt(
                                'created_at',
                                supaSerialize<DateTime>(functions.addMonths(
                                    widget.monthDetails!.startTime!, 1)),
                              )
                              .order('created_at'),
                        ),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: SpinKitThreeBounce(
                                color: FlutterFlowTheme.of(context).secondary,
                                size: 50.0,
                              ),
                            ),
                          );
                        }
                        List<AttackReportsRow> columnAttackReportsRowList =
                            snapshot.data!;
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: List.generate(
                              columnAttackReportsRowList.length, (columnIndex) {
                            final columnAttackReportsRow =
                                columnAttackReportsRowList[columnIndex];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 5.0, 16.0, 5.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    'AttackDetails',
                                    queryParameters: {
                                      'report': serializeParam(
                                        columnAttackReportsRow,
                                        ParamType.SupabaseRow,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 4.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 8.0, 16.0, 8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.solidCircle,
                                          color: () {
                                            if (columnAttackReportsRow.rate <
                                                20) {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .secondary;
                                            } else if (columnAttackReportsRow
                                                    .rate <
                                                50) {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .warning;
                                            } else {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .error;
                                            }
                                          }(),
                                          size: 8.0,
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  functions.customDateFormat(
                                                      columnAttackReportsRow
                                                          .createdAt!,
                                                      'EEEE, do',
                                                      FFLocalizations.of(
                                                              context)
                                                          .languageCode),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleLarge,
                                                ),
                                                Text(
                                                  '(${dateTimeFormat(
                                                    'MMMEd',
                                                    columnAttackReportsRow
                                                        .createdAt,
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  )})',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelMedium,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        if (columnAttackReportsRow.notes !=
                                                null &&
                                            columnAttackReportsRow.notes != '')
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 0.0, 0.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.stickyNote,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              size: 16.0,
                                            ),
                                          ),
                                        if (columnAttackReportsRow.location !=
                                                null &&
                                            columnAttackReportsRow.location !=
                                                '')
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 0.0, 0.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.mapMarkerAlt,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              size: 16.0,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
