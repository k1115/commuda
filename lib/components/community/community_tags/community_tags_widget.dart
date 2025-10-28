import '/components/community/community_tag/community_tag_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'community_tags_model.dart';
export 'community_tags_model.dart';

class CommunityTagsWidget extends StatefulWidget {
  const CommunityTagsWidget({
    super.key,
    required this.categories,
  });

  final List<String>? categories;

  @override
  State<CommunityTagsWidget> createState() => _CommunityTagsWidgetState();
}

class _CommunityTagsWidgetState extends State<CommunityTagsWidget> {
  late CommunityTagsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommunityTagsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final categories = widget.categories!.toList();

        return Wrap(
          spacing: 7.0,
          runSpacing: 3.5,
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.start,
          direction: Axis.horizontal,
          runAlignment: WrapAlignment.start,
          verticalDirection: VerticalDirection.down,
          clipBehavior: Clip.none,
          children: List.generate(categories.length, (categoriesIndex) {
            final categoriesItem = categories[categoriesIndex];
            return wrapWithModel(
              model: _model.communityTagModels.getModel(
                categoriesIndex.toString(),
                categoriesIndex,
              ),
              updateCallback: () => safeSetState(() {}),
              child: CommunityTagWidget(
                key: Key(
                  'Keymnz_${categoriesIndex.toString()}',
                ),
                tag: categoriesItem,
              ),
            );
          }),
        );
      },
    );
  }
}
