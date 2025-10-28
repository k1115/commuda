import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/community/components/toggle_menu_bottom_sheet/toggle_menu_bottom_sheet_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';
import 'community_member_item_model.dart';
export 'community_member_item_model.dart';

class CommunityMemberItemWidget extends StatefulWidget {
  const CommunityMemberItemWidget({
    super.key,
    required this.communityMember,
  });

  final CommunityMembersDetailRow? communityMember;

  @override
  State<CommunityMemberItemWidget> createState() =>
      _CommunityMemberItemWidgetState();
}

class _CommunityMemberItemWidgetState extends State<CommunityMemberItemWidget> {
  late CommunityMemberItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommunityMemberItemModel());

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

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        _model.currentUserOutput = await UsersTable().queryRows(
          queryFn: (q) => q.eqOrNull(
            'auth_user_id',
            currentUserUid,
          ),
        );
        _model.targetUserOutput = await UserWithProfileTable().queryRows(
          queryFn: (q) => q.eqOrNull(
            'id',
            widget.communityMember?.userId,
          ),
        );

        context.pushNamed(
          UserWidget.routeName,
          queryParameters: {
            'targetUser': serializeParam(
              _model.targetUserOutput?.firstOrNull,
              ParamType.SupabaseRow,
            ),
            'currentUserId': serializeParam(
              _model.currentUserOutput?.firstOrNull?.id,
              ParamType.int,
            ),
            'communityId': serializeParam(
              widget.communityMember?.communityId,
              ParamType.int,
            ),
          }.withoutNulls,
        );

        safeSetState(() {});
      },
      child: Container(
        decoration: BoxDecoration(),
        child: Container(
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            border: Border.all(
              color: FlutterFlowTheme.of(context).alternate,
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      decoration: BoxDecoration(),
                      child: Container(
                        width: 45.0,
                        height: 45.0,
                        child: Stack(
                          children: [
                            Builder(
                              builder: (context) {
                                if (widget.communityMember?.profileImage !=
                                        null &&
                                    widget.communityMember?.profileImage !=
                                        '') {
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(24.0),
                                    child: OctoImage(
                                      placeholderBuilder: (_) =>
                                          SizedBox.expand(
                                        child: Image(
                                          image:
                                              BlurHashImage('BlurHashString'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      image: NetworkImage(
                                        widget.communityMember!.profileImage!,
                                      ),
                                      width: 40.0,
                                      height: 40.0,
                                      fit: BoxFit.cover,
                                    ),
                                  );
                                } else {
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(24.0),
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
                              alignment: AlignmentDirectional(1.0, 1.0),
                              child: Builder(
                                builder: (context) {
                                  if (widget.communityMember?.iconBadgeUrl !=
                                          null &&
                                      widget.communityMember?.iconBadgeUrl !=
                                          '') {
                                    return Container(
                                      width: 20.0,
                                      height: 20.0,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.network(
                                        widget.communityMember!.iconBadgeUrl!,
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
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (widget.communityMember?.isCommunityOwner ?? true)
                          Text(
                            'コミュニティオーナー',
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
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        Text(
                          valueOrDefault<String>(
                            widget.communityMember?.nickName,
                            '未設定',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
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
                      ],
                    ),
                  ].divide(SizedBox(width: 8.0)),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    if (widget.communityMember?.userId !=
                        FFAppState().userInfo.id) {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.viewInsetsOf(context),
                            child: ToggleMenuBottomSheetWidget(
                              userID: widget.communityMember!.userId!,
                              communityID:
                                  widget.communityMember!.communityId!,
                              currentUserId: FFAppState().userInfo.id,
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));
                    }
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: SvgPicture.asset(
                      'assets/images/ic-more_vert-color.svg',
                      width: 24.0,
                      height: 24.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
