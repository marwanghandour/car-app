import 'package:car_app/core/utils/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_icons.dart';
import '../../blocs/search/search_bar_cubit.dart';


class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocBuilder<SearchBarCubit, bool>(
          builder: (context, isActive) {
            return !isActive
                ? const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "Welcome",
                        style: TextStyle(
                          fontSize: AppConstants.subtitleFontSize,
                        ),
                      ),
                       Text('Marwan Ghandour',
                       style: TextStyle(
                        fontSize: AppConstants.subtitleFontSize,
                        fontWeight: FontWeight.bold,
                       ),
                       ),
                  ],
                )
                : const SizedBox.shrink(); 
          },
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: BlocBuilder<SearchBarCubit, bool>(
              builder: (context, isActive) {
                return AnimatedSize(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                  child: isActive
                      ? _buildSearchField(context)
                      : _buildSearchIcon(context),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchIcon(BuildContext context) {
    return IconButton(
      key: const ValueKey('search_icon'),
      onPressed: () {
        context.read<SearchBarCubit>().toggleSearch();
      },
      icon: const Icon(AppIcons.search, size: 20,),
    );
  }

  Widget _buildSearchField(BuildContext context) {
    return Container(
      key: const ValueKey('search_field'),
      width: double.infinity,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: TextField(
        autofocus: true,
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: const Icon(AppIcons.search, size: 20,),
          suffixIcon: IconButton(
            onPressed: () {
              context.read<SearchBarCubit>().toggleSearch();
            },
            icon: const Icon(AppIcons.xsign),
          ),
        ),
      ),
    );
  }
}