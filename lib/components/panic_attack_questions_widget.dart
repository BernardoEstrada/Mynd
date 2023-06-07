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
import 'panic_attack_questions_model.dart';
export 'panic_attack_questions_model.dart';

class PanicAttackQuestionsWidget extends StatefulWidget {
  const PanicAttackQuestionsWidget({
    Key? key,
    required this.reportId,
  }) : super(key: key);

  final String? reportId;

  @override
  _PanicAttackQuestionsWidgetState createState() =>
      _PanicAttackQuestionsWidgetState();
}

class _PanicAttackQuestionsWidgetState
    extends State<PanicAttackQuestionsWidget> {
  late PanicAttackQuestionsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PanicAttackQuestionsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
        child: Material(
          color: Colors.transparent,
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
          ),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
            ),
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 0.0),
                          child: Container(
                            width: 50.0,
                            height: 4.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).secondaryText,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Builder(
                              builder: (context) => FutureBuilder<
                                  List<QuestionsUnexpiredRandomRow>>(
                                future: FFAppState().questionsLatest(
                                  uniqueQueryKey: widget.reportId,
                                  requestFn: () =>
                                      QuestionsUnexpiredRandomTable().queryRows(
                                    queryFn: (q) => q.eq(
                                      'lang',
                                      FFAppState().preferredLang,
                                    ),
                                    limit: 5,
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
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          size: 50.0,
                                        ),
                                      ),
                                    );
                                  }
                                  List<QuestionsUnexpiredRandomRow>
                                      swipeableStackQuestionsUnexpiredRandomRowList =
                                      snapshot.data!;
                                  if (swipeableStackQuestionsUnexpiredRandomRowList
                                      .isEmpty) {
                                    return Center(
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                1.0,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                1.0,
                                        child: ThanksForAnweringWidget(),
                                      ),
                                    );
                                  }
                                  return FlutterFlowSwipeableStack(
                                    topCardHeightFraction: 0.72,
                                    middleCardHeightFraction: 0.68,
                                    bottomCardHeightFraction: 0.75,
                                    topCardWidthFraction: 0.9,
                                    middleCardWidthFraction: 0.85,
                                    bottomCardWidthFraction: 0.8,
                                    onSwipeFn: (index) {},
                                    onLeftSwipe: (index) {},
                                    onRightSwipe: (index) async {
                                      final swipeableStackQuestionsUnexpiredRandomRow =
                                          swipeableStackQuestionsUnexpiredRandomRowList[
                                              index];
                                      if (swipeableStackQuestionsUnexpiredRandomRowList[
                                                      index]
                                                  ?.id !=
                                              null &&
                                          swipeableStackQuestionsUnexpiredRandomRowList[
                                                      index]
                                                  ?.id !=
                                              '') {
                                        if (swipeableStackQuestionsUnexpiredRandomRowList[
                                                    index]
                                                ?.type ==
                                            'bool') {
                                          await ResponsesBoolTable().insert({
                                            'question_id':
                                                swipeableStackQuestionsUnexpiredRandomRowList[
                                                        index]
                                                    ?.id,
                                            'value': _model.questionInputModels
                                                .getValueForKey(
                                              'input_${swipeableStackQuestionsUnexpiredRandomRowList[index]?.id}',
                                              (m) => m.boolInputValue,
                                            ),
                                            'report_id': widget.reportId,
                                          });
                                        } else {
                                          if (swipeableStackQuestionsUnexpiredRandomRowList[
                                                      index]
                                                  ?.type ==
                                              'int8') {
                                            await ResponsesInt8Table().insert({
                                              'question_id':
                                                  swipeableStackQuestionsUnexpiredRandomRowList[
                                                          index]
                                                      ?.id,
                                              'value':
                                                  functions.parseIntFromString(
                                                      _model.questionInputModels
                                                          .getValueForKey(
                                                'input_${swipeableStackQuestionsUnexpiredRandomRowList[index]?.id}',
                                                (m) =>
                                                    m.int8InputController.text,
                                              )),
                                              'report_id': widget.reportId,
                                            });
                                          } else {
                                            if (swipeableStackQuestionsUnexpiredRandomRowList[
                                                        index]
                                                    ?.type ==
                                                'float8') {
                                              await ResponsesFloat8Table()
                                                  .insert({
                                                'question_id':
                                                    swipeableStackQuestionsUnexpiredRandomRowList[
                                                            index]
                                                        ?.id,
                                                'value': functions
                                                    .parseDoubleFromString(
                                                        _model
                                                            .questionInputModels
                                                            .getValueForKey(
                                                  'input_${swipeableStackQuestionsUnexpiredRandomRowList[index]?.id}',
                                                  (m) => m.float8InputController
                                                      .text,
                                                )),
                                                'report_id': widget.reportId,
                                              });
                                            } else {
                                              if (swipeableStackQuestionsUnexpiredRandomRowList[
                                                          index]
                                                      ?.type ==
                                                  'text') {
                                                await ResponsesTextTable()
                                                    .insert({
                                                  'question_id':
                                                      swipeableStackQuestionsUnexpiredRandomRowList[
                                                              index]
                                                          ?.id,
                                                  'value': _model
                                                      .questionInputModels
                                                      .getValueForKey(
                                                    'input_${swipeableStackQuestionsUnexpiredRandomRowList[index]?.id}',
                                                    (m) => m.textInputController
                                                        .text,
                                                  ),
                                                  'report_id': widget.reportId,
                                                });
                                              }
                                            }
                                          }
                                        }
                                      } else {
                                        return;
                                      }
                                    },
                                    onUpSwipe: (index) {},
                                    onDownSwipe: (index) async {
                                      final swipeableStackQuestionsUnexpiredRandomRow =
                                          swipeableStackQuestionsUnexpiredRandomRowList[
                                              index];
                                      await showAlignedDialog(
                                        barrierDismissible: false,
                                        context: context,
                                        isGlobal: true,
                                        avoidOverflow: true,
                                        targetAnchor:
                                            AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        followerAnchor:
                                            AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        builder: (dialogContext) {
                                          return Material(
                                            color: Colors.transparent,
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.6,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.8,
                                              child: SelectReportWidget(
                                                questionId:
                                                    swipeableStackQuestionsUnexpiredRandomRowList[
                                                            index]!
                                                        .id!,
                                                question:
                                                    swipeableStackQuestionsUnexpiredRandomRowList[
                                                            index]!
                                                        .question!,
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => setState(() {}));
                                    },
                                    itemBuilder:
                                        (context, swipeableStackIndex) {
                                      final swipeableStackQuestionsUnexpiredRandomRow =
                                          swipeableStackQuestionsUnexpiredRandomRowList[
                                              swipeableStackIndex];
                                      return Card(
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        elevation: 4.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 20.0, 10.0, 20.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Spacer(),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.05, -0.6),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 10.0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        swipeableStackQuestionsUnexpiredRandomRow
                                                            .question,
                                                        'Unknown Question',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleLarge,
                                                    ),
                                                  ),
                                                ),
                                                Builder(
                                                  builder: (context) {
                                                    final typeArr = functions
                                                        .questionToArr(
                                                            QuestionStruct(
                                                          id: swipeableStackQuestionsUnexpiredRandomRow
                                                              .id,
                                                          question:
                                                              swipeableStackQuestionsUnexpiredRandomRow
                                                                  .question,
                                                          type:
                                                              swipeableStackQuestionsUnexpiredRandomRow
                                                                  .type,
                                                        ))
                                                        .toList();
                                                    return Stack(
                                                      children: List.generate(
                                                          typeArr.length,
                                                          (typeArrIndex) {
                                                        final typeArrItem =
                                                            typeArr[
                                                                typeArrIndex];
                                                        return wrapWithModel(
                                                          model: _model
                                                              .questionInputModels
                                                              .getModel(
                                                            'input_${typeArrItem.id}',
                                                            typeArrIndex,
                                                          ),
                                                          updateCallback: () =>
                                                              setState(() {}),
                                                          updateOnChange: true,
                                                          child:
                                                              QuestionInputWidget(
                                                            key: Key(
                                                              'Keyjlx_${'input_${typeArrItem.id}'}',
                                                            ),
                                                            type: typeArrItem
                                                                .type,
                                                            questionId:
                                                                typeArrItem.id,
                                                          ),
                                                        );
                                                      }),
                                                    );
                                                  },
                                                ),
                                                Spacer(),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 10.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      FlutterFlowIconButton(
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderRadius: 35.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 70.0,
                                                        fillColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        icon: FaIcon(
                                                          FontAwesomeIcons
                                                              .forward,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 35.0,
                                                        ),
                                                        onPressed: () async {
                                                          _model
                                                              .swipeableStackController
                                                              .triggerSwipeLeft();
                                                        },
                                                      ),
                                                      FlutterFlowIconButton(
                                                        borderRadius: 25.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 50.0,
                                                        fillColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        icon: FaIcon(
                                                          FontAwesomeIcons.flag,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 25.0,
                                                        ),
                                                        onPressed: () async {
                                                          _model
                                                              .swipeableStackController
                                                              .triggerSwipeDown();
                                                        },
                                                      ),
                                                      FlutterFlowIconButton(
                                                        borderRadius: 35.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 70.0,
                                                        fillColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        icon: FaIcon(
                                                          FontAwesomeIcons
                                                              .arrowRight,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 35.0,
                                                        ),
                                                        onPressed: () async {
                                                          _model
                                                              .swipeableStackController
                                                              .triggerSwipeRight();
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    itemCount:
                                        swipeableStackQuestionsUnexpiredRandomRowList
                                            .length,
                                    controller: _model.swipeableStackController,
                                    enableSwipeUp: false,
                                    enableSwipeDown: true,
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
