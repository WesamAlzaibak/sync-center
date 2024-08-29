import 'package:equatable/equatable.dart';

import '../../../domain/entities/meeting.dart';

class ClientMeetingsState extends Equatable {
  const ClientMeetingsState();

  ClientMeetingsState copy() => const ClientMeetingsState();

  @override
  List<Object?> get props => [];
}

class ClientMeetingsInitialState extends ClientMeetingsState {
  const ClientMeetingsInitialState();

  @override
  ClientMeetingsInitialState copy() => const ClientMeetingsInitialState();

  @override
  List<Object> get props => [];
}

class ClientMeetingsErrorState extends ClientMeetingsState {
  final Exception exception;

  @override
  const ClientMeetingsErrorState({required this.exception});

  @override
  ClientMeetingsErrorState copy({
    Exception? exception,
  }) =>
      ClientMeetingsErrorState(
        exception: exception ?? this.exception,
      );

  @override
  List<Object> get props => [exception];
}

class ClientMeetingsLoadingState extends ClientMeetingsState {
  const ClientMeetingsLoadingState();

  @override
  ClientMeetingsLoadingState copy() => const ClientMeetingsLoadingState();

  @override
  List<Object> get props => [];
}

class ClientMeetingsSuccessState extends ClientMeetingsState {
  final List<Meeting> meetings;

  const ClientMeetingsSuccessState({required this.meetings});

  @override
  ClientMeetingsSuccessState copy({
    List<Meeting>? meetings,
  }) =>
      ClientMeetingsSuccessState(
        meetings: meetings ?? this.meetings,
      );

  @override
  List<Object> get props => [meetings];
}

class NoClientMeetingsState extends ClientMeetingsState {
  const NoClientMeetingsState();

  @override
  NoClientMeetingsState copy() => const NoClientMeetingsState();

  @override
  List<Object> get props => [];
}

class AcceptRejectMeetingErrorState extends ClientMeetingsState {
  final Exception exception;

  @override
  const AcceptRejectMeetingErrorState({required this.exception});

  @override
  AcceptRejectMeetingErrorState copy({
    Exception? exception,
    List<Meeting>? meetings,
  }) =>
      AcceptRejectMeetingErrorState(exception: exception ?? this.exception);

  @override
  List<Object> get props => [exception];
}

class AcceptRejectMeetingLoadingState extends ClientMeetingsState {
  const AcceptRejectMeetingLoadingState();
}

class AcceptRejectMeetingSuccessState extends ClientMeetingsState {
  const AcceptRejectMeetingSuccessState();
}
class DeleteMeetingSuccessState extends ClientMeetingsState {
  const DeleteMeetingSuccessState();
}
class CreateMeetingSuccessState extends ClientMeetingsState {
  const CreateMeetingSuccessState();
}
