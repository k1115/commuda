import 'package:collection/collection.dart';

enum ReactionType {
  Reaction0,
  Reaction1,
  Reaction2,
  Reaction3,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (ReactionType):
      return ReactionType.values.deserialize(value) as T?;
    default:
      return null;
  }
}
