import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_media_display.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/upload_data.dart';
import '/pages/mainpages/empty_state_simple/empty_state_simple_widget.dart';
import '/pages/mainpages/messages/chat/chat_thread_update/chat_thread_update_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'chat_thread_component_model.dart';
export 'chat_thread_component_model.dart';

class ChatThreadComponentWidget extends StatefulWidget {
  const ChatThreadComponentWidget({
    super.key,
    this.chatRef,
  });

  final ChatsRecord? chatRef;

  @override
  State<ChatThreadComponentWidget> createState() =>
      _ChatThreadComponentWidgetState();
}

class _ChatThreadComponentWidgetState extends State<ChatThreadComponentWidget> {
  late ChatThreadComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatThreadComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CHAT_THREAD_COMPONENT_chat_ThreadCompone');
      logFirebaseEvent('chat_ThreadComponent_custom_action');
      _model.blockedUsers = await actions.findBlockedUsers(
        (currentUserDocument?.blockedUsers.toList() ?? []).toList(),
        widget.chatRef!.users.toList(),
      );
      logFirebaseEvent('chat_ThreadComponent_backend_call');
      _model.firstBlockedUser =
          await UsersRecord.getDocumentOnce(_model.blockedUsers!.first);
      logFirebaseEvent('chat_ThreadComponent_backend_call');
      _model.secondBlockedUser =
          await UsersRecord.getDocumentOnce(_model.blockedUsers![1]);
      logFirebaseEvent('chat_ThreadComponent_backend_call');
      _model.thirdBlockedUser =
          await UsersRecord.getDocumentOnce(_model.blockedUsers![2]);
    });

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
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: StreamBuilder<List<ChatMessagesRecord>>(
              stream: queryChatMessagesRecord(
                queryBuilder: (chatMessagesRecord) => chatMessagesRecord
                    .where(
                      'chat',
                      isEqualTo: widget.chatRef?.reference,
                    )
                    .orderBy('timestamp', descending: true),
                limit: 200,
              )..listen((snapshot) {
                  List<ChatMessagesRecord> listViewChatMessagesRecordList =
                      snapshot;
                  if (_model.listViewPreviousSnapshot != null &&
                      !const ListEquality(ChatMessagesRecordDocumentEquality())
                          .equals(listViewChatMessagesRecordList,
                              _model.listViewPreviousSnapshot)) {
                    () async {
                      logFirebaseEvent(
                          'CHAT_THREAD_COMPONENT_ListView_gbhp8fjn_');
                      if (!widget.chatRef!.lastMessageSeenBy
                          .contains(currentUserReference)) {
                        logFirebaseEvent('ListView_backend_call');

                        await widget.chatRef!.reference.update({
                          ...mapToFirestore(
                            {
                              'last_message_seen_by':
                                  FieldValue.arrayUnion([currentUserReference]),
                            },
                          ),
                        });
                      }

                      safeSetState(() {});
                    }();
                  }
                  _model.listViewPreviousSnapshot = snapshot;
                }),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(
                        width: 35.0,
                        height: 35.0,
                        child: SpinKitSquareCircle(
                          color: FlutterFlowTheme.of(context).primary,
                          size: 35.0,
                        ),
                      ),
                    ),
                  );
                }
                List<ChatMessagesRecord> listViewChatMessagesRecordList =
                    snapshot.data!;
                if (listViewChatMessagesRecordList.isEmpty) {
                  return EmptyStateSimpleWidget(
                    icon: Icon(
                      Icons.forum_outlined,
                      color: FlutterFlowTheme.of(context).primary,
                      size: 90.0,
                    ),
                    title: 'No Messages',
                    body: 'You have not sent any messages in this chat yet.',
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.fromLTRB(
                    0,
                    12.0,
                    0,
                    24.0,
                  ),
                  reverse: true,
                  scrollDirection: Axis.vertical,
                  itemCount: listViewChatMessagesRecordList.length,
                  itemBuilder: (context, listViewIndex) {
                    final listViewChatMessagesRecord =
                        listViewChatMessagesRecordList[listViewIndex];
                    return Container(
                      decoration: const BoxDecoration(),
                      child: wrapWithModel(
                        model: _model.chatThreadUpdateModels.getModel(
                          listViewChatMessagesRecord.reference.id,
                          listViewIndex,
                        ),
                        updateCallback: () => safeSetState(() {}),
                        updateOnChange: true,
                        child: ChatThreadUpdateWidget(
                          key: Key(
                            'Key9hz_${listViewChatMessagesRecord.reference.id}',
                          ),
                          chatMessagesRef: listViewChatMessagesRecord,
                          chatsRef: widget.chatRef!,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
              boxShadow: const [
                BoxShadow(
                  blurRadius: 3.0,
                  color: Color(0x33000000),
                  offset: Offset(
                    0.0,
                    -2.0,
                  ),
                )
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                if (_model.uploadedFileUrl != '')
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 0.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FlutterFlowMediaDisplay(
                                  path: _model.uploadedFileUrl,
                                  imageBuilder: (path) => ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: CachedNetworkImage(
                                      fadeInDuration:
                                          const Duration(milliseconds: 500),
                                      fadeOutDuration:
                                          const Duration(milliseconds: 500),
                                      imageUrl: path,
                                      width: 120.0,
                                      height: 100.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  videoPlayerBuilder: (path) =>
                                      FlutterFlowVideoPlayer(
                                    path: path,
                                    width: 300.0,
                                    autoPlay: false,
                                    looping: true,
                                    showControls: true,
                                    allowFullScreen: true,
                                    allowPlaybackSpeedMenu: false,
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(-1.0, -1.0),
                                  child: FlutterFlowIconButton(
                                    borderColor:
                                        FlutterFlowTheme.of(context).error,
                                    borderRadius: 20.0,
                                    borderWidth: 2.0,
                                    buttonSize: 40.0,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    icon: Icon(
                                      FFIcons.ktrash2,
                                      color: FlutterFlowTheme.of(context).error,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'CHAT_THREAD_COMPONENT_trash2_ICN_ON_TAP');
                                      logFirebaseEvent(
                                          'IconButton_clear_uploaded_data');
                                      safeSetState(() {
                                        _model.isDataUploading = false;
                                        _model.uploadedLocalFile =
                                            FFUploadedFile(
                                                bytes: Uint8List.fromList([]));
                                        _model.uploadedFileUrl = '';
                                      });
                                    },
                                  ),
                                ),
                              ]
                                  .divide(const SizedBox(width: 8.0))
                                  .addToStart(const SizedBox(width: 16.0))
                                  .addToEnd(const SizedBox(width: 16.0)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                Form(
                  key: _model.formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FlutterFlowIconButton(
                          borderColor: FlutterFlowTheme.of(context).alternate,
                          borderRadius: 60.0,
                          borderWidth: 1.0,
                          buttonSize: 40.0,
                          fillColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          icon: Icon(
                            Icons.add_rounded,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            logFirebaseEvent(
                                'CHAT_THREAD_COMPONENT_add_rounded_ICN_ON');
                            logFirebaseEvent(
                                'IconButton_upload_media_to_firebase');
                            final selectedMedia =
                                await selectMediaWithSourceBottomSheet(
                              context: context,
                              allowPhoto: true,
                              allowVideo: true,
                              backgroundColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              textColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              pickerFontFamily: 'Outfit',
                            );
                            if (selectedMedia != null &&
                                selectedMedia.every((m) => validateFileFormat(
                                    m.storagePath, context))) {
                              safeSetState(() => _model.isDataUploading = true);
                              var selectedUploadedFiles = <FFUploadedFile>[];

                              var downloadUrls = <String>[];
                              try {
                                showUploadMessage(
                                  context,
                                  'Uploading file...',
                                  showLoading: true,
                                );
                                selectedUploadedFiles = selectedMedia
                                    .map((m) => FFUploadedFile(
                                          name: m.storagePath.split('/').last,
                                          bytes: m.bytes,
                                          height: m.dimensions?.height,
                                          width: m.dimensions?.width,
                                          blurHash: m.blurHash,
                                        ))
                                    .toList();

                                downloadUrls = (await Future.wait(
                                  selectedMedia.map(
                                    (m) async => await uploadData(
                                        m.storagePath, m.bytes),
                                  ),
                                ))
                                    .where((u) => u != null)
                                    .map((u) => u!)
                                    .toList();
                              } finally {
                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
                                _model.isDataUploading = false;
                              }
                              if (selectedUploadedFiles.length ==
                                      selectedMedia.length &&
                                  downloadUrls.length == selectedMedia.length) {
                                safeSetState(() {
                                  _model.uploadedLocalFile =
                                      selectedUploadedFiles.first;
                                  _model.uploadedFileUrl = downloadUrls.first;
                                });
                                showUploadMessage(context, 'Success!');
                              } else {
                                safeSetState(() {});
                                showUploadMessage(
                                    context, 'Failed to upload data');
                                return;
                              }
                            }

                            if (_model.uploadedFileUrl != '') {
                              logFirebaseEvent(
                                  'IconButton_update_component_state');
                              _model
                                  .addToImagesUploaded(_model.uploadedFileUrl);
                              safeSetState(() {});
                            }
                          },
                        ),
                        Expanded(
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 0.0, 0.0),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: TextFormField(
                                    controller: _model.textController,
                                    focusNode: _model.textFieldFocusNode,
                                    onFieldSubmitted: (_) async {
                                      logFirebaseEvent(
                                          'CHAT_THREAD_COMPONENT_TextField_pl9z321n');
                                      if (_model.textController.text != ''
                                          ? true
                                          : false) {
                                        logFirebaseEvent(
                                            'TextField_validate_form');
                                        if (_model.formKey.currentState ==
                                                null ||
                                            !_model.formKey.currentState!
                                                .validate()) {
                                          return;
                                        }
                                        // newChatMessage
                                        logFirebaseEvent(
                                            'TextField_newChatMessage');

                                        var chatMessagesRecordReference =
                                            ChatMessagesRecord.collection.doc();
                                        await chatMessagesRecordReference
                                            .set(createChatMessagesRecordData(
                                          user: currentUserReference,
                                          chat: widget.chatRef?.reference,
                                          text: _model.textController.text,
                                          timestamp: getCurrentTimestamp,
                                          image: _model.uploadedFileUrl,
                                          teamID: valueOrDefault(
                                              currentUserDocument?.teamID, 0),
                                          displayName: currentUserDisplayName,
                                          uid: currentUserUid,
                                        ));
                                        _model.newChatMessage = ChatMessagesRecord
                                            .getDocumentFromData(
                                                createChatMessagesRecordData(
                                                  user: currentUserReference,
                                                  chat: widget
                                                      .chatRef?.reference,
                                                  text: _model
                                                      .textController.text,
                                                  timestamp:
                                                      getCurrentTimestamp,
                                                  image: _model.uploadedFileUrl,
                                                  teamID: valueOrDefault(
                                                      currentUserDocument
                                                          ?.teamID,
                                                      0),
                                                  displayName:
                                                      currentUserDisplayName,
                                                  uid: currentUserUid,
                                                ),
                                                chatMessagesRecordReference);
                                        // clearUsers
                                        logFirebaseEvent(
                                            'TextField_clearUsers');
                                        _model.lastSeenBy = [];
                                        // In order to add a single user reference to a list of user references we are adding our current user reference to a page state.
                                        //
                                        // We will then set the value of the user reference list from this page state.
                                        // addMyUserToList
                                        logFirebaseEvent(
                                            'TextField_addMyUserToList');
                                        _model.addToLastSeenBy(
                                            currentUserReference!);
                                        // updateChatDocument
                                        logFirebaseEvent(
                                            'TextField_updateChatDocument');

                                        await widget.chatRef!.reference
                                            .update({
                                          ...createChatsRecordData(
                                            lastMessageTime:
                                                getCurrentTimestamp,
                                            lastMessageSentBy:
                                                currentUserReference,
                                            lastMessage:
                                                _model.textController.text,
                                          ),
                                          ...mapToFirestore(
                                            {
                                              'last_message_seen_by':
                                                  _model.lastSeenBy,
                                            },
                                          ),
                                        });
                                        // clearUsers
                                        logFirebaseEvent(
                                            'TextField_clearUsers');
                                        _model.lastSeenBy = [];
                                        logFirebaseEvent(
                                            'TextField_clear_text_fields_pin_codes');
                                        safeSetState(() {
                                          _model.textController?.clear();
                                        });
                                        logFirebaseEvent(
                                            'TextField_clear_uploaded_data');
                                        safeSetState(() {
                                          _model.isDataUploading = false;
                                          _model.uploadedLocalFile =
                                              FFUploadedFile(
                                                  bytes:
                                                      Uint8List.fromList([]));
                                          _model.uploadedFileUrl = '';
                                        });

                                        logFirebaseEvent(
                                            'TextField_update_component_state');
                                        _model.imagesUploaded = [];
                                        safeSetState(() {});
                                      }

                                      safeSetState(() {});
                                    },
                                    autofocus: true,
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                    textInputAction: TextInputAction.send,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: 'Start typing here...',
                                      errorStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                      contentPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              16.0, 16.0, 56.0, 16.0),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Montserrat',
                                          letterSpacing: 0.0,
                                        ),
                                    maxLines: 12,
                                    minLines: 1,
                                    cursorColor:
                                        FlutterFlowTheme.of(context).primary,
                                    validator: _model.textControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(1.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 6.0, 4.0),
                                  child: FlutterFlowIconButton(
                                    borderColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: 20.0,
                                    borderWidth: 1.0,
                                    buttonSize: 40.0,
                                    fillColor:
                                        FlutterFlowTheme.of(context).primary,
                                    icon: Icon(
                                      FFIcons.ksend,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 18.0,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'CHAT_THREAD_COMPONENT_send_ICN_ON_TAP');
                                      final firestoreBatch =
                                          FirebaseFirestore.instance.batch();
                                      try {
                                        if (_model.textController.text != ''
                                            ? true
                                            : false) {
                                          logFirebaseEvent(
                                              'IconButton_validate_form');
                                          if (_model.formKey.currentState ==
                                                  null ||
                                              !_model.formKey.currentState!
                                                  .validate()) {
                                            return;
                                          }
                                          // newChatMessage
                                          logFirebaseEvent(
                                              'IconButton_newChatMessage');

                                          var chatMessagesRecordReference =
                                              ChatMessagesRecord.collection
                                                  .doc();
                                          firestoreBatch.set(
                                              chatMessagesRecordReference,
                                              createChatMessagesRecordData(
                                                user: currentUserReference,
                                                chat:
                                                    widget.chatRef?.reference,
                                                text:
                                                    _model.textController.text,
                                                timestamp: getCurrentTimestamp,
                                                image: _model.uploadedFileUrl,
                                                teamID: valueOrDefault(
                                                    currentUserDocument?.teamID,
                                                    0),
                                                uid: currentUserUid,
                                                displayName:
                                                    currentUserDisplayName,
                                              ));
                                          _model.newChat = ChatMessagesRecord
                                              .getDocumentFromData(
                                                  createChatMessagesRecordData(
                                                    user: currentUserReference,
                                                    chat: widget
                                                        .chatRef?.reference,
                                                    text: _model
                                                        .textController.text,
                                                    timestamp:
                                                        getCurrentTimestamp,
                                                    image:
                                                        _model.uploadedFileUrl,
                                                    teamID: valueOrDefault(
                                                        currentUserDocument
                                                            ?.teamID,
                                                        0),
                                                    uid: currentUserUid,
                                                    displayName:
                                                        currentUserDisplayName,
                                                  ),
                                                  chatMessagesRecordReference);
                                          // clearUsers
                                          logFirebaseEvent(
                                              'IconButton_clearUsers');
                                          _model.lastSeenBy = [];
                                          // In order to add a single user reference to a list of user references we are adding our current user reference to a page state.
                                          //
                                          // We will then set the value of the user reference list from this page state.
                                          // addMyUserToList
                                          logFirebaseEvent(
                                              'IconButton_addMyUserToList');
                                          _model.addToLastSeenBy(
                                              currentUserReference!);
                                          // updateChatDocument
                                          logFirebaseEvent(
                                              'IconButton_updateChatDocument');

                                          firestoreBatch.update(
                                              widget.chatRef!.reference, {
                                            ...createChatsRecordData(
                                              lastMessageTime:
                                                  getCurrentTimestamp,
                                              lastMessageSentBy:
                                                  currentUserReference,
                                              lastMessage:
                                                  _model.textController.text,
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'last_message_seen_by':
                                                    _model.lastSeenBy,
                                              },
                                            ),
                                          });
                                          logFirebaseEvent(
                                              'IconButton_trigger_push_notification');
                                          triggerPushNotification(
                                            notificationTitle: valueOrDefault(
                                                currentUserDocument?.teamNum,
                                                ''),
                                            notificationText:
                                                _model.textController.text,
                                            notificationSound: 'default',
                                            userRefs:
                                                widget.chatRef!.users.toList(),
                                            initialPageName: 'Messages',
                                            parameterData: {},
                                          );
                                          // clearUsers
                                          logFirebaseEvent(
                                              'IconButton_clearUsers');
                                          _model.lastSeenBy = [];
                                          logFirebaseEvent(
                                              'IconButton_clear_text_fields_pin_codes');
                                          safeSetState(() {
                                            _model.textController?.clear();
                                          });
                                          logFirebaseEvent(
                                              'IconButton_clear_uploaded_data');
                                          safeSetState(() {
                                            _model.isDataUploading = false;
                                            _model.uploadedLocalFile =
                                                FFUploadedFile(
                                                    bytes:
                                                        Uint8List.fromList([]));
                                            _model.uploadedFileUrl = '';
                                          });

                                          logFirebaseEvent(
                                              'IconButton_update_component_state');
                                          _model.imagesUploaded = [];
                                          safeSetState(() {});
                                        }
                                      } finally {
                                        await firestoreBatch.commit();
                                      }

                                      safeSetState(() {});
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (_model.blockedUsers != null &&
                    (_model.blockedUsers)!.isNotEmpty)
                  Container(
                    width: double.infinity,
                    height: 45.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primary,
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                      child: Text(
                        'A user in this group chat is blocked and won\'t have their messages show up. ',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Montserrat',
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
