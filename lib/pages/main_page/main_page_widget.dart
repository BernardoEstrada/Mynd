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
import 'main_page_model.dart';
export 'main_page_model.dart';

class MainPageWidget extends StatefulWidget {
  const MainPageWidget({Key? key}) : super(key: key);

  @override
  _MainPageWidgetState createState() => _MainPageWidgetState();
}

class _MainPageWidgetState extends State<MainPageWidget>
    with TickerProviderStateMixin {
  late MainPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  int get pageViewCurrentIndex => _model.pageViewController != null &&
          _model.pageViewController!.hasClients &&
          _model.pageViewController!.page != null
      ? _model.pageViewController!.page!.round()
      : 0;

  final animationsMap = {
    'floatingActionButtonOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 0.0),
          end: Offset(1.0, 1.0),
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(100.0, 100.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (currentUserUid == null || currentUserUid == '') {
        if (FFAppState().AnonymousUserLogin.email != null &&
            FFAppState().AnonymousUserLogin.email != '') {
          GoRouter.of(context).prepareAuthEvent();

          final user = await authManager.signInWithEmail(
            context,
            FFAppState().AnonymousUserLogin.email,
            FFAppState().AnonymousUserLogin.pass,
          );
          if (user == null) {
            return;
          }
        } else {
          context.pushNamedAuth('Authenticate', context.mounted);

          return;
        }
      }
      if (FFAppState().completedDataEntry) {
        if (FFAppState().refreshReports) {
          FFAppState().clearLatestReportsCache();
          setState(() {
            FFAppState()
                .clearLatestReportsCacheKey(_model.requestLastUniqueKey1);
            _model.requestCompleted1 = false;
          });
          await _model.waitForRequestCompleted1();
          if (FFAppState().recentlyDeletedReport != null &&
              FFAppState().recentlyDeletedReport != '') {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  FFLocalizations.of(context).getVariableText(
                    enText: 'Report deleted',
                    esText: 'Reporte eliminado',
                  ),
                  style: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                ),
                duration: Duration(milliseconds: 3000),
                backgroundColor: FlutterFlowTheme.of(context).error,
                action: SnackBarAction(
                  label: FFLocalizations.of(context).getVariableText(
                    enText: 'Recover',
                    esText: 'Recuperar',
                  ),
                  textColor: FlutterFlowTheme.of(context).primaryText,
                  onPressed: () async {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      barrierColor: Colors.transparent,
                      enableDrag: false,
                      context: context,
                      builder: (context) {
                        return GestureDetector(
                          onTap: () =>
                              FocusScope.of(context).requestFocus(_unfocusNode),
                          child: Padding(
                            padding: MediaQuery.of(context).viewInsets,
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.0,
                              child: UndoDeleteRecordWidget(),
                            ),
                          ),
                        );
                      },
                    ).then((value) => setState(() {}));
                  },
                ),
              ),
            );
          }
          FFAppState().update(() {
            FFAppState().refreshReports = false;
          });
        }
        if (FFAppState().biometricAuth) {
          final _localAuth = LocalAuthentication();
          bool _isBiometricSupported = await _localAuth.isDeviceSupported();

          if (_isBiometricSupported) {
            _model.biometricPassed = await _localAuth.authenticate(
                localizedReason: FFLocalizations.of(context).getText(
              'ziy78ugb' /* Please authenticate to access */,
            ));
            setState(() {});
          }

          if (_model.biometricPassed!) {
            if (FFAppState().justOpenedTheApp) {
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
                        height: 250.0,
                        child: PanicAttackReportWidget(),
                      ),
                    ),
                  );
                },
              ).then((value) => setState(() {}));

              FFAppState().update(() {
                FFAppState().justOpenedTheApp = false;
              });
            }
          } else {
            await showDialog(
              context: context,
              builder: (alertDialogContext) {
                return AlertDialog(
                  title: Text('Biometric Failed'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(alertDialogContext),
                      child: Text('Ok'),
                    ),
                  ],
                );
              },
            );
          }
        } else {
          if (FFAppState().justOpenedTheApp) {
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
                      height: 250.0,
                      child: PanicAttackReportWidget(),
                    ),
                  ),
                );
              },
            ).then((value) => setState(() {}));

            FFAppState().update(() {
              FFAppState().justOpenedTheApp = false;
            });
          }
        }
      } else {
        context.pushNamedAuth('UserInfo', context.mounted);
      }
    });

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
        title: 'MainPage',
        color: FlutterFlowTheme.of(context).primary,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () async {
                await showModalBottomSheet(
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
                          height: MediaQuery.of(context).size.height * 0.8,
                          child: PanicAttackDataWidget(),
                        ),
                      ),
                    );
                  },
                ).then((value) => setState(() {}));
              },
              backgroundColor: FlutterFlowTheme.of(context).tertiary,
              icon: FaIcon(
                FontAwesomeIcons.exclamationCircle,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 25.0,
              ),
              elevation: 8.0,
              label: Text(
                FFLocalizations.of(context).getText(
                  'f3g1htjq' /* Log panic attack */,
                ),
                style: FlutterFlowTheme.of(context).titleMedium,
              ),
            ).animateOnPageLoad(
                animationsMap['floatingActionButtonOnPageLoadAnimation']!),
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              title: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onDoubleTap: () async {
                  FFAppState().update(() {
                    FFAppState().debug = !FFAppState().debug;
                  });
                },
                child: Text(
                  FFLocalizations.of(context).getText(
                    '3hi10kxx' /* Home */,
                  ),
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).secondary,
                        fontSize: 22.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
              actions: [
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: wrapWithModel(
                    model: _model.debugBtnModel,
                    updateCallback: () => setState(() {}),
                    child: DebugBtnWidget(),
                  ),
                ),
              ],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: Align(
              alignment: AlignmentDirectional(0.0, -1.0),
              child: RefreshIndicator(
                onRefresh: () async {
                  FFAppState().clearLatestReportsCache();
                  FFAppState().clearReportsSummaryCache();
                  setState(() {
                    FFAppState().clearLatestReportsCacheKey(
                        _model.requestLastUniqueKey1);
                    _model.requestCompleted1 = false;
                  });
                  await _model.waitForRequestCompleted1();
                  setState(() {
                    FFAppState().clearReportsSummaryCacheKey(
                        _model.requestLastUniqueKey2);
                    _model.requestCompleted2 = false;
                  });
                  await _model.waitForRequestCompleted2();
                },
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                        child: FutureBuilder<List<AttackReportsRow>>(
                          future: FFAppState()
                              .latestReports(
                            uniqueQueryKey: dateTimeFromSecondsSinceEpoch(
                                    functions.unixTrunc(
                                        getCurrentTimestamp.secondsSinceEpoch,
                                        3600))
                                .toString(),
                            requestFn: () => AttackReportsTable().queryRows(
                              queryFn: (q) => q
                                  .eq(
                                    'deleted',
                                    false,
                                  )
                                  .order('created_at'),
                              limit: 7,
                            ),
                          )
                              .then((result) {
                            try {
                              _model.requestCompleted1 = true;
                              _model.requestLastUniqueKey1 =
                                  dateTimeFromSecondsSinceEpoch(
                                          functions.unixTrunc(
                                              getCurrentTimestamp
                                                  .secondsSinceEpoch,
                                              3600))
                                      .toString();
                            } finally {}
                            return result;
                          }),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: SpinKitThreeBounce(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
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
                                  columnAttackReportsRowList.length,
                                  (columnIndex) {
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
                                      if (Navigator.of(context).canPop()) {
                                        context.pop();
                                      }
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
                                        borderRadius:
                                            BorderRadius.circular(8.0),
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
                                                if (columnAttackReportsRow
                                                        .rate <
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
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      functions.capitalize(
                                                          dateTimeFormat(
                                                        'relative',
                                                        columnAttackReportsRow
                                                            .createdAt!,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      )),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleLarge,
                                                    ),
                                                    Text(
                                                      '(${dateTimeFormat(
                                                        'MMMEd',
                                                        columnAttackReportsRow
                                                            .createdAt,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      )})',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            if (columnAttackReportsRow.notes !=
                                                    null &&
                                                columnAttackReportsRow.notes !=
                                                    '')
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 0.0, 0.0),
                                                child: FaIcon(
                                                  FontAwesomeIcons.stickyNote,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  size: 16.0,
                                                ),
                                              ),
                                            if (columnAttackReportsRow
                                                        .location !=
                                                    null &&
                                                columnAttackReportsRow
                                                        .location !=
                                                    '')
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 0.0, 0.0),
                                                child: FaIcon(
                                                  FontAwesomeIcons.mapMarkerAlt,
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
                      FutureBuilder<List<AttackReportsSummaryRow>>(
                        future: FFAppState()
                            .reportsSummary(
                          uniqueQueryKey: dateTimeFromSecondsSinceEpoch(
                                  functions.unixTrunc(
                                      getCurrentTimestamp.secondsSinceEpoch,
                                      3600))
                              .toString(),
                          requestFn: () =>
                              AttackReportsSummaryTable().queryRows(
                            queryFn: (q) => q.order('start_time'),
                            limit: 24,
                          ),
                        )
                            .then((result) {
                          try {
                            _model.requestCompleted2 = true;
                            _model.requestLastUniqueKey2 =
                                dateTimeFromSecondsSinceEpoch(
                                        functions.unixTrunc(
                                            getCurrentTimestamp
                                                .secondsSinceEpoch,
                                            3600))
                                    .toString();
                          } finally {}
                          return result;
                        }),
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
                          List<AttackReportsSummaryRow>
                              pageViewAttackReportsSummaryRowList =
                              snapshot.data!;
                          return Container(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.4,
                            child: Stack(
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 40.0),
                                  child: PageView.builder(
                                    controller: _model.pageViewController ??=
                                        PageController(
                                            initialPage: min(
                                                0,
                                                pageViewAttackReportsSummaryRowList
                                                        .length -
                                                    1)),
                                    scrollDirection: Axis.vertical,
                                    itemCount:
                                        pageViewAttackReportsSummaryRowList
                                            .length,
                                    itemBuilder: (context, pageViewIndex) {
                                      final pageViewAttackReportsSummaryRow =
                                          pageViewAttackReportsSummaryRowList[
                                              pageViewIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            32.0, 5.0, 32.0, 5.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              'MonthDetails',
                                              queryParameters: {
                                                'monthDetails': serializeParam(
                                                  pageViewAttackReportsSummaryRow,
                                                  ParamType.SupabaseRow,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Card(
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            elevation: 4.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      8.0, 8.0, 16.0, 8.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  FaIcon(
                                                    FontAwesomeIcons
                                                        .solidCircle,
                                                    color: () {
                                                      if (pageViewAttackReportsSummaryRow
                                                              .rate! <
                                                          20.0) {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .secondary;
                                                      } else if (pageViewAttackReportsSummaryRow
                                                              .rate! <
                                                          50.0) {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .warning;
                                                      } else {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .error;
                                                      }
                                                    }(),
                                                    size: 8.0,
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            functions.dateToMonthsAgo(
                                                                pageViewAttackReportsSummaryRow
                                                                    .startTime!,
                                                                3,
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .languageCode),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleLarge,
                                                          ),
                                                          Text(
                                                            '(${pageViewAttackReportsSummaryRow.rate?.toString()})',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                0.0, 0.0),
                                                    child: FaIcon(
                                                      FontAwesomeIcons
                                                          .stickyNote,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      size: 16.0,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                0.0, 0.0),
                                                    child: FaIcon(
                                                      FontAwesomeIcons
                                                          .mapMarkerAlt,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                    },
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 16.0, 16.0, 16.0),
                                    child: smooth_page_indicator
                                        .SmoothPageIndicator(
                                      controller: _model.pageViewController ??=
                                          PageController(
                                              initialPage: min(
                                                  0,
                                                  pageViewAttackReportsSummaryRowList
                                                          .length -
                                                      1)),
                                      count: pageViewAttackReportsSummaryRowList
                                          .length,
                                      axisDirection: Axis.vertical,
                                      onDotClicked: (i) async {
                                        await _model.pageViewController!
                                            .animateToPage(
                                          i,
                                          duration: Duration(milliseconds: 500),
                                          curve: Curves.ease,
                                        );
                                      },
                                      effect: smooth_page_indicator
                                          .ExpandingDotsEffect(
                                        expansionFactor: 3.0,
                                        spacing: 8.0,
                                        radius: 16.0,
                                        dotWidth: 16.0,
                                        dotHeight: 8.0,
                                        dotColor: FlutterFlowTheme.of(context)
                                            .accent1,
                                        activeDotColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                        paintStyle: PaintingStyle.fill,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 1.0,
                        height: 100.0,
                        decoration: BoxDecoration(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
