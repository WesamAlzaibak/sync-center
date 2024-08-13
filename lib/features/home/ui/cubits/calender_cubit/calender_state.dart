import 'package:equatable/equatable.dart';
import 'package:sync_center_mobile/features/meetings/domain/entities/meeting.dart';

class CalenderState extends Equatable {
  const CalenderState();

  CalenderState copy() => const CalenderState();

  @override
  List<Object?> get props => [];
}

class CalenderInitialState extends CalenderState {
  const CalenderInitialState();

  @override
  CalenderInitialState copy() => const CalenderInitialState();

  @override
  List<Object> get props => [];
}

class CalenderErrorState extends CalenderState {
  final Exception exception;

  @override
  const CalenderErrorState({required this.exception});

  @override
  CalenderErrorState copy({Exception? exception}) => CalenderErrorState(
        exception: exception ?? this.exception,
      );

  @override
  List<Object> get props => [exception];
}

class CalenderLoadingState extends CalenderState {
  const CalenderLoadingState();

  @override
  CalenderLoadingState copy() => const CalenderLoadingState();

  @override
  List<Object> get props => [];
}

class CalenderSuccessState extends CalenderState {
  final List<Meeting> meetings;

  const CalenderSuccessState({required this.meetings});

  @override
  CalenderSuccessState copy({
    List<Meeting>? meetings,
  }) =>
      CalenderSuccessState(
        meetings: meetings ?? this.meetings,
      );

  @override
  List<Object> get props => [meetings];
}