import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:sync_center_mobile/features/meetings/ui/components/create_meeting_bottom_sheet.dart';

import '../../../../core/ui/reusables/buttons/default_back_button.dart';
import '../../../../core/ui/reusables/snackbars/default_snack_bar.dart';
import '../../../../core/ui/theme/colors.dart';
import '../components/client_meetings_list_view.dart';
import '../cubits/meetings_cubit/meetings_cubit.dart';
import '../cubits/meetings_cubit/meetings_state.dart';

class ClientMeetingsScreen extends StatelessWidget {
  ClientMeetingsScreen({super.key});

  static const route = "/ClientMeetingsScreen";

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ClientMeetingsCubit, ClientMeetingsState>(
          listenWhen: (previousState, state) {
            return previousState is! ClientMeetingsErrorState &&
                state is ClientMeetingsErrorState;
          },
          listener: (BuildContext context, state) {
            if (state is ClientMeetingsErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                  DefaultSnackBar(text: state.exception.toString()));
            }
          },
        ),
        BlocListener<ClientMeetingsCubit, ClientMeetingsState>(
          listenWhen: (previousState, state) {
            return previousState is! AcceptRejectMeetingLoadingState &&
                state is AcceptRejectMeetingLoadingState;
          },
          listener: (context, state) {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: SyncColors.darkBlue,
                    strokeCap: StrokeCap.round,
                  ),
                );
              },
            );
          },
        ),
        BlocListener<ClientMeetingsCubit, ClientMeetingsState>(
          listenWhen: (previousState, state) {
            return state is AcceptRejectMeetingSuccessState;
          },
          listener: (BuildContext context, state) {
            ScaffoldMessenger.of(context).showSnackBar(
              DefaultSnackBar(
                text: "Meeting Status Changed Successfully",
              ),
            );
            context.pop();
            context.pop();
            _refreshIndicatorKey.currentState!.show();
          },
        ),
        BlocListener<ClientMeetingsCubit, ClientMeetingsState>(
          listenWhen: (previousState, state) {
            return state is DeleteMeetingSuccessState;
          },
          listener: (BuildContext context, state) {
            ScaffoldMessenger.of(context).showSnackBar(
              DefaultSnackBar(
                text: "Meeting Deleted Successfully",
              ),
            );
            context.pop();
            context.pop();
            _refreshIndicatorKey.currentState!.show();
          },
        ),
        BlocListener<ClientMeetingsCubit, ClientMeetingsState>(
          listenWhen: (previousState, state) {
            return state is CreateMeetingSuccessState;
          },
          listener: (BuildContext context, state) {
            ScaffoldMessenger.of(context).showSnackBar(
              DefaultSnackBar(
                text: "Meeting Created Successfully",
              ),
            );
            context.pop();
            context.pop();
            _refreshIndicatorKey.currentState!.show();
          },
        ),
      ],
      child: BlocBuilder<ClientMeetingsCubit, ClientMeetingsState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              forceMaterialTransparency: true,
              elevation: 0,
              toolbarHeight: 80,
              leadingWidth: 80,
              centerTitle: true,
              leading: Row(
                children: [
                  const SizedBox(width: 16),
                  DefaultBackButton(
                    onPressed: () {
                      context.pop();
                    },
                  ),
                ],
              ),
              title: const Text(
                "Your Meetings",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: SyncColors.black,
                ),
              ),
            ),
            body: RefreshIndicator(
              key: _refreshIndicatorKey,
              edgeOffset: 32,
              color: SyncColors.darkBlue,
              onRefresh: () => context
                  .read<ClientMeetingsCubit>()
                  .refreshClientMeetingsData(),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                  child: Column(
                    children: [
                      Skeletonizer(
                        enabled: state is ClientMeetingsLoadingState,
                        child: const Text(
                          "This screen shows all your upcoming and past meetings. Tap any meeting to view its details and manage your schedule.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: SyncColors.black,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ClientMeetingsListViewComponent(
                        meetings: state is ClientMeetingsSuccessState
                            ? state.meetings
                            : [],
                        isLoading: state is ClientMeetingsLoadingState,
                        onMeetingAcceptClick: (id) => _showAlertDialog(
                          context: context,
                          onConfirm: () => context
                              .read<ClientMeetingsCubit>()
                              .acceptRejectMeeting(meetingId: id, status: 1),
                          isAccept: true,
                          isDelete: true,
                        ),
                        onMeetingRejectClick: (id) {
                          _showAlertDialog(
                            context: context,
                            onConfirm: () => context
                                .read<ClientMeetingsCubit>()
                                .acceptRejectMeeting(meetingId: id, status: 2),
                            isAccept: false,
                            isDelete: false,
                          );
                        },
                        onMeetingDeleteClick: (id) {
                          _showAlertDialog(
                            context: context,
                            onConfirm: () => context
                                .read<ClientMeetingsCubit>()
                                .deleteMeeting(meetingId: id),
                            isAccept: false,
                            isDelete: true,
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => showModalBottomSheet(
                context: context,
                backgroundColor: Colors.grey[100],
                isScrollControlled: true,
                builder: (localContext) {
                  return BlocProvider.value(
                    value: context.read<ClientMeetingsCubit>(),
                    child: CreateMeetingBottomSheetComponent(
                      onMeetingCreate: (title, date) => localContext
                          .read<ClientMeetingsCubit>()
                          .createMeeting(title: title, date: date),
                    ),
                  );
                },
              ),
              child: Skeletonizer(
                enabled: state is ClientMeetingsLoadingState,
                child: const Icon(
                  Icons.add,
                  color: SyncColors.darkBlue,
                  size: 30,
                ),
              ),
            ),
            backgroundColor: Colors.grey[100],
          );
        },
      ),
    );
  }

  void _showAlertDialog({
    required BuildContext context,
    required void Function() onConfirm,
    required bool isAccept,
    required bool isDelete,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext localContext) {
        return AlertDialog(
          title: Text(isDelete
              ? "Cancel Warning"
              : isAccept
                  ? "Accept Warning"
                  : "Reject Warning"),
          content: Text(isDelete
              ? "Are You sure you want to cancel this meeting ?"
              : isAccept
                  ? "Are You sure you want to accept this meeting request ?"
                  : "Are You sure you want to reject this meeting request ?"),
          actions: [
            TextButton(
              onPressed: () => localContext.pop(),
              child: const Text(
                "Undo",
                style: TextStyle(color: SyncColors.black),
              ),
            ),
            TextButton(
              onPressed: onConfirm,
              child: Text(
                isDelete
                    ? "Delete"
                    : isAccept
                        ? "Accept"
                        : "Reject",
                style: TextStyle(
                    color: isAccept ? SyncColors.green : SyncColors.red),
              ),
            ),
          ],
          backgroundColor: Colors.white,
          elevation: 0,
        );
      },
    );
  }
}
