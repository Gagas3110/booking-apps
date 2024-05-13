import 'package:booking_home/src/presentation/widgets/profile_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/profile/profile_bloc.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileBloc()..add(const ProfileEvent.onBuild()),
      child: BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
        final name = state.name;
        final isLoading = state.isLoading;
        if (isLoading) {
          return const Padding(
            padding: EdgeInsets.all(12.0),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        return MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              title: const Text('Profile'),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    //todo
                  },
                ),
              ],
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const ProfileIcon(
                    imagePath: 'assets/image/profile/img-default_avatar.png',
                    size: 32.0,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Name : $name',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
        );
      }),
    );
  }
}
