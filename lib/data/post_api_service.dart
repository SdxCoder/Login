import 'package:chopper/chopper.dart';

part 'post_api_service.chopper.dart';

// Base url for get,post,put,delete http reuests
@ChopperApi(baseUrl: '/posts')
abstract class PostApiService extends ChopperService {
  static PostApiService create() {
    final client = ChopperClient(
        baseUrl: "https://jsonplaceholder.typicode.com",
        services: [_$PostApiService()],
        converter: JsonConverter());

        return _$PostApiService(client);
  }

  // Get request can pass headers and path
  @Get(path: "/")
  Future<Response> getPosts();

  @Get(path: '/{id}')
  Future<Response> getSinglePost(@Path('id') int id);

  @Get(path: '/{id}/{param[email]}')
  Future<Response> getSinglePostWithQuery(
      @Path('id') int id, @Query("param[email]") String email);

  @Post()
  Future<Response> postPost(
    @Body() Map<String, dynamic> body,
  );

  @Put(path: '/{id}')
  Future<Response> updatePost(
    @Path('id') int id,
    @Body() Map<String, dynamic> body,
  );

  @Delete(path: "/{id}")
  Future<Response> deletePost(
    @Path('id') int id,
  );

  // Headers
}
