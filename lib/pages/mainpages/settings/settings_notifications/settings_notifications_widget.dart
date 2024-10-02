import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'settings_notifications_model.dart';
export 'settings_notifications_model.dart';

class SettingsNotificationsWidget extends StatefulWidget {
  const SettingsNotificationsWidget({super.key});

  @override
  State<SettingsNotificationsWidget> createState() =>
      _SettingsNotificationsWidgetState();
}

class _SettingsNotificationsWidgetState
    extends State<SettingsNotificationsWidget> {
  late SettingsNotificationsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingsNotificationsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'settings-notifications'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'settings-notifications',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 30.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('SETTINGS_NOTIFICATIONS_arrow_back_rounde');
                  logFirebaseEvent('IconButton_navigate_back');
                  context.pop();
                },
              ),
              title: Text(
                'Notification Settings',
                style: FlutterFlowTheme.of(context).headlineSmall.override(
                      fontFamily: 'Sora',
                      fontSize: 24.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.normal,
                    ),
              ),
              actions: const [],
              centerTitle: false,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Event Notifications',
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                            fontFamily: 'Sora',
                            letterSpacing: 0.0,
                          ),
                    ),
                    AuthUserStreamWidget(
                      builder: (context) => SwitchListTile.adaptive(
                        value: _model.matchNotifsValue ??= valueOrDefault<bool>(
                            currentUserDocument?.matchNotifs, false),
                        onChanged: (newValue) async {
                          safeSetState(
                              () => _model.matchNotifsValue = newValue);
                          if (newValue) {
                            logFirebaseEvent(
                                'SETTINGS_NOTIFICATIONS_matchNotifs_ON_TO');
                            logFirebaseEvent('matchNotifs_backend_call');

                            await currentUserReference!
                                .update(createUsersRecordData(
                              matchNotifs: _model.matchNotifsValue,
                            ));
                          } else {
                            logFirebaseEvent(
                                'SETTINGS_NOTIFICATIONS_matchNotifs_ON_TO');
                            logFirebaseEvent('matchNotifs_backend_call');

                            await currentUserReference!
                                .update(createUsersRecordData(
                              matchNotifs: _model.matchNotifsValue,
                            ));
                          }
                        },
                        title: Text(
                          'Match Notifications',
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'Montserrat',
                                    letterSpacing: 0.0,
                                    lineHeight: 2.0,
                                  ),
                        ),
                        subtitle: Text(
                          'Recieve a push or in-app notification for an upcoming match. Sometimes match schedules will be inaccurate, especially in elimation rounds.',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Montserrat',
                                    color: const Color(0xFF8B97A2),
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        tileColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        activeColor: FlutterFlowTheme.of(context).primary,
                        activeTrackColor: FlutterFlowTheme.of(context).accent1,
                        dense: false,
                        controlAffinity: ListTileControlAffinity.trailing,
                        contentPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                      child: AuthUserStreamWidget(
                        builder: (context) => SwitchListTile.adaptive(
                          value: _model.eventNotifsValue ??=
                              valueOrDefault<bool>(
                                  currentUserDocument?.eventNotifs, false),
                          onChanged: (newValue) async {
                            safeSetState(
                                () => _model.eventNotifsValue = newValue);
                            if (newValue) {
                              logFirebaseEvent(
                                  'SETTINGS_NOTIFICATIONS_eventNotifs_ON_TO');
                              logFirebaseEvent('eventNotifs_backend_call');

                              await currentUserReference!
                                  .update(createUsersRecordData(
                                eventNotifs: _model.eventNotifsValue,
                              ));
                            } else {
                              logFirebaseEvent(
                                  'SETTINGS_NOTIFICATIONS_eventNotifs_ON_TO');
                              logFirebaseEvent('eventNotifs_backend_call');

                              await currentUserReference!
                                  .update(createUsersRecordData(
                                eventNotifs: _model.eventNotifsValue,
                              ));
                            }
                          },
                          title: Text(
                            'Key Event Notifications',
                            style:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Montserrat',
                                      letterSpacing: 0.0,
                                      lineHeight: 2.0,
                                    ),
                          ),
                          subtitle: Text(
                            'Recieve a push or in-app notification for an upcoming key event, such as before a Driver\'s Meeting or before Skills closes.',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Montserrat',
                                  color: const Color(0xFF8B97A2),
                                  letterSpacing: 0.0,
                                ),
                          ),
                          tileColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          activeColor: FlutterFlowTheme.of(context).primary,
                          activeTrackColor:
                              FlutterFlowTheme.of(context).accent1,
                          dense: false,
                          controlAffinity: ListTileControlAffinity.trailing,
                          contentPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 18.0, 0.0, 0.0),
                      child: Text(
                        'Team Notifications',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              fontFamily: 'Sora',
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                    SwitchListTile.adaptive(
                      value: _model.serviceNotifsValue ??= true,
                      onChanged: true
                          ? null
                          : (newValue) async {
                              safeSetState(
                                  () => _model.serviceNotifsValue = newValue);
                            },
                      title: Text(
                        'Service Notifications',
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Montserrat',
                              letterSpacing: 0.0,
                              lineHeight: 2.0,
                            ),
                      ),
                      subtitle: Text(
                        'Necessary notifications about payments, verification, etc.',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Montserrat',
                              color: const Color(0xFF8B97A2),
                              letterSpacing: 0.0,
                            ),
                      ),
                      tileColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      activeColor: FlutterFlowTheme.of(context).primary,
                      activeTrackColor: FlutterFlowTheme.of(context).accent1,
                      dense: false,
                      controlAffinity: ListTileControlAffinity.trailing,
                      contentPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    ),
                    if (false)
                      AuthUserStreamWidget(
                        builder: (context) => SwitchListTile.adaptive(
                          value: _model.emailNotifsValue ??=
                              valueOrDefault<bool>(
                                  currentUserDocument?.emailNotifs, false),
                          onChanged: (newValue) async {
                            safeSetState(
                                () => _model.emailNotifsValue = newValue);
                            if (newValue) {
                              logFirebaseEvent(
                                  'SETTINGS_NOTIFICATIONS_emailNotifs_ON_TO');
                              logFirebaseEvent('emailNotifs_backend_call');

                              await currentUserReference!
                                  .update(createUsersRecordData(
                                emailNotifs: _model.emailNotifsValue,
                              ));
                            } else {
                              logFirebaseEvent(
                                  'SETTINGS_NOTIFICATIONS_emailNotifs_ON_TO');
                              logFirebaseEvent('emailNotifs_backend_call');

                              await currentUserReference!
                                  .update(createUsersRecordData(
                                emailNotifs: _model.emailNotifsValue,
                              ));
                            }
                          },
                          title: Text(
                            'Email Notifications',
                            style:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Montserrat',
                                      letterSpacing: 0.0,
                                      lineHeight: 2.0,
                                    ),
                          ),
                          subtitle: Text(
                            'Receive email notifications about new features, updates and more!',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Montserrat',
                                  color: const Color(0xFF8B97A2),
                                  letterSpacing: 0.0,
                                ),
                          ),
                          tileColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          activeColor: FlutterFlowTheme.of(context).primary,
                          activeTrackColor:
                              FlutterFlowTheme.of(context).accent1,
                          dense: false,
                          controlAffinity: ListTileControlAffinity.trailing,
                          contentPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
