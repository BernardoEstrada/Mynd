import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'boolean_details_row_model.dart';
export 'boolean_details_row_model.dart';

class BooleanDetailsRowWidget extends StatefulWidget {
  const BooleanDetailsRowWidget({
    Key? key,
    required this.status,
    required this.text,
  }) : super(key: key);

  final bool? status;
  final String? text;

  @override
  _BooleanDetailsRowWidgetState createState() =>
      _BooleanDetailsRowWidgetState();
}

class _BooleanDetailsRowWidgetState extends State<BooleanDetailsRowWidget> {
  late BooleanDetailsRowModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BooleanDetailsRowModel());

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

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: AlignmentDirectional(-1.0, 0.0),
            child: Container(
              width: 30.0,
              height: 30.0,
              child: Stack(
                alignment: AlignmentDirectional(0.0, 0.0),
                children: [
                  if (widget.status ?? true)
                    FaIcon(
                      FontAwesomeIcons.check,
                      color: FlutterFlowTheme.of(context).secondary,
                      size: 30.0,
                    ),
                  if (!widget.status!)
                    FaIcon(
                      FontAwesomeIcons.times,
                      color: FlutterFlowTheme.of(context).error,
                      size: 30.0,
                    ),
                ],
              ),
            ),
          ),
          Flexible(
            child: Align(
              alignment: AlignmentDirectional(-1.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                child: Text(
                  widget.text!,
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.of(context).titleMedium.override(
                        fontFamily: 'Poppins',
                        lineHeight: 1.875,
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
