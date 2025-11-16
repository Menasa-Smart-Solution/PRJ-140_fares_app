part of '../../../feature_imports.dart';

class CallLogsImagesListView extends StatelessWidget {
  const CallLogsImagesListView({super.key, required this.images});
  final List<CallImageModel> images;
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1,
      ),
      itemCount: images.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                contentPadding: EdgeInsets.zero,

                content: SizedBox(
                  height: 700,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: CustomCachedImage(
                      imageUrl: images[index].imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            );
          },
          child: CustomCachedImage(
            imageUrl: images[index].imagePath,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
            radius: 16,
          ),
        );
      },
    );
  }
}
