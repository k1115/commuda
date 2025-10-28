import '../database.dart';

class MessagesTable extends SupabaseTable<MessagesRow> {
  @override
  String get tableName => 'messages';

  @override
  MessagesRow createRow(Map<String, dynamic> data) => MessagesRow(data);
}

class MessagesRow extends SupabaseDataRow {
  MessagesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MessagesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get message => getField<String>('message')!;
  set message(String value) => setField<String>('message', value);

  bool get isImage => getField<bool>('is_image')!;
  set isImage(bool value) => setField<bool>('is_image', value);

  int get userId => getField<int>('user_id')!;
  set userId(int value) => setField<int>('user_id', value);

  int get targetId => getField<int>('target_id')!;
  set targetId(int value) => setField<int>('target_id', value);

  bool? get isRead => getField<bool>('is_read');
  set isRead(bool? value) => setField<bool>('is_read', value);

  int get chatroomId => getField<int>('chatroom_id')!;
  set chatroomId(int value) => setField<int>('chatroom_id', value);
}
