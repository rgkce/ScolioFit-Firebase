import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/exercise_service.dart';
import '../core/constants/app_strings.dart';
import 'tabs/daily_routine_tab.dart';
import 'tabs/exercise_list_tab.dart';
import 'tabs/favorites_tab.dart';
import 'tabs/profile_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _tabs = [
    const DailyRoutineTab(),
    const ExerciseListTab(),
    const FavoritesTab(),
    const ProfileTab(),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ExerciseService>().fetchDailyRoutine();
      context.read<ExerciseService>().fetchExercises();
      context.read<ExerciseService>().fetchFavorites();
    });
  }

  String _getTitle() {
    switch (_selectedIndex) {
      case 0:
        return AppStrings.get(context, 'daily_routine');
      case 1:
        return AppStrings.get(context, 'exercise_library');
      case 2:
        return AppStrings.get(context, 'my_favorites');
      case 3:
        return AppStrings.get(context, 'profile');
      default:
        return AppStrings.get(context, 'app_name');
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(_getTitle()),
          automaticallyImplyLeading: false,
          actions: [
            if (_selectedIndex == 0)
              IconButton(
                icon: const Icon(Icons.notifications_none),
                onPressed: () {},
              ),
          ],
        ),
        body: IndexedStack(index: _selectedIndex, children: _tabs),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, -5),
              ),
            ],
          ),
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: (index) => setState(() => _selectedIndex = index),
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Theme.of(context).primaryColor,
            unselectedItemColor: Colors.grey,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.today_outlined),
                activeIcon: const Icon(Icons.today),
                label: AppStrings.get(context, 'daily'),
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.fitness_center_outlined),
                activeIcon: const Icon(Icons.fitness_center),
                label: AppStrings.get(context, 'exercises'),
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.favorite_outline),
                activeIcon: const Icon(Icons.favorite),
                label: AppStrings.get(context, 'favorites'),
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.person_outline),
                activeIcon: const Icon(Icons.person),
                label: AppStrings.get(context, 'profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
