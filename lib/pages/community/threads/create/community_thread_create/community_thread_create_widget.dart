import '/backend/supabase/supabase.dart';
import '/components/empty_loading_widget.dart';
import '/components/removable_image_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/pages/community/threads/create/components/community_thread_bottom_sheet/community_thread_bottom_sheet_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';
import 'community_thread_create_model.dart';
export 'community_thread_create_model.dart';

class CommunityThreadCreateWidget extends StatefulWidget {
  const CommunityThreadCreateWidget({super.key});

  static String routeName = 'CommunityThreadCreate';
  static String routePath = '/communityThreadCreate';

  @override
  State<CommunityThreadCreateWidget> createState() =>
      _CommunityThreadCreateWidgetState();
}

class _CommunityThreadCreateWidgetState
    extends State<CommunityThreadCreateWidget> {
  late CommunityThreadCreateModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommunityThreadCreateModel());

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
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.close,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 20.0,
            ),
            onPressed: _model.disableButton
                ? null
                : () async {
                    _model.disableButton = true;
                    safeSetState(() {});
                    _model.community2 =
                        await CommunityWithImageTable().queryRows(
                      queryFn: (q) => q.eqOrNull(
                        'id',
                        FFAppState().selectedCommunity,
                      ),
                    );
                    _model.disableButton = false;
                    safeSetState(() {});
                    FFAppState().selectedCommunity = -1;
                    safeSetState(() {});

                    context.goNamed(
                      CommunityDetailWidget.routeName,
                      queryParameters: {
                        'community': serializeParam(
                          _model.community2?.firstOrNull,
                          ParamType.SupabaseRow,
                        ),
                        'isShow': serializeParam(
                          true,
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
                          transitionType: PageTransitionType.leftToRight,
                        ),
                      },
                    );

                    safeSetState(() {});
                  },
          ),
          actions: [
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                child: FFButtonWidget(
                  onPressed: (((functions.getStringLength(
                                      _model.textController.text) ==
                                  0) ||
                              (FFAppState().selectedCommunity == null)) ||
                          _model.disableButton)
                      ? null
                      : () async {
                          _model.disableButton = true;
                          safeSetState(() {});
                          if (_model.uploadedImages.isNotEmpty) {
                            {
                              safeSetState(() => _model
                                  .isDataUploading_uploadedThreadImage = true);
                              var selectedUploadedFiles = <FFUploadedFile>[];
                              var selectedMedia = <SelectedFile>[];
                              var downloadUrls = <String>[];
                              try {
                                selectedUploadedFiles = _model.uploadedImages;
                                selectedMedia = selectedFilesFromUploadedFiles(
                                  selectedUploadedFiles,
                                  storageFolderPath: 'communities',
                                  isMultiData: true,
                                );
                                downloadUrls = await uploadSupabaseStorageFiles(
                                  bucketName: 'liddel',
                                  selectedFiles: selectedMedia,
                                );
                              } finally {
                                _model.isDataUploading_uploadedThreadImage =
                                    false;
                              }
                              if (selectedUploadedFiles.length ==
                                      selectedMedia.length &&
                                  downloadUrls.length == selectedMedia.length) {
                                safeSetState(() {
                                  _model.uploadedLocalFiles_uploadedThreadImage =
                                      selectedUploadedFiles;
                                  _model.uploadedFileUrls_uploadedThreadImage =
                                      downloadUrls;
                                });
                              } else {
                                safeSetState(() {});
                                return;
                              }
                            }

                            await CommunityThreadsTable().insert({
                              'community_id': FFAppState().selectedCommunity,
                              'creator_id': FFAppState().userInfo.id,
                              'content': _model.textController.text,
                              'image_url':
                                  _model.uploadedFileUrls_uploadedThreadImage,
                            });
                          } else {
                            await CommunityThreadsTable().insert({
                              'community_id': FFAppState().selectedCommunity,
                              'creator_id': FFAppState().userInfo.id,
                              'content': _model.textController.text,
                            });
                          }

                          _model.community =
                              await CommunityWithImageTable().queryRows(
                            queryFn: (q) => q.eqOrNull(
                              'id',
                              FFAppState().selectedCommunity,
                            ),
                          );
                          await NotificationsTable().insert({
                            'user_id': FFAppState().userInfo.id,
                            'target_id':
                                _model.community?.firstOrNull?.creatorId,
                            'notification_flag': 4,
                          });
                          _model.disableButton = false;
                          _model.uploadedImages = [];
                          safeSetState(() {});
                          FFAppState().selectedCommunity = -1;

                          context.goNamed(
                            CommunityDetailWidget.routeName,
                            queryParameters: {
                              'community': serializeParam(
                                _model.community?.firstOrNull,
                                ParamType.SupabaseRow,
                              ),
                              'isShow': serializeParam(
                                true,
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
                                transitionType: PageTransitionType.leftToRight,
                              ),
                            },
                          );

                          safeSetState(() {});
                        },
                  text: '投稿',
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          font: GoogleFonts.notoSansJp(
                            fontWeight: FontWeight.w500,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontStyle,
                          ),
                          color: Colors.white,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(8.0),
                    disabledColor: FlutterFlowTheme.of(context).Main50,
                  ),
                ),
              ),
            ),
          ],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 8.0, 16.0, 8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FutureBuilder<List<ProfileWithDetailRow>>(
                              future: ProfileWithDetailTable().querySingleRow(
                                queryFn: (q) => q.eqOrNull(
                                  'user_id',
                                  FFAppState().userInfo.id,
                                ),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return EmptyLoadingWidget();
                                }
                                List<ProfileWithDetailRow>
                                    containerProfileWithDetailRowList =
                                    snapshot.data!;

                                final containerProfileWithDetailRow =
                                    containerProfileWithDetailRowList.isNotEmpty
                                        ? containerProfileWithDetailRowList
                                            .first
                                        : null;

                                return Container(
                                  decoration: BoxDecoration(),
                                  child: Container(
                                    width: 45.0,
                                    height: 45.0,
                                    child: Stack(
                                      children: [
                                        Builder(
                                          builder: (context) {
                                            if (containerProfileWithDetailRow
                                                        ?.profileImage !=
                                                    null &&
                                                containerProfileWithDetailRow
                                                        ?.profileImage !=
                                                    '') {
                                              return ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                                child: OctoImage(
                                                  placeholderBuilder: (_) =>
                                                      SizedBox.expand(
                                                    child: Image(
                                                      image: BlurHashImage(
                                                          'BlurHashString'),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  image: NetworkImage(
                                                    containerProfileWithDetailRow!
                                                        .profileImage!,
                                                  ),
                                                  width: 40.0,
                                                  height: 40.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              );
                                            } else {
                                              return ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                                child: Image.asset(
                                                  'assets/images/image-profile.png',
                                                  width: 40.0,
                                                  height: 40.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              );
                                            }
                                          },
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(1.0, 1.0),
                                          child: Builder(
                                            builder: (context) {
                                              if (containerProfileWithDetailRow
                                                          ?.iconBadgeUrl !=
                                                      null &&
                                                  containerProfileWithDetailRow
                                                          ?.iconBadgeUrl !=
                                                      '') {
                                                return Container(
                                                  width: 20.0,
                                                  height: 20.0,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Image.network(
                                                    containerProfileWithDetailRow!
                                                        .iconBadgeUrl!,
                                                    fit: BoxFit.cover,
                                                  ),
                                                );
                                              } else {
                                                return Container(
                                                  width: 20.0,
                                                  height: 20.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0x00FFFFFF),
                                                  ),
                                                );
                                              }
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                            Expanded(
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (context) {
                                      return GestureDetector(
                                        onTap: () {
                                          FocusScope.of(context).unfocus();
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus();
                                        },
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child:
                                              CommunityThreadBottomSheetWidget(),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).gray10,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(8.0),
                                      bottomRight: Radius.circular(8.0),
                                      topLeft: Radius.circular(8.0),
                                      topRight: Radius.circular(8.0),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 8.0, 16.0, 8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Builder(
                                          builder: (context) {
                                            if (FFAppState()
                                                    .selectedCommunity ==
                                                -1) {
                                              return Text(
                                                'スレッド投稿先を選択',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .notoSansJp(
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .gray80,
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
                                              );
                                            } else {
                                              return FutureBuilder<
                                                  List<CommunitiesRow>>(
                                                future: CommunitiesTable()
                                                    .querySingleRow(
                                                  queryFn: (q) => q.eqOrNull(
                                                    'id',
                                                    FFAppState()
                                                        .selectedCommunity,
                                                  ),
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          valueColor:
                                                              AlwaysStoppedAnimation<
                                                                  Color>(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<CommunitiesRow>
                                                      textCommunitiesRowList =
                                                      snapshot.data!;

                                                  final textCommunitiesRow =
                                                      textCommunitiesRowList
                                                              .isNotEmpty
                                                          ? textCommunitiesRowList
                                                              .first
                                                          : null;

                                                  return Text(
                                                    valueOrDefault<String>(
                                                      textCommunitiesRow?.name,
                                                      'スレッド投稿先を選択スレッド投稿先を選択スレッド投稿先を選択スレッド投稿先を選択',
                                                    ).maybeHandleOverflow(
                                                      maxChars: 12,
                                                      replacement: '…',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .notoSansJp(
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
                                                  );
                                                },
                                              );
                                            }
                                          },
                                        ),
                                        Icon(
                                          Icons.arrow_drop_down,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ].divide(SizedBox(width: 16.0)),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).gray10,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Form(
                              key: _model.formKey,
                              autovalidateMode: AutovalidateMode.disabled,
                              child: TextFormField(
                                controller: _model.textController,
                                focusNode: _model.textFieldFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.textController',
                                  Duration(milliseconds: 50),
                                  () => safeSetState(() {}),
                                ),
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: true,
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        font: GoogleFonts.notoSansJp(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                  hintText: '今何してる？',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        font: GoogleFonts.notoSansJp(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                        color:
                                            FlutterFlowTheme.of(context).gray80,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  filled: true,
                                  fillColor:
                                      FlutterFlowTheme.of(context).gray10,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.notoSansJp(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                maxLines: null,
                                maxLength: 150,
                                maxLengthEnforcement:
                                    MaxLengthEnforcement.enforced,
                                buildCounter: (context,
                                        {required currentLength,
                                        required isFocused,
                                        maxLength}) =>
                                    null,
                                cursorColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                enableInteractiveSelection: true,
                                validator: _model.textControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                            Builder(
                              builder: (context) {
                                if (_model.uploadedImages.isNotEmpty) {
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: Container(
                                      height: 160.0,
                                      decoration: BoxDecoration(),
                                      child: Builder(
                                        builder: (context) {
                                          final imageList =
                                              _model.uploadedImages.toList();

                                          return SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: List.generate(
                                                  imageList.length,
                                                  (imageListIndex) {
                                                final imageListItem =
                                                    imageList[imageListIndex];
                                                return Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: wrapWithModel(
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
                                                        'Keyhmv_${imageListIndex.toString()}',
                                                      ),
                                                      uploadedImage:
                                                          imageListItem,
                                                      width: 200,
                                                      height: 160,
                                                      deleteAction: () async {
                                                        _model
                                                            .removeFromUploadedImages(
                                                                imageListItem);
                                                        safeSetState(() {});
                                                      },
                                                    ),
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
                                    width: double.infinity,
                                    height: 1.0,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).gray10,
                                    ),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 2.0,
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 12.0, 8.0, 12.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    _model.disableButton = true;
                                    _model.canUpload = true;
                                    safeSetState(() {});
                                    if (_model.uploadedImages.length >= 4) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            '画像をこれ以上追加できません。',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                        ),
                                      );
                                    } else {
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
                                                .isDataUploading_createdThreadImage =
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
                                          _model.isDataUploading_createdThreadImage =
                                              false;
                                        }
                                        if (selectedUploadedFiles.length ==
                                            selectedMedia.length) {
                                          safeSetState(() {
                                            _model.uploadedLocalFile_createdThreadImage =
                                                selectedUploadedFiles.first;
                                          });
                                        } else {
                                          safeSetState(() {});
                                          return;
                                        }
                                      }

                                      if ((_model.uploadedLocalFile_createdThreadImage
                                                  .bytes?.isNotEmpty ??
                                              false)) {
                                        _model.validateThreadImage =
                                            await actions.validateImageFile(
                                          _model
                                              .uploadedLocalFile_createdThreadImage,
                                        );
                                        if (_model.validateThreadImage!) {
                                          _model.addToUploadedImages(_model
                                              .uploadedLocalFile_createdThreadImage);
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
                                                      .secondaryBackground,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .success,
                                            ),
                                          );
                                        }

                                        safeSetState(() {
                                          _model.isDataUploading_createdThreadImage =
                                              false;
                                          _model.uploadedLocalFile_createdThreadImage =
                                              FFUploadedFile(
                                                  bytes:
                                                      Uint8List.fromList([]));
                                        });
                                      }
                                    }

                                    _model.disableButton = false;
                                    safeSetState(() {});

                                    safeSetState(() {});
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(0.0),
                                    child: SvgPicture.asset(
                                      'assets/images/ic-photo-add.svg',
                                      width: 32.0,
                                      height: 32.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      functions
                                          .getStringLength(
                                              _model.textController.text)
                                          .toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.notoSansJp(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                    Text(
                                      '/150',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.notoSansJp(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .gray80,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ],
                                ),
                              ].divide(SizedBox(width: 16.0)),
                            ),
                          ),
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
    );
  }
}
