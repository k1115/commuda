import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/home/user/components/user_bottom_sheet/user_bottom_sheet_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'friend_item_model.dart';
export 'friend_item_model.dart';

class FriendItemWidget extends StatefulWidget {
  const FriendItemWidget({
    super.key,
    required this.friend,
  });

  final FriendsProfileViewRow? friend;

  @override
  State<FriendItemWidget> createState() => _FriendItemWidgetState();
}

class _FriendItemWidgetState extends State<FriendItemWidget> {
  late FriendItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FriendItemModel());

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

    return Container(
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
                            if (widget.friend?.friendProfileImage != null &&
                                widget.friend?.friendProfileImage != '') {
                              return Container(
                                width: 40.0,
                                height: 40.0,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.network(
                                  widget.friend!.friendProfileImage!,
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
                        Builder(
                          builder: (context) {
                            if (widget.friend?.friendProfileImage != null &&
                                widget.friend?.friendProfileImage != '') {
                              return Align(
                                alignment: AlignmentDirectional(1.0, 1.0),
                                child: Container(
                                  width: 20.0,
                                  height: 20.0,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network(
                                    widget.friend!.friendBadgeIconUrl!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            } else {
                              return Align(
                                alignment: AlignmentDirectional(1.0, 1.0),
                                child: Container(
                                  width: 0.0,
                                  height: 0.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      valueOrDefault<String>(
                        widget.friend?.friendNickName,
                        '未設定',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                await showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  enableDrag: false,
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: MediaQuery.viewInsetsOf(context),
                      child: UserBottomSheetWidget(
                        currentUser: FFAppState().userInfo.id,
                        targetUser: widget.friend!.friendId!,
                      ),
                    );
                  },
                ).then((value) => safeSetState(() {}));
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
    );
  }
}
