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
import 'panic_attack_data_model.dart';
export 'panic_attack_data_model.dart';

class PanicAttackDataWidget extends StatefulWidget {
  const PanicAttackDataWidget({Key? key}) : super(key: key);

  @override
  _PanicAttackDataWidgetState createState() => _PanicAttackDataWidgetState();
}

class _PanicAttackDataWidgetState extends State<PanicAttackDataWidget> {
  late PanicAttackDataModel _model;

  LatLng? currentUserLocationValue;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PanicAttackDataModel());

    _model.textController ??= TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
          _model.textController?.text = FFLocalizations.of(context).getText(
            'b7c2ouao' /*  */,
          );
        }));
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
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  Flexible(
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'ihhiynkd' /* First things first */,
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).titleLarge,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 5.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '4qodrrwm' /* Do you believe you may be in d... */,
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).labelMedium,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 10.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        FlutterFlowIconButton(
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          borderRadius: 100.0,
                                          borderWidth: 1.0,
                                          buttonSize: 70.0,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .error,
                                          icon: FaIcon(
                                            FontAwesomeIcons.briefcaseMedical,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 35.0,
                                          ),
                                          onPressed: () async {
                                            await launchUrl(Uri(
                                              scheme: 'tel',
                                              path: '911',
                                            ));
                                          },
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            '2cntggpo' /* Emergency services */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        FlutterFlowIconButton(
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          borderRadius: 100.0,
                                          borderWidth: 1.0,
                                          buttonSize: 70.0,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                          icon: FaIcon(
                                            FontAwesomeIcons.userFriends,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 30.0,
                                          ),
                                          onPressed: () async {
                                            await launchUrl(Uri(
                                              scheme: 'tel',
                                              path: '0',
                                            ));
                                          },
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'muoj3wwx' /* Call someone */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  'me6q0onn' /* Asking for help is ok */,
                                ),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              Divider(
                                thickness: 1.0,
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 5.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'v86z62py' /* Now some questions */,
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).titleLarge,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'd2klgg0a' /* How bad is your panic attack? */,
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).titleMedium,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 5.0),
                                child: Slider.adaptive(
                                  activeColor:
                                      FlutterFlowTheme.of(context).secondary,
                                  inactiveColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  min: 0.0,
                                  max: 100.0,
                                  value: _model.sliderPanicRateValue ??= 0.0,
                                  label: _model.sliderPanicRateValue.toString(),
                                  divisions: 100,
                                  onChanged: (newValue) {
                                    newValue = double.parse(
                                        newValue.toStringAsFixed(0));
                                    setState(() =>
                                        _model.sliderPanicRateValue = newValue);
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 5.0),
                                child: SwitchListTile.adaptive(
                                  value: _model.switchListTileSafeValue ??=
                                      false,
                                  onChanged: (newValue) async {
                                    setState(() => _model
                                        .switchListTileSafeValue = newValue!);
                                  },
                                  title: Text(
                                    FFLocalizations.of(context).getText(
                                      'ln60dj4c' /* I feel safe */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium,
                                  ),
                                  subtitle: Text(
                                    FFLocalizations.of(context).getText(
                                      '1jvfqa2h' /* I am at home or some place saf... */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 12.0,
                                        ),
                                  ),
                                  tileColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  activeColor:
                                      FlutterFlowTheme.of(context).secondary,
                                  activeTrackColor:
                                      FlutterFlowTheme.of(context).accent1,
                                  dense: false,
                                  controlAffinity:
                                      ListTileControlAffinity.trailing,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 5.0),
                                child: SwitchListTile.adaptive(
                                  value: _model
                                      .switchListTileAccompaniedValue ??= false,
                                  onChanged: (newValue) async {
                                    setState(() =>
                                        _model.switchListTileAccompaniedValue =
                                            newValue!);
                                  },
                                  title: Text(
                                    FFLocalizations.of(context).getText(
                                      '9fbe62ju' /* I am accompanied */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium,
                                  ),
                                  subtitle: Text(
                                    FFLocalizations.of(context).getText(
                                      'ttrrcw6r' /* I am with someone else I can t... */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 12.0,
                                        ),
                                  ),
                                  tileColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  activeColor:
                                      FlutterFlowTheme.of(context).secondary,
                                  activeTrackColor:
                                      FlutterFlowTheme.of(context).accent1,
                                  dense: false,
                                  controlAffinity:
                                      ListTileControlAffinity.trailing,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 5.0),
                                child: SwitchListTile.adaptive(
                                  value: _model
                                          .switchListTileIdentifySourceValue ??=
                                      false,
                                  onChanged: (newValue) async {
                                    setState(() => _model
                                            .switchListTileIdentifySourceValue =
                                        newValue!);
                                  },
                                  title: Text(
                                    FFLocalizations.of(context).getText(
                                      'bpiql702' /* I can identify the source */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  subtitle: Text(
                                    FFLocalizations.of(context).getText(
                                      'svo7apsj' /* I know what the source of the ... */,
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).labelSmall,
                                  ),
                                  tileColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  activeColor:
                                      FlutterFlowTheme.of(context).secondary,
                                  activeTrackColor:
                                      FlutterFlowTheme.of(context).accent1,
                                  dense: false,
                                  controlAffinity:
                                      ListTileControlAffinity.trailing,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 5.0),
                                child: SwitchListTile.adaptive(
                                  value: _model.switchListTileGetAwayValue ??=
                                      false,
                                  onChanged: (newValue) async {
                                    setState(() =>
                                        _model.switchListTileGetAwayValue =
                                            newValue!);
                                  },
                                  title: Text(
                                    FFLocalizations.of(context).getText(
                                      '3uguszjh' /* I can get away from the situat... */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  subtitle: Text(
                                    FFLocalizations.of(context).getText(
                                      'fqxo92h5' /* I can go someplace else to unw... */,
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).labelSmall,
                                  ),
                                  tileColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  activeColor:
                                      FlutterFlowTheme.of(context).secondary,
                                  activeTrackColor:
                                      FlutterFlowTheme.of(context).accent1,
                                  dense: false,
                                  controlAffinity:
                                      ListTileControlAffinity.trailing,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 5.0),
                                child: SwitchListTile.adaptive(
                                  value: _model.switchListTileCanActValue ??=
                                      false,
                                  onChanged: (newValue) async {
                                    setState(() => _model
                                        .switchListTileCanActValue = newValue!);
                                  },
                                  title: Text(
                                    FFLocalizations.of(context).getText(
                                      'arwak9kb' /* Theres something I can do */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  subtitle: Text(
                                    FFLocalizations.of(context).getText(
                                      '985h5wx4' /* I can do something to change t... */,
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).labelSmall,
                                  ),
                                  tileColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  activeColor:
                                      FlutterFlowTheme.of(context).secondary,
                                  activeTrackColor:
                                      FlutterFlowTheme.of(context).accent1,
                                  dense: false,
                                  controlAffinity:
                                      ListTileControlAffinity.trailing,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 5.0),
                                child: SwitchListTile.adaptive(
                                  value: _model.switchListTileToPeopleValue ??=
                                      false,
                                  onChanged: (newValue) async {
                                    setState(() =>
                                        _model.switchListTileToPeopleValue =
                                            newValue!);
                                  },
                                  title: Text(
                                    FFLocalizations.of(context).getText(
                                      '87mbf3mn' /* The panic is related to people */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  subtitle: Text(
                                    FFLocalizations.of(context).getText(
                                      'n249hdej' /* My anxiety is related to a spe... */,
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).labelSmall,
                                  ),
                                  tileColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  activeColor:
                                      FlutterFlowTheme.of(context).secondary,
                                  activeTrackColor:
                                      FlutterFlowTheme.of(context).accent1,
                                  dense: false,
                                  controlAffinity:
                                      ListTileControlAffinity.trailing,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 20.0),
                                child: TextFormField(
                                  controller: _model.textController,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.textController',
                                    Duration(milliseconds: 2000),
                                    () => setState(() {}),
                                  ),
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText:
                                        FFLocalizations.of(context).getText(
                                      '39cthwuf' /* My notes */,
                                    ),
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                        ),
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      '1nwsgm41' /*  */,
                                    ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontStyle: FontStyle.italic,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    filled: true,
                                    suffixIcon: _model
                                            .textController!.text.isNotEmpty
                                        ? InkWell(
                                            onTap: () async {
                                              _model.textController?.clear();
                                              setState(() {});
                                            },
                                            child: Icon(
                                              Icons.clear,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 35.0,
                                            ),
                                          )
                                        : null,
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  textAlign: TextAlign.start,
                                  maxLines: 5,
                                  minLines: 5,
                                  validator: _model.textControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    80.0, 0.0, 80.0, 40.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    currentUserLocationValue =
                                        await getCurrentUserLocation(
                                            defaultLocation: LatLng(0.0, 0.0));
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          content: Text(
                                              currentUserLocationValue!
                                                  .toString()),
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
                                    _model.insertResponse =
                                        await AttackReportsTable().insert({
                                      'user_id': currentUserUid,
                                      'rate': functions.floatToInt(
                                          _model.sliderPanicRateValue!),
                                      'safe': _model.switchListTileSafeValue,
                                      'accompanied':
                                          _model.switchListTileAccompaniedValue,
                                      'identify_source': _model
                                          .switchListTileIdentifySourceValue,
                                      'get_away':
                                          _model.switchListTileGetAwayValue,
                                      'can_act':
                                          _model.switchListTileCanActValue,
                                      'related_to_people':
                                          _model.switchListTileToPeopleValue,
                                      'location': FFAppState().logLocation
                                          ? currentUserLocationValue?.toString()
                                          : null,
                                      'notes': _model.textController.text,
                                    });
                                    Navigator.pop(context);
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                              MediaQuery.of(context).viewInsets,
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.8,
                                            child: PanicAttackQuestionsWidget(
                                              reportId:
                                                  _model.insertResponse!.id,
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => setState(() {}));

                                    setState(() {});
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'wze64nv8' /* Submit */,
                                  ),
                                  options: FFButtonOptions(
                                    width: 4.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 20.0, 24.0, 20.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleMedium,
                                    elevation: 3.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
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
