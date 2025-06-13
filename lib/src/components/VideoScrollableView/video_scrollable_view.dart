import 'package:flutter/material.dart';
import 'package:vualtwear_mobile_app/src/components/Video/fullscreen_player.dart';
import 'package:vualtwear_mobile_app/src/components/VideoPlayer/video_buttons.dart';
import 'package:vualtwear_mobile_app/src/domain/entities/order_content.dart';
import 'package:vualtwear_mobile_app/src/utils/app_layout.dart';

class VideoScrollableView extends StatefulWidget {
  final List<OrderContent> contentList;
  const VideoScrollableView({super.key, required this.contentList});

  @override
  State<VideoScrollableView> createState() => _VideoScrollableViewState();
}

class _VideoScrollableViewState extends State<VideoScrollableView> {
  late PageController _pageController;
  int _currentPage = 0;
  bool _isAnimating = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _handlePageChange(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void _handleScroll() {
    if (_isAnimating || _currentPage != widget.contentList.length - 1) return;

    final position = _pageController.position;
    // Detecta si el scroll sobrepasó el último video
    if (position.pixels >= position.maxScrollExtent + 50) {
      _isAnimating = true;
      Future.delayed(const Duration(milliseconds: 300), () {
        _pageController
            .animateToPage(
              0,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
            )
            .then((_) {
              _isAnimating = false;
            });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = AppLayout.getSize(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Image.asset(
          'assets/images/rumi_font.png',
          width: size.width * 0.3,
        ),
        elevation: 0,
        toolbarHeight: kToolbarHeight + 20,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              stops: [0.0, 1.0],
              colors: [Colors.black, Colors.transparent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is ScrollUpdateNotification) {
            _handleScroll();
          }
          return false;
        },
        child: PageView.builder(
          controller: _pageController,
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: widget.contentList.length,
          onPageChanged: _handlePageChange,
          
          itemBuilder: (context, index) {
            final OrderContent content = widget.contentList[index];
            return Stack(
              children: [
                SizedBox.expand(
                  child: FullscreenPlayer(
                    urlVideo: content.urlContent,
                    caption: content.contentDescription,
                    onSwipeUp: _nextPage,
                    onSwipeDown: _previousPage,
                  ),
                ),
                Positioned(
                  bottom: 40,
                  right: 20,
                  child: VideoButtons(content: content),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _nextPage() {
    if (_currentPage < widget.contentList.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      // Reiniciar al inicio
      _pageController.jumpToPage(0);
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }
}

class CustomPageScrollPhysics extends PageScrollPhysics {
  const CustomPageScrollPhysics({super.parent});

  @override
  CustomPageScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return CustomPageScrollPhysics(parent: buildParent(ancestor));
  }

  @override
  double get dragStartDistanceMotionThreshold => 0.55; // Muy sensible al gesto

  @override
  double get minFlingVelocity => 1.0; // Reacciona con un gesto muy suave
}
