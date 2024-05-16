import 'package:booking_profile/injection_container.dart';
import 'package:booking_profile/src/presentation/widgets/profile_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../application/profile/profile_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileBloc(getCurrentLoginUser: getIt())..add(const ProfileEvent.onBuild()),
      child: BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
        final String? name = state.currentUser?.displayName;
        final email = state.currentUser?.email ?? '-';
        final phoneNumber = state.currentUser?.phoneNumber ?? '-';
        final photoURL = state.currentUser?.photoURL ?? '';
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
                          imagePath: photoURL,
                          assetImageUrl: 'assets/image/img-default_avatar.png',
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
                        email,
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
