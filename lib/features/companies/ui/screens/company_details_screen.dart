import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sync_center_mobile/core/ui/reusables/images/sync_network_image.dart';
import 'package:sync_center_mobile/core/utils/string.dart';

import '../../../../core/ui/reusables/buttons/default_back_button.dart';
import '../../../../core/ui/reusables/snackbars/default_snack_bar.dart';
import '../../../../core/ui/theme/colors.dart';
import '../components/company_project_list_view.dart';
import '../cubits/company_details/company_details_cubit.dart';
import '../cubits/company_details/company_details_state.dart';

class CompanyDetailsScreen extends StatelessWidget {
  CompanyDetailsScreen({super.key, required this.companyId});

  static const route = "/Company_details_screen";

  final int companyId;

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<CompanyDetailsCubit, CompanyDetailsState>(
      listenWhen: (previousState, state) {
        return previousState is! CompanyDetailsErrorState &&
            state is CompanyDetailsErrorState;
      },
      listener: (BuildContext context, state) {
        if (state is CompanyDetailsErrorState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(DefaultSnackBar(text: state.exception.toString()));
        }
      },
      child: Scaffold(
        body: RefreshIndicator(
          key: _refreshIndicatorKey,
          edgeOffset: 32,
          color: SyncColors.darkBlue,
          onRefresh: () => context
              .read<CompanyDetailsCubit>()
              .refreshCompanyDetailsData(companyId),
          child: BlocBuilder<CompanyDetailsCubit, CompanyDetailsState>(
            builder: (context, state) {
              if (state is CompanyDetailsSuccessState) {
                return SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 56, 16, 24),
                    child: Stack(
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.only(top: 16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: CircleAvatar(
                                    radius: 52,
                                    backgroundColor: SyncColors.darkBlue,
                                    child: CircleAvatar(
                                      radius: 50,
                                      child: state.company.logo.isEmpty
                                          ? Center(
                                              child: Text(
                                                state.company.name[0]
                                                    .toUpperCase(),
                                                style: const TextStyle(
                                                  fontSize: 28,
                                                  fontWeight: FontWeight.w700,
                                                  color: SyncColors.darkBlue,
                                                ),
                                              ),
                                            )
                                          : ClipOval(
                                              child: SyncNetworkImage(
                                                imageUrl:
                                                    state.company.logo.isEmpty
                                                        ? ""
                                                        : state.company.logo,
                                                width: 100.0,
                                                height: 100.0,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Center(
                                  child: Text(
                                    state.company.name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 26,
                                      color: SyncColors.black,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  state.company.description,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: SyncColors.black,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: Colors.white,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Column(
                                            children: [
                                              const Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .start, // Add this line
                                                children: [
                                                  Icon(
                                                    Icons.people_alt_outlined,
                                                    size: 25,
                                                    color: SyncColors.darkBlue,
                                                  ),
                                                  SizedBox(width: 8),
                                                  Expanded(
                                                    child: Text(
                                                      "Employees",
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: SyncColors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 8),
                                              Center(
                                                child: Text(
                                                  "${state.company.employeesNumber}",
                                                  style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w700,
                                                    color: SyncColors.darkBlue,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: Colors.white,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Column(
                                            children: [
                                              const Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .start, // Add this line
                                                children: [
                                                  Icon(
                                                    Icons.folder_copy_outlined,
                                                    size: 25,
                                                    color: SyncColors.darkBlue,
                                                  ),
                                                  SizedBox(width: 8),
                                                  Expanded(
                                                    child: Text(
                                                      "projects",
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: SyncColors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 8),
                                              Center(
                                                child: Text(
                                                  "${state.company.projectsNumber}",
                                                  style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w700,
                                                    color: SyncColors.darkBlue,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.0),
                                  child: Divider(
                                    thickness: 1,
                                    color: Colors.grey,
                                  ),
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.email_outlined,
                                      size: 25,
                                      color: SyncColors.darkBlue,
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      state.company.email,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: SyncColors.darkBlue,
                                      ),
                                    )
                                  ],
                                ),
                                const Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.0),
                                  child: Divider(
                                    thickness: 1,
                                    color: Colors.grey,
                                  ),
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.phone,
                                      size: 25,
                                      color: SyncColors.darkBlue,
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      state.company.phoneNumber.phoneFormat(),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: SyncColors.darkBlue,
                                      ),
                                    )
                                  ],
                                ),
                                const Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.0),
                                  child: Divider(
                                    thickness: 1,
                                    color: Colors.grey,
                                  ),
                                ),
                                CompanyProjectsListView(
                                  isLoading: false,
                                  projects: state.projects,
                                ),
                              ],
                            ),
                          ),
                        ),
                        DefaultBackButton(
                          onPressed: () {
                            context.pop();
                          },
                          iconColor: SyncColors.darkBlue,
                        ),
                      ],
                    ),
                  ),
                );
              } else if (state is CompanyDetailsLoadingState) {
                return Stack(
                  children: [
                    const Center(
                      child: CircularProgressIndicator(
                        color: SyncColors.darkBlue,
                        strokeCap: StrokeCap.round,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 56),
                      child: DefaultBackButton(
                        onPressed: () {
                          context.pop();
                        },
                      ),
                    ),
                  ],
                );
              } else {
                return const Placeholder();
              }
            },
          ),
        ),
        backgroundColor: Colors.grey[100],
      ),
    );
  }
}
