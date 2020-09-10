# data model

```dart
import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

@JsonSerializable()
class Model {
  final String name;
  final int age;
  final String address;

  const Model({
    this.name,
    this.age,
    this.address,
  });

  factory Model.fromJson(Map<String, dynamic> json) => _$ModelFromJson(json);
  Map<String, dynamic> toJson() => _$ModelToJson(this);
}

final a = Model().toJson();


```

