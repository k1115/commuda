import '../database.dart';

class CommunityCategoriesTable extends SupabaseTable<CommunityCategoriesRow> {
  @override
  String get tableName => 'community_categories';

  @override
  CommunityCategoriesRow createRow(Map<String, dynamic> data) =>
      CommunityCategoriesRow(data);
}

class CommunityCategoriesRow extends SupabaseDataRow {
  CommunityCategoriesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CommunityCategoriesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int get communityId => getField<int>('community_id')!;
  set communityId(int value) => setField<int>('community_id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get categoryId => getField<int>('category_id');
  set categoryId(int? value) => setField<int>('category_id', value);
}
