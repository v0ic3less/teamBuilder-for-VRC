import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'tap_to_create_model.dart';
export 'tap_to_create_model.dart';

class TapToCreateWidget extends StatefulWidget {
  const TapToCreateWidget({super.key});

  @override
  State<TapToCreateWidget> createState() => _TapToCreateWidgetState();
}

class _TapToCreateWidgetState extends State<TapToCreateWidget> {
  late TapToCreateModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TapToCreateModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(22.0, 10.0, 0.0, 0.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            'Tap',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Montserrat',
                  fontSize: 16.0,
                  letterSpacing: 0.0,
                ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(7.0, 0.0, 7.0, 0.0),
            child: Icon(
              Icons.add_task_rounded,
              color: FlutterFlowTheme.of(context).info,
              size: 20.0,
            ),
          ),
          Text(
            'to create a new checklist item',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Montserrat',
                  fontSize: 16.0,
                  letterSpacing: 0.0,
                ),
          ),
        ],
      ),
    );
  }
}
