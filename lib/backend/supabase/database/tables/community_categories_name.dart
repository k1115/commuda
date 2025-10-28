import '../database.dart';

class CommunityCategoriesNameTable
    extends SupabaseTable<CommunityCategoriesNameRow> {
  @override
  String get tableName => 'community_categories_name';

  @override
  CommunityCategoriesNameRow createRow(Map<String, dynamic> data) =>
      CommunityCategoriesNameRow(data);
}

class CommunityCategoriesNameRow extends SupabaseDataRow {
  CommunityCategoriesNameRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CommunityCategoriesNameTable();

  int? get communityId => getField<int>('community_id');
  set communityId(int? value) => setField<int>('community_id', value);

  int? get categoryId => getField<int>('category_id');
  set categoryId(int? value) => setField<int>('category_id', value);

  String? get categoryName => getField<String>('category_name');
  set categoryName(String? value) => setField<String>('category_name', value);
}
