import '/components/image_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'image_view_model.dart';
export 'image_view_model.dart';

class ImageViewWidget extends StatefulWidget {
  const ImageViewWidget({
    super.key,
    this.images,
  });

  final List<String>? images;

  @override
  State<ImageViewWidget> createState() => _ImageViewWidgetState();
}

class _ImageViewWidgetState extends State<ImageViewWidget> {
  late ImageViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ImageViewModel());

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
        final imageURL = widget.images?.toList() ?? [];

        return MasonryGridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: widget.images?.length == 1 ? 1 : 2,
          ),
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          itemCount: imageURL.length,
          shrinkWrap: true,
          itemBuilder: (context, imageURLIndex) {
            final imageURLItem = imageURL[imageURLIndex];
            return wrapWithModel(
              model: _model.imageComponentModels.getModel(
                imageURLItem,
                imageURLIndex,
              ),
              updateCallback: () => safeSetState(() {}),
              child: ImageComponentWidget(
                key: Key(
                  'Keyn7h_${imageURLItem}',
                ),
                imagePath: imageURLItem,
                width: 200,
                height: 160,
              ),
            );
          },
        );
      },
    );
  }
}
