import '/backend/supabase/supabase.dart';
import '/components/empty_list_widget.dart';
import '/components/empty_loading_widget.dart';
import '/components/removable_image_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import '/pages/community/threads/components/community_thread_comment/community_thread_comment_widget.dart';
import '/pages/community/threads/components/community_thread_header/community_thread_header_widget.dart';
import '/pages/home/components/bottom_sheets/identity_confirmation_bottom_sheet/identity_confirmation_bottom_sheet_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'community_thread_detail_model.dart';
export 'community_thread_detail_model.dart';

class CommunityThreadDetailWidget extends StatefulWidget {
  const CommunityThreadDetailWidget({
    super.key,
    required this.thread,
    required this.previousPath,
  });

  final CommunityThreadDetailsRow? thread;
  final String? previousPath;

  static String routeName = 'CommunityThreadDetail';
  static String routePath = '/communityThreadDetail';

  @override
  State<CommunityThreadDetailWidget> createState() =>
      _CommunityThreadDetailWidgetState();
}

class _CommunityThreadDetailWidgetState
    extends State<CommunityThreadDetailWidget> {
  late CommunityThreadDetailModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommunityThreadDetailModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<CommunityThreadCommentsDetailsRow>>(
      future: (_model.requestCompleter ??=
              Completer<List<CommunityThreadCommentsDetailsRow>>()
                ..complete(CommunityThreadCommentsDetailsTable().queryRows(
                  queryFn: (q) => q
                      .eqOrNull(
                        'thread_id',
                        widget.thread?.id,
                      )
                      .order('created_at'),
                )))
          .future,
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).gray10,
            body: EmptyLoadingWidget(),
          );
        }
        List<CommunityThreadCommentsDetailsRow>
            communityThreadDetailCommunityThreadCommentsDetailsRowList =
            snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).gray10,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              automaticallyImplyLeading: false,
              leading: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    if (widget.previousPath == 'News') {
                      context.goNamed(
                        NewsWidget.routeName,
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.rightToLeft,
                          ),
                        },
                      );
                    } else {
                      if (widget.previousPath == 'CommunityDetail') {
                        _model.communityOutput =
                            await CommunityWithImageTable().queryRows(
                          queryFn: (q) => q.eqOrNull(
                            'id',
                            widget.thread?.communityId,
                          ),
                        );
                        _model.communityMemberOutput =
                            await CommunityMembersTable().queryRows(
                          queryFn: (q) => q
                              .eqOrNull(
                                'community_id',
                                widget.thread?.communityId,
                              )
                              .eqOrNull(
                                'user_id',
                                FFAppState().userInfo.id,
                              )
                              .eqOrNull(
                                'participate_status',
                                1,
                              ),
                        );

                        context.goNamed(
                          CommunityDetailWidget.routeName,
                          queryParameters: {
                            'community': serializeParam(
                              _model.communityOutput?.firstOrNull,
                              ParamType.SupabaseRow,
                            ),
                            'isShow': serializeParam(
                              ((widget.thread?.privacyType == 0) ||
                                      (widget.thread?.privacyType == 1)) ||
                                  ((widget.thread?.privacyType == 3) &&
                                      (_model.communityMemberOutput != null &&
                                          (_model.communityMemberOutput)!
                                              .isNotEmpty)),
                              ParamType.bool,
                            ),
                            'isInvite': serializeParam(
                              false,
                              ParamType.bool,
                            ),
                          }.withoutNulls,
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.rightToLeft,
                            ),
                          },
                        );
                      } else {
                        context.goNamed(
                          HomeWidget.routeName,
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.rightToLeft,
                            ),
                          },
                        );
                      }
                    }

                    safeSetState(() {});
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: SvgPicture.asset(
                      'assets/images/ic-back.svg',
                      width: 32.0,
                      height: 32.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              actions: [],
              flexibleSpace: FlexibleSpaceBar(
                title: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'スレッド',
                      style: FlutterFlowTheme.of(context).titleSmall.override(
                            font: GoogleFonts.notoSansJp(
                              fontWeight: FontWeight.normal,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .fontStyle,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontStyle,
                          ),
                    ),
                    Text(
                      valueOrDefault<String>(
                        widget.thread?.content,
                        '未設定未設定未設定未設定未設定未設定未設定未設定未設定未設定未設定未設定未設定未設定',
                      ).maybeHandleOverflow(
                        maxChars: 20,
                        replacement: '…',
                      ),
                      maxLines: 1,
                      style: FlutterFlowTheme.of(context).titleSmall.override(
                            font: GoogleFonts.notoSansJp(
                              fontWeight: FontWeight.normal,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).gray100,
                            fontSize: 12.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontStyle,
                          ),
                    ),
                  ],
                ),
                centerTitle: false,
                expandedTitleScale: 1.0,
                titlePadding:
                    EdgeInsetsDirectional.fromSTEB(52.0, 0.0, 0.0, 8.0),
              ),
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (_model.showThread)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 1.0, 0.0, 0.0),
                            child: wrapWithModel(
                              model: _model.communityThreadHeaderModel,
                              updateCallback: () => safeSetState(() {}),
                              child: CommunityThreadHeaderWidget(
                                thread: widget.thread!,
                                enableButton: false,
                              ),
                            ),
                          ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 8.0, 8.0, 8.0),
                                child: Text(
                                  'コメント',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.notoSansJp(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(),
                            child: Builder(
                              builder: (context) {
                                final containerVar =
                                    communityThreadDetailCommunityThreadCommentsDetailsRowList
                                        .toList();
                                if (containerVar.isEmpty) {
                                  return EmptyListWidget(
                                    text: 'コメントがありません。',
                                  );
                                }

                                return RefreshIndicator(
                                  onRefresh: () async {
                                    safeSetState(
                                        () => _model.requestCompleter = null);
                                    await _model.waitForRequestCompleted();
                                  },
                                  child: SingleChildScrollView(
                                    physics:
                                        const AlwaysScrollableScrollPhysics(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children:
                                          List.generate(containerVar.length,
                                              (containerVarIndex) {
                                        final containerVarItem =
                                            containerVar[containerVarIndex];
                                        return wrapWithModel(
                                          model: _model
                                              .communityThreadCommentModels
                                              .getModel(
                                            containerVarItem.id!.toString(),
                                            containerVarIndex,
                                          ),
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: CommunityThreadCommentWidget(
                                            key: Key(
                                              'Keysnk_${containerVarItem.id!.toString()}',
                                            ),
                                            comment: containerVarItem,
                                            metion: () async {
                                              _model.userOutput =
                                                  await UsersTable().queryRows(
                                                queryFn: (q) => q.eqOrNull(
                                                  'id',
                                                  containerVarItem.creatorId,
                                                ),
                                              );
                                              safeSetState(() {
                                                _model.textController?.text =
                                                    '@${_model.userOutput?.firstOrNull?.nickName}';
                                              });
                                              _model.metionId =
                                                  containerVarItem.creatorId;
                                              safeSetState(() {});

                                              safeSetState(() {});
                                            },
                                          ),
                                        );
                                      }),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ].divide(SizedBox(height: 1.0)),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    elevation: 2.0,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Builder(
                            builder: (context) {
                              if (_model.image.isNotEmpty) {
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 8.0, 16.0, 8.0),
                                  child: Container(
                                    decoration: BoxDecoration(),
                                    child: Builder(
                                      builder: (context) {
                                        final imageList = _model.image.toList();

                                        return SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children:
                                                List.generate(imageList.length,
                                                    (imageListIndex) {
                                              final imageListItem =
                                                  imageList[imageListIndex];
                                              return wrapWithModel(
                                                model: _model
                                                    .removableImageModels
                                                    .getModel(
                                                  imageListIndex.toString(),
                                                  imageListIndex,
                                                ),
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: RemovableImageWidget(
                                                  key: Key(
                                                    'Key1ph_${imageListIndex.toString()}',
                                                  ),
                                                  uploadedImage: imageListItem,
                                                  width: 200,
                                                  height: 160,
                                                  deleteAction: () async {
                                                    _model.removeFromImage(
                                                        imageListItem);
                                                    safeSetState(() {});
                                                  },
                                                ),
                                              );
                                            }),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                );
                              } else {
                                return Container(
                                  width: 0.0,
                                  height: 0.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                );
                              }
                            },
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 12.0, 8.0, 12.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (!_model.disableButton) {
                                      _model.disableButton = true;
                                      safeSetState(() {});
                                      final selectedMedia =
                                          await selectMediaWithSourceBottomSheet(
                                        context: context,
                                        maxWidth: 800.00,
                                        maxHeight: 600.00,
                                        imageQuality: 80,
                                        allowPhoto: true,
                                        includeBlurHash: true,
                                      );
                                      if (selectedMedia != null &&
                                          selectedMedia.every((m) =>
                                              validateFileFormat(
                                                  m.storagePath, context))) {
                                        safeSetState(() => _model
                                                .isDataUploading_createdImageForComment =
                                            true);
                                        var selectedUploadedFiles =
                                            <FFUploadedFile>[];

                                        try {
                                          selectedUploadedFiles = selectedMedia
                                              .map((m) => FFUploadedFile(
                                                    name: m.storagePath
                                                        .split('/')
                                                        .last,
                                                    bytes: m.bytes,
                                                    height:
                                                        m.dimensions?.height,
                                                    width: m.dimensions?.width,
                                                    blurHash: m.blurHash,
                                                  ))
                                              .toList();
                                        } finally {
                                          _model.isDataUploading_createdImageForComment =
                                              false;
                                        }
                                        if (selectedUploadedFiles.length ==
                                            selectedMedia.length) {
                                          safeSetState(() {
                                            _model.uploadedLocalFile_createdImageForComment =
                                                selectedUploadedFiles.first;
                                          });
                                        } else {
                                          safeSetState(() {});
                                          return;
                                        }
                                      }

                                      if ((_model.uploadedLocalFile_createdImageForComment
                                                  .bytes?.isNotEmpty ??
                                              false)) {
                                        _model.validateCreatedImage =
                                            await actions.validateImageFile(
                                          _model
                                              .uploadedLocalFile_createdImageForComment,
                                        );
                                        if (_model.validateCreatedImage!) {
                                          _model.addToImage(_model
                                              .uploadedLocalFile_createdImageForComment);
                                          safeSetState(() {});
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'この画像はアップロードできません。',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .warning,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .warningLight,
                                            ),
                                          );
                                        }

                                        safeSetState(() {
                                          _model.isDataUploading_createdImageForComment =
                                              false;
                                          _model.uploadedLocalFile_createdImageForComment =
                                              FFUploadedFile(
                                                  bytes:
                                                      Uint8List.fromList([]));
                                        });

                                        _model.disableButton = false;
                                        safeSetState(() {});
                                      }
                                    }

                                    safeSetState(() {});
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(0.0),
                                    child: SvgPicture.asset(
                                      'assets/images/ic-photo.svg',
                                      width: 32.0,
                                      height: 32.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).gray10,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(36.0),
                                        bottomRight: Radius.circular(36.0),
                                        topLeft: Radius.circular(36.0),
                                        topRight: Radius.circular(36.0),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 8.0, 16.0, 8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: TextFormField(
                                              controller: _model.textController,
                                              focusNode:
                                                  _model.textFieldFocusNode,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                '_model.textController',
                                                Duration(milliseconds: 100),
                                                () => safeSetState(() {}),
                                              ),
                                              autofocus: false,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                isDense: true,
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .notoSansJp(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                hintText: 'テキストを入力',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .notoSansJp(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .gray10,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font:
                                                        GoogleFonts.notoSansJp(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                              maxLines: null,
                                              cursorColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              enableInteractiveSelection: true,
                                              validator: _model
                                                  .textControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                          FlutterFlowIconButton(
                                            borderRadius: 24.0,
                                            buttonSize: 40.0,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            icon: Icon(
                                              Icons.arrow_forward_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              size: 24.0,
                                            ),
                                            onPressed: (((_model.textController
                                                                    .text ==
                                                                '') &&
                                                        !(_model.image
                                                            .isNotEmpty)) ||
                                                    _model.disableButton)
                                                ? null
                                                : () async {
                                                    while (true) {
                                                      if (FFAppState()
                                                                  .userInfo
                                                                  .phone !=
                                                              '') {
                                                        _model.disableButton =
                                                            true;
                                                        safeSetState(() {});
                                                        if (_model
                                                            .image.isNotEmpty) {
                                                          for (int loop1Index =
                                                                  0;
                                                              loop1Index <
                                                                  _model.image
                                                                      .length;
                                                              loop1Index++) {
                                                            final currentLoop1Item =
                                                                _model.image[
                                                                    loop1Index];
                                                            {
                                                              safeSetState(() =>
                                                                  _model.isDataUploading_uploadedImageForComment =
                                                                      true);
                                                              var selectedUploadedFiles =
                                                                  <FFUploadedFile>[];
                                                              var selectedMedia =
                                                                  <SelectedFile>[];
                                                              var downloadUrls =
                                                                  <String>[];
                                                              try {
                                                                selectedUploadedFiles =
                                                                    currentLoop1Item
                                                                            .bytes!
                                                                            .isNotEmpty
                                                                        ? [
                                                                            currentLoop1Item
                                                                          ]
                                                                        : <FFUploadedFile>[];
                                                                selectedMedia =
                                                                    selectedFilesFromUploadedFiles(
                                                                  selectedUploadedFiles,
                                                                  storageFolderPath:
                                                                      'comments',
                                                                );
                                                                downloadUrls =
                                                                    await uploadSupabaseStorageFiles(
                                                                  bucketName:
                                                                      'liddel',
                                                                  selectedFiles:
                                                                      selectedMedia,
                                                                );
                                                              } finally {
                                                                _model.isDataUploading_uploadedImageForComment =
                                                                    false;
                                                              }
                                                              if (selectedUploadedFiles
                                                                          .length ==
                                                                      selectedMedia
                                                                          .length &&
                                                                  downloadUrls
                                                                          .length ==
                                                                      selectedMedia
                                                                          .length) {
                                                                safeSetState(
                                                                    () {
                                                                  _model.uploadedLocalFile_uploadedImageForComment =
                                                                      selectedUploadedFiles
                                                                          .first;
                                                                  _model.uploadedFileUrl_uploadedImageForComment =
                                                                      downloadUrls
                                                                          .first;
                                                                });
                                                              } else {
                                                                safeSetState(
                                                                    () {});
                                                                return;
                                                              }
                                                            }

                                                            _model.addToImageURL(
                                                                _model
                                                                    .uploadedFileUrl_uploadedImageForComment);
                                                          }
                                                          _model.commentOutput1 =
                                                              await CommunityThreadCommentsTable()
                                                                  .insert({
                                                            'thread_id': widget
                                                                .thread?.id,
                                                            'creator_id':
                                                                FFAppState()
                                                                    .userInfo
                                                                    .id,
                                                            'content': _model
                                                                .textController
                                                                .text,
                                                            'community_id':
                                                                widget.thread
                                                                    ?.communityId,
                                                            'image':
                                                                _model.imageURL,
                                                          });
                                                          _model.commentId =
                                                              _model
                                                                  .commentOutput1
                                                                  ?.id;
                                                          safeSetState(() {});
                                                          safeSetState(() {
                                                            _model.isDataUploading_uploadedImageForComment =
                                                                false;
                                                            _model.uploadedLocalFile_uploadedImageForComment =
                                                                FFUploadedFile(
                                                                    bytes: Uint8List
                                                                        .fromList(
                                                                            []));
                                                            _model.uploadedFileUrl_uploadedImageForComment =
                                                                '';
                                                          });
                                                        } else {
                                                          _model.commentOutput2 =
                                                              await CommunityThreadCommentsTable()
                                                                  .insert({
                                                            'thread_id': widget
                                                                .thread?.id,
                                                            'creator_id':
                                                                FFAppState()
                                                                    .userInfo
                                                                    .id,
                                                            'content': _model
                                                                .textController
                                                                .text,
                                                            'community_id':
                                                                widget.thread
                                                                    ?.communityId,
                                                          });
                                                          _model.commentId =
                                                              _model
                                                                  .commentOutput2
                                                                  ?.id;
                                                          safeSetState(() {});
                                                        }

                                                        if (widget.thread
                                                                ?.creatorId !=
                                                            FFAppState()
                                                                .userInfo
                                                                .id) {
                                                          await CommunityAnnouncementsTable()
                                                              .insert({
                                                            'thread_id': widget
                                                                .thread?.id,
                                                            'type': 0,
                                                            'user_id': widget
                                                                .thread
                                                                ?.creatorId,
                                                            'creator_id':
                                                                FFAppState()
                                                                    .userInfo
                                                                    .id,
                                                            'comment_id': _model
                                                                .commentId,
                                                            'is_read': false,
                                                          });
                                                          await NotificationsTable()
                                                              .insert({
                                                            'user_id':
                                                                FFAppState()
                                                                    .userInfo
                                                                    .id,
                                                            'target_id': widget
                                                                .thread
                                                                ?.creatorId,
                                                            'notification_flag':
                                                                0,
                                                          });
                                                        }
                                                        if (_model.metionId !=
                                                            null) {
                                                          await NotificationsTable()
                                                              .insert({
                                                            'user_id':
                                                                FFAppState()
                                                                    .userInfo
                                                                    .id,
                                                            'target_id':
                                                                _model.metionId,
                                                            'notification_flag':
                                                                3,
                                                          });
                                                          await CommunityAnnouncementsTable()
                                                              .insert({
                                                            'thread_id': widget
                                                                .thread?.id,
                                                            'type': 2,
                                                            'user_id': widget
                                                                .thread
                                                                ?.creatorId,
                                                            'creator_id':
                                                                FFAppState()
                                                                    .userInfo
                                                                    .id,
                                                            'is_read': false,
                                                            'mention': _model
                                                                .textController
                                                                .text,
                                                          });
                                                          _model.metionId =
                                                              null;
                                                          safeSetState(() {});
                                                        }
                                                        safeSetState(() {
                                                          _model.textController
                                                              ?.clear();
                                                        });
                                                        _model.image = [];
                                                        _model.imageURL = [];
                                                        _model.disableButton =
                                                            false;
                                                        safeSetState(() {});
                                                        break;
                                                      } else {
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          enableDrag: false,
                                                          context: context,
                                                          builder: (context) {
                                                            return GestureDetector(
                                                              onTap: () {
                                                                FocusScope.of(
                                                                        context)
                                                                    .unfocus();
                                                                FocusManager
                                                                    .instance
                                                                    .primaryFocus
                                                                    ?.unfocus();
                                                              },
                                                              child: Padding(
                                                                padding: MediaQuery
                                                                    .viewInsetsOf(
                                                                        context),
                                                                child:
                                                                    IdentityConfirmationBottomSheetWidget(),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            safeSetState(
                                                                () {}));

                                                        if (FFAppState()
                                                                    .userInfo
                                                                    .phone ==
                                                                '') {
                                                          break;
                                                        }
                                                      }
                                                    }

                                                    safeSetState(() {});
                                                  },
                                          ),
                                        ].divide(SizedBox(width: 8.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(width: 16.0)),
                            ),
                          ),
                        ],
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
