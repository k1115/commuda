import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'foot_print_item_model.dart';
export 'foot_print_item_model.dart';

class FootPrintItemWidget extends StatefulWidget {
  const FootPrintItemWidget({
    super.key,
    required this.footprint,
    required this.isMyFootPrint,
  });

  final FootprintDetailRow? footprint;
  final bool? isMyFootPrint;

  @override
  State<FootPrintItemWidget> createState() => _FootPrintItemWidgetState();
}

class _FootPrintItemWidgetState extends State<FootPrintItemWidget> {
  late FootPrintItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FootPrintItemModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
      mainAxisSize: MainAxisSize.min,
      children: [
        Builder(
          builder: (context) {
            if (!widget.isMyFootPrint!) {
              return InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  _model.targetOutput = await UserWithProfileTable().queryRows(
                    queryFn: (q) => q.eqOrNull(
                      'id',
                      widget.footprint?.userId,
                    ),
                  );

                  context.pushNamed(
                    UserWidget.routeName,
                    queryParameters: {
                      'targetUser': serializeParam(
                        _model.targetOutput?.firstOrNull,
                        ParamType.SupabaseRow,
                      ),
                      'currentUserId': serializeParam(
                        FFAppState().userInfo.id,
                        ParamType.int,
                      ),
                      'communityId': serializeParam(
                        widget.footprint?.communityId,
                        ParamType.int,
                      ),
                    }.withoutNulls,
                  );

                  safeSetState(() {});
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          valueOrDefault<String>(
                            dateTimeFormat(
                              "HH:mm",
                              widget.footprint?.createdAt,
                              locale: FFLocalizations.of(context).languageCode,
                            ),
                            '06:26',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.notoSansJp(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(0.0),
                                    child: SvgPicture.asset(
                                      'assets/images/ic-connect_without_contact.svg',
                                      width: 20.0,
                                      height: 20.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Text(
                                    valueOrDefault<String>(
                                      widget.footprint?.name,
                                      '未設定',
                                    ),
                                    maxLines: 2,
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
                                              .gray100,
                                          fontSize: 14.0,
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
                                ].divide(SizedBox(width: 4.0)),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  decoration: BoxDecoration(),
                                  child: Builder(
                                    builder: (context) {
                                      if (widget.footprint?.userProfileImage !=
                                              null &&
                                          widget.footprint?.userProfileImage !=
                                              '') {
                                        return Container(
                                          width: 40.0,
                                          height: 40.0,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.network(
                                            widget
                                                .footprint!.userProfileImage!,
                                            fit: BoxFit.cover,
                                          ),
                                        );
                                      } else {
                                        return Container(
                                          width: 40.0,
                                          height: 40.0,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.asset(
                                            'assets/images/image-profile.png',
                                            fit: BoxFit.cover,
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                                Text(
                                  valueOrDefault<String>(
                                    widget.footprint?.userNickName,
                                    '未設定',
                                  ),
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
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ].divide(SizedBox(width: 8.0)),
                            ),
                          ].divide(SizedBox(height: 8.0)),
                        ),
                      ].divide(SizedBox(width: 8.0)),
                    ),
                  ),
                ),
              );
            } else {
              return InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  _model.targetOutput2 = await UserWithProfileTable().queryRows(
                    queryFn: (q) => q.eqOrNull(
                      'id',
                      widget.footprint?.targetId,
                    ),
                  );

                  context.pushNamed(
                    UserWidget.routeName,
                    queryParameters: {
                      'targetUser': serializeParam(
                        _model.targetOutput2?.firstOrNull,
                        ParamType.SupabaseRow,
                      ),
                      'currentUserId': serializeParam(
                        FFAppState().userInfo.id,
                        ParamType.int,
                      ),
                      'communityId': serializeParam(
                        widget.footprint?.communityId,
                        ParamType.int,
                      ),
                    }.withoutNulls,
                  );

                  safeSetState(() {});
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          valueOrDefault<String>(
                            dateTimeFormat(
                              "HH:mm",
                              widget.footprint?.createdAt,
                              locale: FFLocalizations.of(context).languageCode,
                            ),
                            '06:26',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.notoSansJp(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              decoration: BoxDecoration(),
                              child: Builder(
                                builder: (context) {
                                  if (widget.footprint?.targetProfileImage !=
                                          null &&
                                      widget.footprint?.targetProfileImage !=
                                          '') {
                                    return Container(
                                      width: 40.0,
                                      height: 40.0,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.network(
                                        widget.footprint!.targetProfileImage!,
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  } else {
                                    return Container(
                                      width: 40.0,
                                      height: 40.0,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.asset(
                                        'assets/images/image-profile.png',
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                            Text(
                              valueOrDefault<String>(
                                widget.footprint?.targetNickName,
                                '未設定',
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
                            ),
                          ].divide(SizedBox(width: 8.0)),
                        ),
                      ].divide(SizedBox(width: 8.0)),
                    ),
                  ),
                ),
              );
            }
          },
        ),
        Divider(
          height: 2.0,
          thickness: 2.0,
          color: FlutterFlowTheme.of(context).gray20,
        ),
      ],
    );
  }
}
