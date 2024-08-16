import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sync_center_mobile/features/home/ui/cubits/calender_cubit/calender_cubit.dart';
import 'package:sync_center_mobile/features/home/ui/cubits/profile_cubit/profile_cubit.dart';
import 'package:sync_center_mobile/features/home/ui/screens/calender_screen.dart';
import 'package:sync_center_mobile/features/home/ui/screens/profile_screen.dart';

import '../../../../core/ui/theme/colors.dart';
import '../../../../core/utils/animation.dart';
import '../../../../di/di.dart';
import '../cubits/home_cubit/home_cubit.dart';
import '../cubits/host_cubit/host_cubit.dart';
import '../cubits/host_cubit/host_state.dart';
import 'home_screen.dart';

class HostScreen extends StatelessWidget {
  const HostScreen({super.key});

  static const route = "/home_host_screen";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HostCubit, HostState>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.index,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            elevation: 8,
            enableFeedback: true,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            unselectedItemColor: SyncColors.black,
            selectedItemColor: SyncColors.lightBlue,
            selectedFontSize: 14,
            unselectedFontSize: 12,
            items: [
              _bottomNavigationBarItem(
                icon: Icons.business_center_outlined,
                label: "MyProject",
              ),
              _bottomNavigationBarItem(
                icon: Icons.calendar_month,
                label: "Calender",
              ),
              _bottomNavigationBarItem(
                icon: Icons.person_sharp,
                label: "Profile",
              ),
            ],
            onTap: (index) {
              context.read<HostCubit>().toggleIndex(index);
            },
          ),
          body: FadeIndexedStack(
            duration: const Duration(milliseconds: 250),
            index: state.index,
            children: [
              BlocProvider<HomeCubit>(
                create: (BuildContext context) {
                  final homeCubit = getIt.get<HomeCubit>()
                    ..init()
                    ..fetchHomeData();
                  return homeCubit;
                },
                child: HomeScreen(),
              ),
              BlocProvider<CalenderCubit>(
                create: (BuildContext context) {
                  final calenderCubit = getIt.get<CalenderCubit>()
                    ..fetchCalenderData();
                  return calenderCubit;
                },
                child: CalenderScreen(),
              ),
              BlocProvider<ProfileCubit>(
                create: (BuildContext context) {
                  final profileCubit = getIt.get<ProfileCubit>()
                    ..fetchProfile();
                  return profileCubit;
                },
                child:  ProfileScreen(),
              ),
            ],
          ),
        );
      },
    );
  }
}

BottomNavigationBarItem _bottomNavigationBarItem(
    {required IconData icon, required String label}) =>
    BottomNavigationBarItem(
      icon: Icon(
        icon,
        size: 25,
      ),
      label: label,
      activeIcon: Icon(
        icon,
        size: 25,
        color: SyncColors.lightBlue,
      ),
    );
