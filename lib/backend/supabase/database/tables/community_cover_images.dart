import '../database.dart';

class CommunityCoverImagesTable extends SupabaseTable<CommunityCoverImagesRow> {
  @override
  String get tableName => 'community_cover_images';

  @override
  CommunityCoverImagesRow createRow(Map<String, dynamic> data) =>
      CommunityCoverImagesRow(data);
}

class CommunityCoverImagesRow extends SupabaseDataRow {
  CommunityCoverImagesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CommunityCoverImagesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int get communityId => getField<int>('community_id')!;
  set communityId(int value) => setField<int>('community_id', value);

  String get imageUrl => getField<String>('image_url')!;
  set imageUrl(String value) => setField<String>('image_url', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime get updatedAt => getField<DateTime>('updated_at')!;
  set updatedAt(DateTime value) => setField<DateTime>('updated_at', value);

  String? get smallImageUrl => getField<String>('small_image_url');
  set smallImageUrl(String? value) =>
      setField<String>('small_image_url', value);
}
