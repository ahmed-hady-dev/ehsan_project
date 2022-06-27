import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../controller/home_cubit.dart';

class HomeCarousel extends StatelessWidget {
  final HomeCubit cubit;
  final Function()? onTap;
  const HomeCarousel({Key? key, required this.cubit, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CarouselSlider(
          items: cubit.slidesModel.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return InkWell(
                  onTap: onTap,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(image: AssetImage(i), fit: BoxFit.cover),
                    ),
                  ),
                );
              },
            );
          }).toList(),
          options: CarouselOptions(
            height: 200,
            viewportFraction: 0.89,
            initialPage: cubit.carouselIndex,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 4),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.linearToEaseOut,
            onPageChanged: (index, reason) {
              cubit.changeCarouselIndex(index: index);
            },
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}
