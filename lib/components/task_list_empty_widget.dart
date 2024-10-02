import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'task_list_empty_model.dart';
export 'task_list_empty_model.dart';

class TaskListEmptyWidget extends StatefulWidget {
  const TaskListEmptyWidget({super.key});

  @override
  State<TaskListEmptyWidget> createState() => _TaskListEmptyWidgetState();
}

class _TaskListEmptyWidgetState extends State<TaskListEmptyWidget> {
  late TaskListEmptyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TaskListEmptyModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      'All tasks have been completed. Set a new task by pressing the button in the bottom right.',
      style: FlutterFlowTheme.of(context).labelLarge.override(
            fontFamily: 'Montserrat',
            color: FlutterFlowTheme.of(context).info,
            letterSpacing: 0.0,
          ),
    );
  }
}
