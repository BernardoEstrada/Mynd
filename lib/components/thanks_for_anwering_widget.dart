import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'thanks_for_anwering_model.dart';
export 'thanks_for_anwering_model.dart';

class ThanksForAnweringWidget extends StatefulWidget {
  const ThanksForAnweringWidget({Key? key}) : super(key: key);

  @override
  _ThanksForAnweringWidgetState createState() =>
      _ThanksForAnweringWidgetState();
}

class _ThanksForAnweringWidgetState extends State<ThanksForAnweringWidget> {
  late ThanksForAnweringModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ThanksForAnweringModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Flexible(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: SvgPicture.asset(
                'assets/images/g-title-bold.svg',
                width: MediaQuery.of(context).size.width * 1.0,
                height: 146.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Text(
          FFLocalizations.of(context).getText(
            'h23n7m1e' /* Thanks for answering! */,
          ),
          textAlign: TextAlign.center,
          style: FlutterFlowTheme.of(context).headlineMedium,
        ),
        Text(
          FFLocalizations.of(context).getText(
            'kok1j9q4' /* No more quesitons left */,
          ),
          textAlign: TextAlign.center,
          style: FlutterFlowTheme.of(context).titleMedium,
        ),
        Flexible(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(50.0, 20.0, 50.0, 0.0),
            child: FFButtonWidget(
              onPressed: () async {
                Navigator.pop(context);
              },
              text: FFLocalizations.of(context).getText(
                'sjm8ig5l' /* Close */,
              ),
              icon: FaIcon(
                FontAwesomeIcons.solidHandSpock,
              ),
              options: FFButtonOptions(
                height: 40.0,
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).secondary,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
                elevation: 3.0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
