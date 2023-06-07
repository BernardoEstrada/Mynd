import '/components/debug_sheet_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'debug_btn_model.dart';
export 'debug_btn_model.dart';

class DebugBtnWidget extends StatefulWidget {
  const DebugBtnWidget({Key? key}) : super(key: key);

  @override
  _DebugBtnWidgetState createState() => _DebugBtnWidgetState();
}

class _DebugBtnWidgetState extends State<DebugBtnWidget> {
  late DebugBtnModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DebugBtnModel());

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

    return Visibility(
      visible: FFAppState().debug,
      child: Align(
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 8.0, 4.0),
          child: FlutterFlowIconButton(
            borderRadius: 24.0,
            buttonSize: 48.0,
            fillColor: FlutterFlowTheme.of(context).accent3,
            icon: FaIcon(
              FontAwesomeIcons.bug,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
            onPressed: () async {
              showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) {
                  return Padding(
                    padding: MediaQuery.of(context).viewInsets,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.7,
                      child: DebugSheetWidget(),
                    ),
                  );
                },
              ).then((value) => setState(() {}));
            },
          ),
        ),
      ),
    );
  }
}
