import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'user_report_model.dart';
export 'user_report_model.dart';

class UserReportWidget extends StatefulWidget {
  const UserReportWidget({
    super.key,
    required this.reportedUserRef,
    this.messageContent,
    this.imageContent,
    this.videoContent,
    this.name,
    required this.reporterUserRef,
  });

  final DocumentReference? reportedUserRef;
  final String? messageContent;
  final String? imageContent;
  final String? videoContent;
  final String? name;
  final DocumentReference? reporterUserRef;

  @override
  State<UserReportWidget> createState() => _UserReportWidgetState();
}

class _UserReportWidgetState extends State<UserReportWidget> {
  late UserReportModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserReportModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(9.0, 0.0, 0.0, 0.0),
                  child: Text(
                    'Report User',
                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                          fontFamily: 'Sora',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                FlutterFlowIconButton(
                  borderColor: FlutterFlowTheme.of(context).alternate,
                  borderRadius: 12.0,
                  borderWidth: 1.0,
                  buttonSize: 40.0,
                  fillColor: FlutterFlowTheme.of(context).accent4,
                  icon: Icon(
                    Icons.close_rounded,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    logFirebaseEvent('USER_REPORT_close_rounded_ICN_ON_TAP');
                    logFirebaseEvent('IconButton_close_dialog_drawer_etc');
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Theme(
                    data: ThemeData(
                      checkboxTheme: CheckboxThemeData(
                        visualDensity: VisualDensity.compact,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                      unselectedWidgetColor: const Color(0xFF4F5460),
                    ),
                    child: Checkbox(
                      value: _model.harassmentCheckboxValue ??= false,
                      onChanged: (newValue) async {
                        safeSetState(
                            () => _model.harassmentCheckboxValue = newValue!);
                      },
                      side: const BorderSide(
                        width: 2,
                        color: Color(0xFF4F5460),
                      ),
                      activeColor: FlutterFlowTheme.of(context).primary,
                      checkColor: FlutterFlowTheme.of(context).accent4,
                    ),
                  ),
                  Text(
                    'Abuse or Harassment',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Montserrat',
                          letterSpacing: 0.0,
                        ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Theme(
                  data: ThemeData(
                    checkboxTheme: CheckboxThemeData(
                      visualDensity: VisualDensity.compact,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                    unselectedWidgetColor: const Color(0xFF4F5460),
                  ),
                  child: Checkbox(
                    value: _model.inappropriatCheckboxValue ??= false,
                    onChanged: (newValue) async {
                      safeSetState(
                          () => _model.inappropriatCheckboxValue = newValue!);
                    },
                    side: const BorderSide(
                      width: 2,
                      color: Color(0xFF4F5460),
                    ),
                    activeColor: FlutterFlowTheme.of(context).primary,
                    checkColor: FlutterFlowTheme.of(context).info,
                  ),
                ),
                Text(
                  'Inappropriate Content',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Montserrat',
                        letterSpacing: 0.0,
                      ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Theme(
                  data: ThemeData(
                    checkboxTheme: CheckboxThemeData(
                      visualDensity: VisualDensity.compact,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                    unselectedWidgetColor: const Color(0xFF4F5460),
                  ),
                  child: Checkbox(
                    value: _model.inappropriateDescCheckboxValue ??= false,
                    onChanged: (newValue) async {
                      safeSetState(() =>
                          _model.inappropriateDescCheckboxValue = newValue!);
                    },
                    side: const BorderSide(
                      width: 2,
                      color: Color(0xFF4F5460),
                    ),
                    activeColor: FlutterFlowTheme.of(context).primary,
                    checkColor: FlutterFlowTheme.of(context).info,
                  ),
                ),
                Text(
                  'Inappropriate Team Description',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Montserrat',
                        letterSpacing: 0.0,
                      ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Theme(
                  data: ThemeData(
                    checkboxTheme: CheckboxThemeData(
                      visualDensity: VisualDensity.compact,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                    unselectedWidgetColor: const Color(0xFF4F5460),
                  ),
                  child: Checkbox(
                    value: _model.impersonationCheckboxValue ??= false,
                    onChanged: (newValue) async {
                      safeSetState(
                          () => _model.impersonationCheckboxValue = newValue!);
                    },
                    side: const BorderSide(
                      width: 2,
                      color: Color(0xFF4F5460),
                    ),
                    activeColor: FlutterFlowTheme.of(context).primary,
                    checkColor: FlutterFlowTheme.of(context).info,
                  ),
                ),
                Text(
                  'Impersonation',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Montserrat',
                        letterSpacing: 0.0,
                      ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Theme(
                  data: ThemeData(
                    checkboxTheme: CheckboxThemeData(
                      visualDensity: VisualDensity.compact,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                    unselectedWidgetColor: const Color(0xFF4F5460),
                  ),
                  child: Checkbox(
                    value: _model.spamCheckboxValue ??= false,
                    onChanged: (newValue) async {
                      safeSetState(() => _model.spamCheckboxValue = newValue!);
                    },
                    side: const BorderSide(
                      width: 2,
                      color: Color(0xFF4F5460),
                    ),
                    activeColor: FlutterFlowTheme.of(context).primary,
                    checkColor: FlutterFlowTheme.of(context).info,
                  ),
                ),
                Text(
                  'Spam',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Montserrat',
                        letterSpacing: 0.0,
                      ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Theme(
                  data: ThemeData(
                    checkboxTheme: CheckboxThemeData(
                      visualDensity: VisualDensity.compact,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                    unselectedWidgetColor: const Color(0xFF4F5460),
                  ),
                  child: Checkbox(
                    value: _model.otherCheckboxValue ??= false,
                    onChanged: (newValue) async {
                      safeSetState(() => _model.otherCheckboxValue = newValue!);
                    },
                    side: const BorderSide(
                      width: 2,
                      color: Color(0xFF4F5460),
                    ),
                    activeColor: FlutterFlowTheme.of(context).primary,
                    checkColor: FlutterFlowTheme.of(context).accent4,
                  ),
                ),
                Text(
                  'Other',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Montserrat',
                        letterSpacing: 0.0,
                      ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: SizedBox(
                      width: 100000.0,
                      child: TextFormField(
                        controller: _model.textController,
                        focusNode: _model.textFieldFocusNode,
                        autofocus: false,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: 'Explain in detail...',
                          hintStyle:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'Montserrat',
                                    color: FlutterFlowTheme.of(context).info,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                  ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          filled: true,
                          fillColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Montserrat',
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                            ),
                        maxLines: null,
                        minLines: 3,
                        validator:
                            _model.textControllerValidator.asValidator(context),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(7.5, 15.0, 7.5, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('USER_REPORT_COMP_REPORT_BTN_ON_TAP');
                  if (() {
                    if (_model.harassmentCheckboxValue!) {
                      return true;
                    } else if (_model.inappropriatCheckboxValue!) {
                      return true;
                    } else if (_model.impersonationCheckboxValue!) {
                      return true;
                    } else if (_model.spamCheckboxValue!) {
                      return true;
                    } else if (_model.otherCheckboxValue!) {
                      return true;
                    } else {
                      return false;
                    }
                  }()) {
                    if (_model.textController.text != '') {
                      logFirebaseEvent('Button_backend_call');

                      await UserReportsRecord.collection
                          .doc()
                          .set(createUserReportsRecordData(
                            inappropriateContentIsTrue:
                                _model.inappropriatCheckboxValue,
                            abuseOrHarassmentIsTrue:
                                _model.harassmentCheckboxValue,
                            impersonationIsTrue:
                                _model.impersonationCheckboxValue,
                            spamIsTrue: _model.spamCheckboxValue,
                            otherIsTrue: _model.otherCheckboxValue,
                            explanation: _model.textController.text,
                            messageContent: widget.messageContent,
                            reportedTime: getCurrentTimestamp,
                            imageContent: widget.imageContent,
                            videoContent: widget.videoContent,
                            name: widget.name,
                            reportedUserRef: widget.reportedUserRef,
                            reporterUserRef: widget.reporterUserRef,
                            inappropriateDescriptionIsTrue:
                                _model.inappropriateDescCheckboxValue,
                            reviewed: false,
                          ));
                    } else {
                      logFirebaseEvent('Button_alert_dialog');
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: const Text('No Explination'),
                            content: const Text(
                                'Please provide an in-depth explination on why you are reporting this user. Without this information, we can\'t do anything.'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext),
                                child: const Text('Ok'),
                              ),
                            ],
                          );
                        },
                      );
                    }

                    logFirebaseEvent('Button_dismiss_dialog');
                    Navigator.pop(context);
                  } else {
                    logFirebaseEvent('Button_alert_dialog');
                    await showDialog(
                      context: context,
                      builder: (alertDialogContext) {
                        return AlertDialog(
                          title: const Text('Reason Not Selected'),
                          content: const Text(
                              'Please select one of the reasons for reporting this user.'),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(alertDialogContext),
                              child: const Text('Ok'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                text: 'Report',
                options: FFButtonOptions(
                  width: 1000.0,
                  height: 40.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        letterSpacing: 0.0,
                      ),
                  elevation: 3.0,
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                    width: 1200.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
