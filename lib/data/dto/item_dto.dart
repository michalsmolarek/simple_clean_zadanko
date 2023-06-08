import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zadanko/domain/entities/item.dart';
import 'package:linkify/linkify.dart';
part 'item_dto.freezed.dart';
part 'item_dto.g.dart';

@freezed
class ItemDto with _$ItemDto {
  const factory ItemDto({
    String? description,
    @JsonKey(name: 'image_url') String? imageUrl,
    DateTime? modificationDate,
    int? orderId,
    String? title,
  }) = _ItemDto;

  factory ItemDto.fromJson(Map<String, dynamic> json) => _$ItemDtoFromJson(json);
}

extension ItemDtoExt on ItemDto {
  Item toEntity() => Item(
        description: linkify(
          description!,
        ).first.text,
        imageUrl: imageUrl,
        modificationDate: modificationDate,
        orderId: orderId,
        title: title,
        url: "https://${linkify(description!, options: const LinkifyOptions(
              looseUrl: true,
              defaultToHttps: false,
              removeWww: true,
            ))[1].text}",
      );
}
