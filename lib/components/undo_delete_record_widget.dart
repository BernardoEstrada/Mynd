import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'undo_delete_record_model.dart';
export 'undo_delete_record_model.dart';

class UndoDeleteRecordWidget extends StatefulWidget {
  const UndoDeleteRecordWidget({Key? key}) : super(key: key);

  @override
  _UndoDeleteRecordWidgetState createState() => _UndoDeleteRecordWidgetState();
}

class _UndoDeleteRecordWidgetState extends State<UndoDeleteRecordWidget> {
  late UndoDeleteRecordModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UndoDeleteRecordModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await AttackReportsTable().update(
        data: {
          'deleted': false,
        },
        matchingRows: (rows) => rows.eq(
          'id',
          FFAppState().recentlyDeletedReport,
        ),
      );
      FFAppState().clearLatestReportsCache();
      Navigator.pop(context);
      FFAppState().update(() {
        FFAppState().recentlyDeletedReport = '';
      });
    });

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

    return Container();
  }
}
