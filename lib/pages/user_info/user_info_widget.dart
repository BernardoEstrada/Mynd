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
import 'user_info_model.dart';
export 'user_info_model.dart';

class UserInfoWidget extends StatefulWidget {
  const UserInfoWidget({
    Key? key,
    bool? canBeAnonymous,
  })  : this.canBeAnonymous = canBeAnonymous ?? true,
        super(key: key);

  final bool canBeAnonymous;

  @override
  _UserInfoWidgetState createState() => _UserInfoWidgetState();
}

class _UserInfoWidgetState extends State<UserInfoWidget> {
  late UserInfoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserInfoModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (currentUserUid == null || currentUserUid == '') {
        GoRouter.of(context).prepareAuthEvent();

        final user = await authManager.signInWithEmail(
          context,
          FFAppState().AnonymousUserLogin.email,
          FFAppState().AnonymousUserLogin.pass,
        );
        if (user == null) {
          return;
        }

        setState(() {
          FFAppState()
              .clearUserIdOnDataTableCacheKey(_model.requestLastUniqueKey);
          _model.requestCompleted = false;
        });
        await _model.waitForRequestCompleted();
      }
      if (_model.switchUserExistsCheckValue!) {
        context.goNamedAuth('MainPage', context.mounted);
      } else {
        return;
      }
    });

    _model.textAgeController ??= TextEditingController();
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

    return FutureBuilder<List<UserDataRow>>(
      future: FFAppState()
          .userIdOnDataTable(
        uniqueQueryKey:
            '${currentUserUid}${FFAppState().completedDataEntry.toString()}',
        requestFn: () => UserDataTable().querySingleRow(
          queryFn: (q) => q.eq(
            'id',
            currentUserUid,
          ),
        ),
      )
          .then((result) {
        try {
          _model.requestCompleted = true;
          _model.requestLastUniqueKey =
              '${currentUserUid}${FFAppState().completedDataEntry.toString()}';
        } finally {}
        return result;
      }),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
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
        List<UserDataRow> userInfoUserDataRowList = snapshot.data!;
        final userInfoUserDataRow = userInfoUserDataRowList.isNotEmpty
            ? userInfoUserDataRowList.first
            : null;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
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
              actions: [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: SvgPicture.asset(
                                      'assets/images/g-logo-bold.svg',
                                      width: 50.0,
                                      height: 50.0,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                if (false)
                                  Switch.adaptive(
                                    value: _model.switchUserExistsCheckValue ??=
                                        userInfoUserDataRow?.id ==
                                            currentUserUid,
                                    onChanged: (newValue) async {
                                      setState(() =>
                                          _model.switchUserExistsCheckValue =
                                              newValue!);
                                    },
                                    activeColor:
                                        FlutterFlowTheme.of(context).primary,
                                    activeTrackColor:
                                        FlutterFlowTheme.of(context).accent1,
                                    inactiveTrackColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    inactiveThumbColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryText,
                                  ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 0.0, 0.0),
                          child: GradientText(
                            FFLocalizations.of(context).getText(
                              '4qayjnv9' /* About you */,
                            ),
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context).headlineMedium,
                            colors: [
                              FlutterFlowTheme.of(context).secondary,
                              FlutterFlowTheme.of(context).primaryText
                            ],
                            gradientDirection: GradientDirection.ltr,
                            gradientType: GradientType.linear,
                          ),
                        ),
                        Divider(
                          thickness: 2.0,
                          indent: 20.0,
                          endIndent: 20.0,
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Form(
                              key: _model.formKey,
                              autovalidateMode: AutovalidateMode.disabled,
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      30.0, 0.0, 30.0, 0.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'duhn6iei' /* General Information */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .titleLarge,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 0.0, 5.0),
                                          child: TextFormField(
                                            controller:
                                                _model.textAgeController,
                                            textCapitalization:
                                                TextCapitalization.none,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                'e9z9mcic' /* Age */,
                                              ),
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                      ),
                                              hintStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    fontSize: 14.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              filled: true,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              contentPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 24.0,
                                                          20.0, 24.0),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .titleSmall
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                            maxLines: null,
                                            keyboardType: TextInputType.number,
                                            validator: _model
                                                .textAgeControllerValidator
                                                .asValidator(context),
                                            inputFormatters: [
                                              FilteringTextInputFormatter.allow(
                                                  RegExp('[0-9]'))
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 0.0, 5.0),
                                          child: FutureBuilder<
                                              List<GendersByLangRow>>(
                                            future:
                                                FFAppState().availableGenders(
                                              uniqueQueryKey: '${formatNumber(
                                                getCurrentTimestamp
                                                    .secondsSinceEpoch,
                                                formatType: FormatType.custom,
                                                format: '0000E0',
                                                locale: 'en_us',
                                              )}${FFLocalizations.of(context).languageCode}',
                                              requestFn: () =>
                                                  GendersByLangTable()
                                                      .queryRows(
                                                queryFn: (q) => q.eq(
                                                  'iso_639_1',
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                                ),
                                              ),
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 11.0,
                                                                0.0, 11.0),
                                                    child: SizedBox(
                                                      width: 40.0,
                                                      height: 40.0,
                                                      child: SpinKitThreeBounce(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        size: 40.0,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<GendersByLangRow>
                                                  dropDownGenderGendersByLangRowList =
                                                  snapshot.data!;
                                              return FlutterFlowDropDown<
                                                  String>(
                                                controller: _model
                                                        .dropDownGenderValueController ??=
                                                    FormFieldController<String>(
                                                        null),
                                                options:
                                                    dropDownGenderGendersByLangRowList
                                                        .map((e) => e.id)
                                                        .withoutNulls
                                                        .toList(),
                                                optionLabels:
                                                    dropDownGenderGendersByLangRowList
                                                        .map((e) => e.value)
                                                        .withoutNulls
                                                        .toList(),
                                                onChanged: (val) => setState(() =>
                                                    _model.dropDownGenderValue =
                                                        val),
                                                height: 62.0,
                                                searchHintTextStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                        ),
                                                hintText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'e9qk5hr5' /* Gender */,
                                                ),
                                                searchHintText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'ka7wba5o' /* Search for an item... */,
                                                ),
                                                icon: FaIcon(
                                                  FontAwesomeIcons.chevronDown,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 18.0,
                                                ),
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                elevation: 2.0,
                                                borderColor: Colors.transparent,
                                                borderWidth: 0.0,
                                                borderRadius: 8.0,
                                                margin: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                hidesUnderline: true,
                                                isSearchable: false,
                                              );
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 0.0, 5.0),
                                          child:
                                              FutureBuilder<List<CountriesRow>>(
                                            future: FFAppState().allCountries(
                                              requestFn: () =>
                                                  CountriesTable().queryRows(
                                                queryFn: (q) => q,
                                              ),
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 11.0,
                                                                0.0, 11.0),
                                                    child: SizedBox(
                                                      width: 40.0,
                                                      height: 40.0,
                                                      child: SpinKitThreeBounce(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        size: 40.0,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<CountriesRow>
                                                  dropDownCountryCountriesRowList =
                                                  snapshot.data!;
                                              return FlutterFlowDropDown<int>(
                                                controller: _model
                                                        .dropDownCountryValueController ??=
                                                    FormFieldController<int>(
                                                  _model.dropDownCountryValue ??=
                                                      142,
                                                ),
                                                options:
                                                    dropDownCountryCountriesRowList
                                                        .map((e) => e.id)
                                                        .toList(),
                                                optionLabels:
                                                    dropDownCountryCountriesRowList
                                                        .map((e) => e.name)
                                                        .withoutNulls
                                                        .toList(),
                                                onChanged: (val) => setState(() =>
                                                    _model.dropDownCountryValue =
                                                        val),
                                                height: 62.0,
                                                searchHintTextStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 16.0,
                                                        ),
                                                hintText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '0le1ximb' /* Country */,
                                                ),
                                                searchHintText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '0zlj6cpq' /* Search for an item... */,
                                                ),
                                                icon: FaIcon(
                                                  FontAwesomeIcons.chevronDown,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 18.0,
                                                ),
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                elevation: 2.0,
                                                borderColor: Colors.transparent,
                                                borderWidth: 0.0,
                                                borderRadius: 8.0,
                                                margin: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 16.0, 0.0),
                                                hidesUnderline: true,
                                                isSearchable: true,
                                              );
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 0.0, 5.0),
                                          child: FutureBuilder<List<StatesRow>>(
                                            future: FFAppState().allStates(
                                              uniqueQueryKey:
                                                  'states_${_model.dropDownCountryValue?.toString()}',
                                              requestFn: () =>
                                                  StatesTable().queryRows(
                                                queryFn: (q) => q.eq(
                                                  'country_id',
                                                  _model.dropDownCountryValue,
                                                ),
                                              ),
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 11.0,
                                                                0.0, 11.0),
                                                    child: SizedBox(
                                                      width: 40.0,
                                                      height: 40.0,
                                                      child: SpinKitThreeBounce(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        size: 40.0,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<StatesRow>
                                                  dropDownStateStatesRowList =
                                                  snapshot.data!;
                                              return FlutterFlowDropDown<int>(
                                                controller: _model
                                                        .dropDownStateValueController ??=
                                                    FormFieldController<int>(
                                                  _model.dropDownStateValue ??=
                                                      _model.dropDownCountryValue !=
                                                              null
                                                          ? _model
                                                              .dropDownCountryValue
                                                          : 142,
                                                ),
                                                options:
                                                    dropDownStateStatesRowList
                                                        .map((e) => e.id)
                                                        .toList(),
                                                optionLabels:
                                                    dropDownStateStatesRowList
                                                        .map((e) => e.name)
                                                        .withoutNulls
                                                        .toList(),
                                                onChanged: (val) => setState(
                                                    () => _model
                                                            .dropDownStateValue =
                                                        val),
                                                height: 62.0,
                                                searchHintTextStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                        ),
                                                hintText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '60on2yjr' /* State, Province or Region */,
                                                ),
                                                searchHintText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '37vvcera' /* Search for an item... */,
                                                ),
                                                icon: FaIcon(
                                                  FontAwesomeIcons.chevronDown,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 18.0,
                                                ),
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                elevation: 2.0,
                                                borderColor: Colors.transparent,
                                                borderWidth: 0.0,
                                                borderRadius: 8.0,
                                                margin: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 16.0, 0.0),
                                                hidesUnderline: true,
                                                isSearchable: true,
                                              );
                                            },
                                          ),
                                        ),
                                        Divider(
                                          thickness: 1.0,
                                          indent: 20.0,
                                          endIndent: 20.0,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 5.0, 0.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'az8i0ji2' /* Psychological Information */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge,
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 5.0, 0.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '3vssy8sv' /* Have you ever been diagnosed w... */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 0.0, 0.0),
                                          child: SwitchListTile.adaptive(
                                            value: _model
                                                    .switchAnxietyDiagnoseValue ??=
                                                false,
                                            onChanged: (newValue) async {
                                              setState(() => _model
                                                      .switchAnxietyDiagnoseValue =
                                                  newValue!);
                                            },
                                            title: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'lmiik5ot' /* Anxiety */,
                                              ),
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium,
                                            ),
                                            activeColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                            activeTrackColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent1,
                                            dense: false,
                                            controlAffinity:
                                                ListTileControlAffinity
                                                    .trailing,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 0.0, 0.0),
                                          child: SwitchListTile.adaptive(
                                            value: _model
                                                    .switchDepressionDiagnoseValue ??=
                                                false,
                                            onChanged: (newValue) async {
                                              setState(() => _model
                                                      .switchDepressionDiagnoseValue =
                                                  newValue!);
                                            },
                                            title: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'vp1nuebn' /* Depression */,
                                              ),
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium,
                                            ),
                                            activeColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                            activeTrackColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent1,
                                            dense: false,
                                            controlAffinity:
                                                ListTileControlAffinity
                                                    .trailing,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 0.0, 0.0),
                                          child: SwitchListTile.adaptive(
                                            value: _model
                                                    .switchAdhdDiagnoseValue ??=
                                                false,
                                            onChanged: (newValue) async {
                                              setState(() => _model
                                                      .switchAdhdDiagnoseValue =
                                                  newValue!);
                                            },
                                            title: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'h7lfvinv' /* ADD/ADHD */,
                                              ),
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium,
                                            ),
                                            activeColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                            activeTrackColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent1,
                                            dense: false,
                                            controlAffinity:
                                                ListTileControlAffinity
                                                    .trailing,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 5.0, 0.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'nqms46q0' /* Have you ever been treated for... */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 0.0, 0.0),
                                          child: SwitchListTile.adaptive(
                                            value: _model
                                                    .switchAnxietyTreatedValue ??=
                                                false,
                                            onChanged: (newValue) async {
                                              setState(() => _model
                                                      .switchAnxietyTreatedValue =
                                                  newValue!);
                                            },
                                            title: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'pz4epxqc' /* Anxiety */,
                                              ),
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium,
                                            ),
                                            activeColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                            activeTrackColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent1,
                                            dense: false,
                                            controlAffinity:
                                                ListTileControlAffinity
                                                    .trailing,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 0.0, 0.0),
                                          child: SwitchListTile.adaptive(
                                            value: _model
                                                    .switchDepressionTreatedValue ??=
                                                false,
                                            onChanged: (newValue) async {
                                              setState(() => _model
                                                      .switchDepressionTreatedValue =
                                                  newValue!);
                                            },
                                            title: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'hb6yreb7' /* Depression */,
                                              ),
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium,
                                            ),
                                            activeColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                            activeTrackColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent1,
                                            dense: false,
                                            controlAffinity:
                                                ListTileControlAffinity
                                                    .trailing,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 0.0, 20.0),
                                          child: SwitchListTile.adaptive(
                                            value: _model
                                                    .switchAdhdTreatedValue ??=
                                                false,
                                            onChanged: (newValue) async {
                                              setState(() => _model
                                                      .switchAdhdTreatedValue =
                                                  newValue!);
                                            },
                                            title: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'rwhlnzgv' /* ADD/ADHD */,
                                              ),
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium,
                                            ),
                                            activeColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                            activeTrackColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent1,
                                            dense: false,
                                            controlAffinity:
                                                ListTileControlAffinity
                                                    .trailing,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                        Divider(
                                          thickness: 1.0,
                                          indent: 20.0,
                                          endIndent: 20.0,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 5.0, 0.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '26natmru' /* App settings */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 0.0, 5.0),
                                          child: SwitchListTile.adaptive(
                                            value: _model
                                                .switchLocationValue ??= false,
                                            onChanged: (newValue) async {
                                              setState(() =>
                                                  _model.switchLocationValue =
                                                      newValue!);
                                              if (newValue!) {
                                                await requestPermission(
                                                    locationPermission);
                                              }
                                            },
                                            title: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'sibgi7m5' /* Add location to records */,
                                              ),
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium,
                                            ),
                                            subtitle: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'gbl8a3b4' /* Choose whether you want to add... */,
                                              ),
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium,
                                            ),
                                            activeColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                            activeTrackColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent1,
                                            dense: false,
                                            controlAffinity:
                                                ListTileControlAffinity
                                                    .trailing,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 0.0, 5.0),
                                          child: SwitchListTile.adaptive(
                                            value: _model
                                                .switchBiometricValue ??= false,
                                            onChanged: (newValue) async {
                                              setState(() =>
                                                  _model.switchBiometricValue =
                                                      newValue!);
                                              if (newValue!) {
                                                await requestPermission(
                                                    locationPermission);
                                              }
                                            },
                                            title: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'ai8l3o6i' /* Use biometric authentication */,
                                              ),
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium,
                                            ),
                                            subtitle: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '0ibsp7ai' /* You can use your phone's biome... */,
                                              ),
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium,
                                            ),
                                            activeColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                            activeTrackColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent1,
                                            dense: false,
                                            controlAffinity:
                                                ListTileControlAffinity
                                                    .trailing,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'rudy86xl' /* Pick a language */,
                                              ),
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium,
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'xdq2ywdw' /* You will recieve questions in ... */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 5.0, 16.0, 20.0),
                                          child: FutureBuilder<
                                              List<SupportedLangsRow>>(
                                            future: FFAppState().supportedLangs(
                                              uniqueQueryKey:
                                                  'supported_langs_${dateTimeFormat(
                                                'd/M/y',
                                                getCurrentTimestamp,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              )}',
                                              requestFn: () =>
                                                  SupportedLangsTable()
                                                      .queryRows(
                                                queryFn: (q) => q,
                                              ),
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 11.0,
                                                                0.0, 11.0),
                                                    child: SizedBox(
                                                      width: 40.0,
                                                      height: 40.0,
                                                      child: SpinKitThreeBounce(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        size: 40.0,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<SupportedLangsRow>
                                                  dropDownLangSupportedLangsRowList =
                                                  snapshot.data!;
                                              return FlutterFlowDropDown<
                                                  String>(
                                                controller: _model
                                                        .dropDownLangValueController ??=
                                                    FormFieldController<String>(
                                                  _model.dropDownLangValue ??=
                                                      FFLocalizations.of(
                                                              context)
                                                          .languageCode,
                                                ),
                                                options:
                                                    dropDownLangSupportedLangsRowList
                                                        .map((e) => e.iso6391)
                                                        .toList(),
                                                optionLabels:
                                                    dropDownLangSupportedLangsRowList
                                                        .map((e) =>
                                                            e.localizedName)
                                                        .toList(),
                                                onChanged: (val) => setState(
                                                    () => _model
                                                            .dropDownLangValue =
                                                        val),
                                                height: 62.0,
                                                searchHintTextStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                        ),
                                                hintText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'iyhj6plc' /* Preferred language */,
                                                ),
                                                searchHintText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'nt7f2rkf' /* Search for an item... */,
                                                ),
                                                icon: FaIcon(
                                                  FontAwesomeIcons.chevronDown,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 18.0,
                                                ),
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                elevation: 2.0,
                                                borderColor: Colors.transparent,
                                                borderWidth: 0.0,
                                                borderRadius: 8.0,
                                                margin: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                hidesUnderline: true,
                                                isSearchable: false,
                                              );
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 40.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              if (_model.formKey.currentState ==
                                                      null ||
                                                  !_model.formKey.currentState!
                                                      .validate()) {
                                                return;
                                              }
                                              if (_model.dropDownGenderValue ==
                                                  null) {
                                                return;
                                              }
                                              if (_model.dropDownCountryValue ==
                                                  null) {
                                                return;
                                              }
                                              if (_model.dropDownStateValue ==
                                                  null) {
                                                return;
                                              }
                                              await UserDataTable().insert({
                                                'type': 'user',
                                                'age': double.tryParse(_model
                                                    .textAgeController.text),
                                                'lang':
                                                    _model.dropDownLangValue,
                                                'gender':
                                                    _model.dropDownGenderValue,
                                                'country':
                                                    _model.dropDownCountryValue,
                                                'state':
                                                    _model.dropDownStateValue,
                                                'id': currentUserUid,
                                                'anxiety_diagnosed': _model
                                                    .switchAnxietyDiagnoseValue,
                                                'depression_diagnosed': _model
                                                    .switchDepressionDiagnoseValue,
                                                'adhd_diagnosed': _model
                                                    .switchAdhdDiagnoseValue,
                                                'anxiety_treated': _model
                                                    .switchAnxietyTreatedValue,
                                                'depression_treated': _model
                                                    .switchDepressionTreatedValue,
                                                'adhd_treated':
                                                    _model.switchLocationValue,
                                              });
                                              FFAppState().completedDataEntry =
                                                  true;
                                              FFAppState().logLocation =
                                                  FFAppState().logLocation;
                                              FFAppState().biometricAuth =
                                                  _model.switchBiometricValue!;
                                              FFAppState().preferredLang =
                                                  _model.dropDownLangValue!;
                                              if (!(FFAppState().logLocation &&
                                                  !(await getPermissionStatus(
                                                      locationPermission)))) {
                                                await requestPermission(
                                                    locationPermission);
                                              }

                                              context.goNamed('MainPage');
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'tfs9voin' /* Continue */,
                                            ),
                                            options: FFButtonOptions(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 20.0, 24.0, 20.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium,
                                              elevation: 3.0,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 1.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).alternate,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(16.0),
                          topRight: Radius.circular(16.0),
                        ),
                        shape: BoxShape.rectangle,
                      ),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                        child: Container(
                          width: double.infinity,
                          color: Color(0x00000000),
                          child: ExpandableNotifier(
                            initialExpanded: false,
                            child: ExpandablePanel(
                              header: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    30.0, 10.0, 0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'x65gcpem' /* What do we use this informatio... */,
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).titleSmall,
                                ),
                              ),
                              collapsed: Container(),
                              expanded: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    30.0, 10.0, 30.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'owh79ie8' /* Dear User,
The data gathered v... */
                                    ,
                                  ),
                                  textAlign: TextAlign.start,
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ),
                              theme: ExpandableThemeData(
                                tapHeaderToExpand: true,
                                tapBodyToExpand: false,
                                tapBodyToCollapse: true,
                                headerAlignment:
                                    ExpandablePanelHeaderAlignment.center,
                                hasIcon: true,
                                expandIcon: FontAwesomeIcons.chevronUp,
                                collapseIcon: FontAwesomeIcons.chevronDown,
                                iconColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                iconPadding:
                                    EdgeInsets.fromLTRB(0.0, 10.0, 30.0, 0.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
