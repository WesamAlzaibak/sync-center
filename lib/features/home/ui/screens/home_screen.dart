import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sync_center_mobile/features/firebase/ui/screens/notifications_screen.dart';
import 'package:sync_center_mobile/features/home/ui/components/home_header_component.dart';
import 'package:sync_center_mobile/features/home/ui/components/projects_list_view.dart';
import 'package:sync_center_mobile/features/projects/ui/screens/project_details_screen.dart';

import '../../../../core/ui/reusables/snackbars/default_snack_bar.dart';
import '../../../../core/ui/theme/colors.dart';
import '../cubits/home_cubit/home_cubit.dart';
import '../cubits/home_cubit/home_state.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  static const route = "/HomeScreen";

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listenWhen: (previousState, state) {
        return previousState is! HomeErrorState && state is HomeErrorState;
      },
      listener: (BuildContext context, state) {
        if (state is HomeErrorState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(DefaultSnackBar(text: state.exception.toString()));
        }
      },
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.grey[100],
            body: Stack(
              children: [
                RefreshIndicator(
                  edgeOffset: 32,
                  key: _refreshIndicatorKey,
                  onRefresh: context.read<HomeCubit>().refreshHomeData,
                  color: SyncColors.background,
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        const SizedBox(height: 100),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 7),
                          color: Colors.grey[100],
                          child: const Center(
                            child: Text(
                              "Your Projects List",
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  color: SyncColors.f3,
                                  fontStyle: FontStyle.italic),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 30),
                          child: MyProjectsListView(
                            isLoading: state is HomeLoadingState,
                            onProjectClick: (state is HomeSuccessState)
                                ? (index) => context.push(
                                        ProjectDetailsScreen.route,
                                        extra: {
                                          "projectId": state.projects[index].id
                                        })
                                : (index) {},
                            projects: (state is HomeSuccessState)
                                ? state.projects
                                : [],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: HomeHeaderComponent(
                    userName: state.username, icon: Icons.notification_add_rounded,onIconPressed: ()=>context.push(NotificationsScreen.route)
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
