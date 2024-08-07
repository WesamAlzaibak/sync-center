import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sync_center_mobile/dummy_data.dart';
import 'package:sync_center_mobile/features/home/ui/components/home_header_component.dart';
import 'package:sync_center_mobile/features/home/ui/components/projects_list_view.dart';

import '../../../../core/ui/reusables/images/sync_network_image.dart';
import '../../../../core/ui/theme/colors.dart';
import '../../../projects/domain/entities/project.dart';
import '../cubits/home_cubit/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  static const route = "/HomeScreen";

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    // return MultiBlocListener(
    //   listeners: [
    //     BlocListener<HomeCubit, HomeState>(
    //       listenWhen: (previousState, state) {
    //         return previousState is! HomeErrorState && state is HomeErrorState;
    //       },
    //       listener: (BuildContext context, state) {
    //         if (state is HomeErrorState) {
    //           ScaffoldMessenger.of(context).showSnackBar(
    //               DefaultSnackBar(text: state.exception.toString()));
    //         }
    //       },
    //     ),
    //     BlocListener<HomeCubit, HomeState>(
    //       listenWhen: (previousState, state) {
    //         return state is CreateTripLoadingState;
    //       },
    //       listener: (context, state) {
    //         showDialog(
    //           barrierDismissible: false,
    //           context: context,
    //           builder: (context) {
    //             return const Center(
    //               child: CircularProgressIndicator(
    //                 color: MoushrefColors.blue,
    //                 strokeCap: StrokeCap.round,
    //               ),
    //             );
    //           },
    //         );
    //       },
    //     ),
    //     BlocListener<HomeCubit, HomeState>(
    //       listenWhen: (previousState, state) {
    //         return previousState is! CreateTripErrorState &&
    //             state is CreateTripErrorState;
    //       },
    //       listener: (BuildContext context, state) {
    //         if (state is CreateTripErrorState) {
    //           context.pop();
    //           ScaffoldMessenger.of(context).showSnackBar(
    //               DefaultSnackBar(text: state.exception.toString()));
    //           context.pop();
    //         }
    //       },
    //     ),
    //     BlocListener<HomeCubit, HomeState>(
    //       listenWhen: (previousState, state) {
    //         return state is CreateTripSuccessState;
    //       },
    //       listener: (BuildContext context, state) {
    //         context.pop();
    //         ScaffoldMessenger.of(context).showSnackBar(
    //           DefaultSnackBar(text: "created successfully"),
    //         );
    //         context.pop();
    //       },
    //     ),
    //   ],
    //   child: BlocBuilder<HomeCubit, HomeState>(
    //     builder: (context, state) {
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
                  const SizedBox(height: 100), // Adjust the height as needed
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 7),
                    color: Colors.grey[100],
                    child: const Center(
                      child: Text(
                        "Your Projects List",
                        style:TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: SyncColors.f3,
                            fontStyle: FontStyle.italic
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16,0,16,30),
                    child: MyProjectsListView(
                        isLoading: false,
                        onProjectClick: (project) {},
                        projects: projectList
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: HomeHeaderComponent(),
          ),
        ],
      ),
    );
    //     },
    //   ),
    // );
  }
}
