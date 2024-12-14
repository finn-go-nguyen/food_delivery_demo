import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'star.freezed.dart';
part 'star.g.dart';

@freezed
class FStar extends Equatable with _$FStar {
  const FStar._();
  const factory FStar({
    @Default(0) int one,
    @Default(0) int two,
    @Default(0) int three,
    @Default(0) int four,
    @Default(0) int five,
  }) = _FStar;

  int get total => one + two + three + four + five;

  FStar increment(int rate) {
    switch (rate) {
      case 1:
        return copyWith(one: one + 1);
      case 2:
        return copyWith(two: two + 1);
      case 3:
        return copyWith(three: three + 1);
      case 4:
        return copyWith(four: four + 1);
      case 5:
        return copyWith(five: five + 1);
      default:
        return this;
    }
  }

  double get average {
    if (total == 0) return 0.0;

    return (one + two * 2 + three * 3 + four * 4 + five * 5) / total;
  }

  factory FStar.fromJson(Map<String, Object?> json) => _$FStarFromJson(json);

  @override
  List<Object> get props => [one, two, three, four, five];
}
