import 'package:flutter/material.dart';
import '../components/components.dart';
import '../components/friend_post_list_view.dart';
import '../models/models.dart';
import '../api/mock_fooderlich_service.dart';

class ExploreScreen extends StatelessWidget {
  ExploreScreen({super.key});

  final mockService = MockFooderlichService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ExploreData>(
        future: mockService.getExploreData(),
        builder: (context, snapshot) {
          // builder로 child 위젯 생성 가능
          print(snapshot.connectionState);
          print(snapshot.hasData);
          // snapshot.connectionState == ConnectionState.done -> 데이터가 도착했는지 확인
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              // ?? [] -> null 일 경우 빈 리스트
              final todayRecipes = snapshot.data?.todayRecipes ?? [];
              final friendPost = snapshot.data?.friendPosts ?? [];
              return ListView(
                children: [
                  TodayRecipeListView(
                    recipes: todayRecipes,
                  ),
                  SizedBox(height: 32,),
                  FriendPostListView(posts: friendPost),
                ],
              );
            }
            return Text('Please add some data!');
          } else {
            // CircularProgressIndicator -> 로딩 위젯
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
