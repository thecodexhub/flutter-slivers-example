import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slivers_example/cubit/app_bar_config_cubit.dart';
import 'package:flutter_slivers_example/extensions/extensions.dart';
import 'package:flutter_slivers_example/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          BlocProvider<AppBarConfigCubit>(
            create: (context) => AppBarConfigCubit(),
            child: _CustomSliverAppBarWidget(),
          ),
          SliverPinnedHeader(
            headerColor: Colors.red[100]!,
            headerLabel: 'This is a pinned header for SliverList',
          ),
          _SliverListWidget(),
          SliverPinnedHeader(
            headerColor: Colors.red[200]!,
            headerLabel: 'This is a pinned header for SliverGrid',
          ),
          _SliverGridWidget(),
          SliverPinnedHeader(
            headerColor: Colors.red[300]!,
            headerLabel: 'This is a pinned header for SliverToBoxAdapter',
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 120.0,
              width: double.infinity,
              color: Colors.green[400],
              alignment: Alignment.center,
              child: const Text('This is a SliverToBoxAdapter')
                  .fontSize(18)
                  .color(Colors.black)
                  .italics,
            ),
          ),
          SliverPinnedHeader(
            headerColor: Colors.red[400]!,
            headerLabel: 'This is a pinned header for SliverFillRemaining',
          ),
          SliverFillRemaining(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: const Text('Made with 💙 by @thecodexhub')
                    .fontSize()
                    .italics,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SliverGridWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2.6,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final boxColor = index < 7
              ? Colors.cyan[(index + 1) * 100]
              : Colors.teal[(index - 6) * 100];
          return Container(
            height: 60,
            width: double.infinity,
            color: boxColor,
            alignment: Alignment.center,
            child: Text('This is element no. ${index + 1}')
                .fontSize(18)
                .color(Colors.black)
                .italics,
          );
        },
        childCount: 14,
      ),
    );
  }
}

class _SliverListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final boxColor = Colors.orange[(index + 1) * 100];
          return Container(
            height: 60,
            width: double.infinity,
            color: boxColor,
            alignment: Alignment.center,
            child: Text('This is element no. ${index + 1}')
                .fontSize(18)
                .color(Colors.black)
                .italics,
          );
        },
        childCount: 9,
      ),
    );
  }
}

class _CustomSliverAppBarWidget extends StatelessWidget {
  static const _bgImg =
      'https://cdn.pixabay.com/photo/2012/08/27/14/19/mountains-55067__340.png';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBarConfigCubit, AppBarConfigState>(
      builder: (context, state) {
        return SliverAppBar(
          expandedHeight: 165.0,
          centerTitle: true,
          pinned: state.isPinned,
          floating: state.isFloating,
          snap: state.isSnap,
          title: Text(
            context.findAncestorWidgetOfExactType<MaterialApp>()!.title,
          ),
          flexibleSpace: FlexibleSpaceBar(
            background: Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Opacity(
                    opacity: 0.65,
                    child: Image.network(_bgImg, fit: BoxFit.cover),
                  ),
                ),
                _AppBarConfigOptions(
                  isPinned: state.isPinned,
                  isFloating: state.isFloating,
                  isSnap: state.isSnap,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _AppBarConfigOptions extends StatelessWidget {
  const _AppBarConfigOptions({
    required this.isPinned,
    required this.isFloating,
    required this.isSnap,
  });

  final bool isPinned;
  final bool isFloating;
  final bool isSnap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _AppBarConfigOptionItem(
                label: 'Pinned',
                value: isPinned,
                onToggleTap: context.read<AppBarConfigCubit>().togglePinned,
              ),
              _AppBarConfigOptionItem(
                label: 'Floating',
                value: isFloating,
                onToggleTap: context.read<AppBarConfigCubit>().toggleFloating,
              ),
            ],
          ),
          _AppBarConfigOptionItem(
            label: 'Snap',
            value: isSnap,
            onToggleTap: context.read<AppBarConfigCubit>().toggleSnap,
          ),
        ],
      ),
    );
  }
}

class _AppBarConfigOptionItem extends StatelessWidget {
  const _AppBarConfigOptionItem({
    required this.value,
    required this.label,
    required this.onToggleTap,
  });

  final String label;
  final bool value;
  final VoidCallback onToggleTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 4.0,
        horizontal: 12.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('$label:  ').fontSize(18).bold,
          SizedBox(
            width: 45,
            child: Text(value.toString())
                .fontSize(18)
                .color(Colors.orange[200]!)
                .bold
                .italics,
          ),
          InkWell(
            onTap: onToggleTap,
            child: const Icon(Icons.autorenew, size: 18),
          ),
        ],
      ),
    );
  }
}
