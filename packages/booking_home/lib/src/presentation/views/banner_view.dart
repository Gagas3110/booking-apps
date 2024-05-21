import 'package:booking_home/src/application/banner/banner_bloc.dart';
import 'package:booking_home/src/domain/i_home_repository.dart';
import 'package:booking_home/src/injection.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/banner_widget.dart';
import 'banner_view_shimmer.dart';

class BannerView extends StatelessWidget {
  const BannerView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BannerBloc(
        repository: di<IHomeRepository>(),
      )..add(const BannerEvent.onBuild()),
      child: BlocBuilder<BannerBloc, BannerState>(
        builder: (context, state) {
          final bannerList = state.bannerList;

          if (state.isLoading) {
            return const BannerViewShimmer();
          }

          return Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: 170.0,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  enlargeCenterPage: true,
                  enlargeFactor: 0.2,
                ),
                items: bannerList.map((banner) {
                  return Builder(
                    builder: (context) {
                      return BannerWidget(
                        banner: banner,
                      );
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 24),
            ],
          );
        },
      ),
    );
  }
}
