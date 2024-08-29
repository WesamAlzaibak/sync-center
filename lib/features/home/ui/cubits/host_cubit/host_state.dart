import 'package:equatable/equatable.dart';

class HostState extends Equatable {
  final int index;

  const HostState(this.index);

  HostState copy({int? index}) =>
      HostState(index ?? this.index);

  @override
  List<Object?> get props => [index];
}
