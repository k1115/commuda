import '/backend/supabase/supabase.dart';
import '/components/empty_loading_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'community_main_info_member_list_item_model.dart';
export 'community_main_info_member_list_item_model.dart';

class CommunityMainInfoMemberListItemWidget extends StatefulWidget {
  const CommunityMainInfoMemberListItemWidget({
    super.key,
    this.userID,
    required this.community,
  });

  final int? userID;
  final CommunityWithImageRow? community;

  @override
  State<CommunityMainInfoMemberListItemWidget> createState() =>
      _CommunityMainInfoMemberListItemWidgetState();
}

class _CommunityMainInfoMemberListItemWidgetState
    extends State<CommunityMainInfoMemberListItemWidget> {
  late CommunityMainInfoMemberListItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommunityMainInfoMemberListItemModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<UserWithProfileRow>>(
      future: UserWithProfileTable().querySingleRow(
        queryFn: (q) => q.eqOrNull(
          'id',
          widget.userID,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return EmptyLoadingWidget();
        }
        List<UserWithProfileRow> containerUserWithProfileRowList =
            snapshot.data!;

        final containerUserWithProfileRow =
            containerUserWithProfileRowList.isNotEmpty
                ? containerUserWithProfileRowList.first
                : null;

        return Container(
          decoration: BoxDecoration(),
          child: Row(
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
                          if (containerUserWithProfileRow?.profileImage !=
                                  null &&
                              containerUserWithProfileRow?.profileImage != '') {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(24.0),
                              child: OctoImage(
                                placeholderBuilder: (_) => SizedBox.expand(
                                  child: Image(
                                    image: BlurHashImage('BlurHashString'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                image: NetworkImage(
                                  containerUserWithProfileRow!.profileImage!,
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
                            if (containerUserWithProfileRow?.iconBadgeUrl !=
                                    null &&
                                containerUserWithProfileRow?.iconBadgeUrl !=
                                    '') {
                              return Container(
                                width: 20.0,
                                height: 20.0,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.network(
                                  containerUserWithProfileRow!.iconBadgeUrl!,
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
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.community?.creatorId == widget.userID)
                    Text(
                      'コミュニティオーナー',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.notoSansJp(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).gray100,
                            fontSize: 12.0,
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
                      containerUserWithProfileRow?.nickName,
                      'user',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.notoSansJp(
                            fontWeight: FontWeight.w500,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ],
              ),
            ].divide(SizedBox(width: 11.0)),
          ),
        );
      },
    );
  }
}
