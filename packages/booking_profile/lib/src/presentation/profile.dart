import 'package:booking_profile/injection_container.dart';
// import 'package:booking_profile/src/domain/usecases/get_popular_movies.dart';
import 'package:booking_profile/src/presentation/widgets/profile_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer';

import '../application/profile/profile_bloc.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    // final GetPopularMovies getPopularMoviesRepo;
    return BlocProvider(
      create: (_) => ProfileBloc(getCurrentLoginUser: getIt())..add(const ProfileEvent.onBuild()),
      child: BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
        final name = state.name;
        final email = state.email;
        final phoneNumber = state.phoneNumber;
        final photoURL = state.photoURL;
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
          title: 'Profile',
          home: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.green,
              title: const Center(
                child: Text('Profile'),
              ),
            ),
            body: ListView(
              children: <Widget>[
                Container(
                  height: 250,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.green, Colors.white],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      stops: [0.5, 0.9],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: <Widget>[
                        ProfileIcon(
                          phoneNumber: phoneNumber,
                          imagePath: photoURL ?? 'https://',
                        )
                      ]),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        name ?? '-',
                        style: const TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: <Widget>[
                    ListTile(
                      title: const Text(
                        'Email',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        email ?? '-',
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const Divider(),
                  ],
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
