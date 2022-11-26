import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/empty_matches2_widget.dart';
import '../components/empty_matches_widget.dart';
import '../components/empty_v_history_widget.dart';
import '../create_event_page/create_event_page_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: AppBar(
        backgroundColor: Color(0xFFCDCDCD),
        automaticallyImplyLeading: false,
        title: Text(
          'Homepage',
          style: FlutterFlowTheme.of(context).title2,
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: Stack(
        children: [
          if (valueOrDefault<bool>(currentUserDocument?.isDisabled, false) ==
              false)
            AuthUserStreamWidget(
              child: Stack(
                children: [
                  DefaultTabController(
                    length: 2,
                    initialIndex: 0,
                    child: Column(
                      children: [
                        TabBar(
                          labelColor: FlutterFlowTheme.of(context).primaryColor,
                          labelStyle: FlutterFlowTheme.of(context).bodyText1,
                          indicatorColor:
                              FlutterFlowTheme.of(context).secondaryColor,
                          tabs: [
                            Tab(
                              text: 'Help Board',
                              icon: Icon(
                                Icons.emoji_people,
                              ),
                            ),
                            Tab(
                              text: 'My History',
                              icon: Icon(
                                Icons.history,
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [
                              StreamBuilder<List<PostsRecord>>(
                                stream: queryPostsRecord(
                                  queryBuilder: (postsRecord) =>
                                      postsRecord.whereNotIn(
                                          'post_id',
                                          functions.combineLists(
                                              (currentUserDocument?.matches
                                                          ?.toList() ??
                                                      [])
                                                  .toList(),
                                              (currentUserDocument?.rejected
                                                          ?.toList() ??
                                                      [])
                                                  .toList())),
                                  singleRecord: true,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: CircularProgressIndicator(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                        ),
                                      ),
                                    );
                                  }
                                  List<PostsRecord> stackPostsRecordList =
                                      snapshot.data!;
                                  final stackPostsRecord =
                                      stackPostsRecordList.isNotEmpty
                                          ? stackPostsRecordList.first
                                          : null;
                                  return Stack(
                                    children: [
                                      StreamBuilder<List<PostsRecord>>(
                                        stream: queryPostsRecord(
                                          queryBuilder: (postsRecord) => postsRecord
                                              .whereNotIn(
                                                  'post_id',
                                                  functions.combineLists(
                                                      (currentUserDocument
                                                                  ?.matches
                                                                  ?.toList() ??
                                                              [])
                                                          .toList(),
                                                      (currentUserDocument
                                                                  ?.rejected
                                                                  ?.toList() ??
                                                              [])
                                                          .toList()))
                                              .where('status',
                                                  isEqualTo: false),
                                          singleRecord: true,
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50,
                                                height: 50,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                ),
                                              ),
                                            );
                                          }
                                          List<PostsRecord>
                                              stackPostsRecordList =
                                              snapshot.data!;
                                          final stackPostsRecord =
                                              stackPostsRecordList.isNotEmpty
                                                  ? stackPostsRecordList.first
                                                  : null;
                                          return Stack(
                                            children: [
                                              StreamBuilder<List<PostsRecord>>(
                                                stream: queryPostsRecord(
                                                  queryBuilder: (postsRecord) => postsRecord
                                                      .whereNotIn(
                                                          'post_id',
                                                          functions.combineLists(
                                                              (currentUserDocument
                                                                          ?.matches
                                                                          ?.toList() ??
                                                                      [])
                                                                  .toList(),
                                                              (currentUserDocument
                                                                          ?.rejected
                                                                          ?.toList() ??
                                                                      [])
                                                                  .toList()))
                                                      .where('status',
                                                          isEqualTo: false),
                                                  singleRecord: true,
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50,
                                                        height: 50,
                                                        child:
                                                            CircularProgressIndicator(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryColor,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<PostsRecord>
                                                      stackPostsRecordList =
                                                      snapshot.data!;
                                                  // Return an empty Container when the document does not exist.
                                                  if (snapshot.data!.isEmpty) {
                                                    return Container();
                                                  }
                                                  final stackPostsRecord =
                                                      stackPostsRecordList
                                                              .isNotEmpty
                                                          ? stackPostsRecordList
                                                              .first
                                                          : null;
                                                  return Stack(
                                                    children: [
                                                      StreamBuilder<
                                                          List<UsersRecord>>(
                                                        stream:
                                                            queryUsersRecord(
                                                          queryBuilder: (usersRecord) =>
                                                              usersRecord.where(
                                                                  'post_id',
                                                                  arrayContains:
                                                                      stackPostsRecord!
                                                                          .postId),
                                                          singleRecord: true,
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50,
                                                                height: 50,
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          List<UsersRecord>
                                                              stackUsersRecordList =
                                                              snapshot.data!;
                                                          final stackUsersRecord =
                                                              stackUsersRecordList
                                                                      .isNotEmpty
                                                                  ? stackUsersRecordList
                                                                      .first
                                                                  : null;
                                                          return Stack(
                                                            children: [
                                                              if (stackPostsRecord !=
                                                                  null)
                                                                SingleChildScrollView(
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: [
                                                                          Image
                                                                              .network(
                                                                            stackUsersRecord!.photoUrl!,
                                                                            width:
                                                                                MediaQuery.of(context).size.width,
                                                                            height:
                                                                                230,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            20,
                                                                            12,
                                                                            20,
                                                                            0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Text(
                                                                                stackPostsRecord!.postTitle!,
                                                                                style: FlutterFlowTheme.of(context).title2,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            20,
                                                                            4,
                                                                            20,
                                                                            0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceEvenly,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Text(
                                                                                stackUsersRecord!.displayName!,
                                                                                textAlign: TextAlign.start,
                                                                                style: FlutterFlowTheme.of(context).subtitle1.override(
                                                                                      fontFamily: 'Lexend Deca',
                                                                                      color: FlutterFlowTheme.of(context).primaryColor,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            20,
                                                                            4,
                                                                            20,
                                                                            0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceEvenly,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Text(
                                                                                stackPostsRecord!.location!,
                                                                                textAlign: TextAlign.start,
                                                                                style: FlutterFlowTheme.of(context).subtitle1.override(
                                                                                      fontFamily: 'Lexend Deca',
                                                                                      color: FlutterFlowTheme.of(context).primaryColor,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Text(
                                                                                dateTimeFormat('jm', stackPostsRecord!.startTime!),
                                                                                textAlign: TextAlign.start,
                                                                                style: FlutterFlowTheme.of(context).subtitle1.override(
                                                                                      fontFamily: 'Lexend Deca',
                                                                                      color: FlutterFlowTheme.of(context).primaryColor,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            20,
                                                                            4,
                                                                            20,
                                                                            0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceEvenly,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Text(
                                                                                dateTimeFormat('d/M/y', stackPostsRecord!.startTime!),
                                                                                textAlign: TextAlign.start,
                                                                                style: FlutterFlowTheme.of(context).subtitle1.override(
                                                                                      fontFamily: 'Lexend Deca',
                                                                                      color: FlutterFlowTheme.of(context).primaryColor,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            20,
                                                                            12,
                                                                            20,
                                                                            0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Text(
                                                                                stackPostsRecord!.postDescription!,
                                                                                style: FlutterFlowTheme.of(context).bodyText2,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceEvenly,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                20,
                                                                                0,
                                                                                24),
                                                                            child:
                                                                                FFButtonWidget(
                                                                              onPressed: () async {
                                                                                final usersUpdateData = {
                                                                                  'rejected': FieldValue.arrayUnion([
                                                                                    stackPostsRecord!.postId
                                                                                  ]),
                                                                                };
                                                                                await currentUserReference!.update(usersUpdateData);
                                                                                await Navigator.push(
                                                                                  context,
                                                                                  PageTransition(
                                                                                    type: PageTransitionType.fade,
                                                                                    duration: Duration(milliseconds: 0),
                                                                                    reverseDuration: Duration(milliseconds: 0),
                                                                                    child: NavBarPage(initialPage: 'homePage'),
                                                                                  ),
                                                                                );
                                                                              },
                                                                              text: 'Decline',
                                                                              options: FFButtonOptions(
                                                                                width: 100,
                                                                                height: 60,
                                                                                color: Color(0xBDEF3939),
                                                                                textStyle: FlutterFlowTheme.of(context).title3.override(
                                                                                      fontFamily: 'Lexend Deca',
                                                                                      color: Colors.white,
                                                                                    ),
                                                                                elevation: 3,
                                                                                borderSide: BorderSide(
                                                                                  color: Colors.transparent,
                                                                                  width: 1,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                20,
                                                                                0,
                                                                                24),
                                                                            child:
                                                                                FFButtonWidget(
                                                                              onPressed: () async {
                                                                                final postsUpdateData = createPostsRecordData(
                                                                                  status: true,
                                                                                );
                                                                                await stackPostsRecord!.reference.update(postsUpdateData);
                                                                                await Future.delayed(const Duration(milliseconds: 1000));

                                                                                final usersUpdateData = {
                                                                                  'matches': FieldValue.arrayUnion([
                                                                                    stackPostsRecord!.postId
                                                                                  ]),
                                                                                };
                                                                                await currentUserReference!.update(usersUpdateData);
                                                                                if ((currentUserDocument?.matches?.toList() ?? []).contains(stackPostsRecord!.postId)) {
                                                                                  final chatsCreateData = {
                                                                                    ...createChatsRecordData(
                                                                                      userA: stackUsersRecord!.reference,
                                                                                      userB: currentUserReference,
                                                                                      lastMessage: stackPostsRecord!.postTitle,
                                                                                      lastMessageTime: getCurrentTimestamp,
                                                                                    ),
                                                                                    'users': functions.createChatUserList(stackUsersRecord!.reference, currentUserReference!),
                                                                                  };
                                                                                  await ChatsRecord.collection.doc().set(chatsCreateData);
                                                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                                                    SnackBar(
                                                                                      content: Text(
                                                                                        'Thank you for your support ^_^',
                                                                                        style: TextStyle(
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        ),
                                                                                      ),
                                                                                      duration: Duration(milliseconds: 4000),
                                                                                      backgroundColor: FlutterFlowTheme.of(context).secondaryColor,
                                                                                    ),
                                                                                  );
                                                                                  await Future.delayed(const Duration(milliseconds: 1000));
                                                                                }
                                                                                await Navigator.push(
                                                                                  context,
                                                                                  PageTransition(
                                                                                    type: PageTransitionType.fade,
                                                                                    duration: Duration(milliseconds: 0),
                                                                                    reverseDuration: Duration(milliseconds: 0),
                                                                                    child: NavBarPage(initialPage: 'homePage'),
                                                                                  ),
                                                                                );
                                                                              },
                                                                              text: 'Accept',
                                                                              options: FFButtonOptions(
                                                                                width: 100,
                                                                                height: 60,
                                                                                color: Color(0xAB5AEF39),
                                                                                textStyle: FlutterFlowTheme.of(context).title3.override(
                                                                                      fontFamily: 'Lexend Deca',
                                                                                      color: Colors.white,
                                                                                    ),
                                                                                elevation: 3,
                                                                                borderSide: BorderSide(
                                                                                  color: Colors.transparent,
                                                                                  width: 1,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                            ],
                                                          );
                                                        },
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ),
                                              if (!(stackPostsRecord != null))
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child:
                                                          EmptyMatchesWidget(),
                                                    ),
                                                  ],
                                                ),
                                            ],
                                          );
                                        },
                                      ),
                                    ],
                                  );
                                },
                              ),
                              StreamBuilder<List<PostsRecord>>(
                                stream: queryPostsRecord(
                                  singleRecord: true,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: CircularProgressIndicator(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                        ),
                                      ),
                                    );
                                  }
                                  List<PostsRecord> stackPostsRecordList =
                                      snapshot.data!;
                                  final stackPostsRecord =
                                      stackPostsRecordList.isNotEmpty
                                          ? stackPostsRecordList.first
                                          : null;
                                  return Stack(
                                    children: [
                                      StreamBuilder<List<UsersRecord>>(
                                        stream: queryUsersRecord(
                                          queryBuilder: (usersRecord) =>
                                              usersRecord.where('matches',
                                                  arrayContains:
                                                      stackPostsRecord!.postId),
                                          singleRecord: true,
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50,
                                                height: 50,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                ),
                                              ),
                                            );
                                          }
                                          List<UsersRecord>
                                              stackUsersRecordList =
                                              snapshot.data!;
                                          final stackUsersRecord =
                                              stackUsersRecordList.isNotEmpty
                                                  ? stackUsersRecordList.first
                                                  : null;
                                          return Stack(
                                            children: [
                                              if (!(stackUsersRecord != null))
                                                EmptyVHistoryWidget(),
                                              if (stackUsersRecord != null)
                                                FutureBuilder<
                                                    List<PostsRecord>>(
                                                  future: queryPostsRecordOnce(
                                                    queryBuilder: (postsRecord) =>
                                                        postsRecord.whereIn(
                                                            'post_id',
                                                            (currentUserDocument
                                                                    ?.matches
                                                                    ?.toList() ??
                                                                [])),
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50,
                                                          height: 50,
                                                          child:
                                                              CircularProgressIndicator(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<PostsRecord>
                                                        columnPostsRecordList =
                                                        snapshot.data!;
                                                    if (columnPostsRecordList
                                                        .isEmpty) {
                                                      return Center(
                                                        child: Image.asset(
                                                          'assets/images/noFriends@2x.png',
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.9,
                                                        ),
                                                      );
                                                    }
                                                    return SingleChildScrollView(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: List.generate(
                                                            columnPostsRecordList
                                                                .length,
                                                            (columnIndex) {
                                                          final columnPostsRecord =
                                                              columnPostsRecordList[
                                                                  columnIndex];
                                                          return Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        12,
                                                                        0,
                                                                        0),
                                                            child: StreamBuilder<
                                                                List<
                                                                    UsersRecord>>(
                                                              stream:
                                                                  queryUsersRecord(
                                                                queryBuilder: (usersRecord) => usersRecord.where(
                                                                    'post_id',
                                                                    arrayContains:
                                                                        columnPostsRecord
                                                                            .postId),
                                                                singleRecord:
                                                                    true,
                                                              ),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width: 50,
                                                                      height:
                                                                          50,
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryColor,
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                List<UsersRecord>
                                                                    listFriendUsersRecordList =
                                                                    snapshot
                                                                        .data!;
                                                                final listFriendUsersRecord =
                                                                    listFriendUsersRecordList
                                                                            .isNotEmpty
                                                                        ? listFriendUsersRecordList
                                                                            .first
                                                                        : null;
                                                                return Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              8,
                                                                              0,
                                                                              8,
                                                                              0),
                                                                      child:
                                                                          Material(
                                                                        color: Colors
                                                                            .transparent,
                                                                        elevation:
                                                                            2,
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8),
                                                                        ),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 0.95,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).dark900,
                                                                            boxShadow: [
                                                                              BoxShadow(
                                                                                color: FlutterFlowTheme.of(context).dark900,
                                                                                offset: Offset(0, 1),
                                                                              )
                                                                            ],
                                                                            borderRadius:
                                                                                BorderRadius.circular(8),
                                                                            border:
                                                                                Border.all(
                                                                              color: Colors.transparent,
                                                                              width: 0,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    Card(
                                                                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                                                                      color: FlutterFlowTheme.of(context).primaryColor,
                                                                                      shape: RoundedRectangleBorder(
                                                                                        borderRadius: BorderRadius.circular(50),
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                                                                                        child: Container(
                                                                                          width: 50,
                                                                                          height: 50,
                                                                                          clipBehavior: Clip.antiAlias,
                                                                                          decoration: BoxDecoration(
                                                                                            shape: BoxShape.circle,
                                                                                          ),
                                                                                          child: CachedNetworkImage(
                                                                                            imageUrl: listFriendUsersRecord!.photoUrl!,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Text(
                                                                                          columnPostsRecord.postTitle!,
                                                                                          style: FlutterFlowTheme.of(context).subtitle1,
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Expanded(
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 4, 0),
                                                                                            child: Text(
                                                                                              dateTimeFormat('d/M/y', columnPostsRecord.date!),
                                                                                              style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                                    fontFamily: 'Lexend Deca',
                                                                                                    color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                    fontSize: 12,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    Icon(
                                                                                      Icons.chevron_right_rounded,
                                                                                      color: Color(0xFF82878C),
                                                                                      size: 24,
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            ),
                                                          );
                                                        }),
                                                      ),
                                                    );
                                                  },
                                                ),
                                            ],
                                          );
                                        },
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          if (valueOrDefault<bool>(currentUserDocument?.isDisabled, false) ==
              true)
            AuthUserStreamWidget(
              child: Stack(
                children: [
                  StreamBuilder<UsersRecord>(
                    stream: UsersRecord.getDocument(currentUserReference!),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: CircularProgressIndicator(
                              color: FlutterFlowTheme.of(context).primaryColor,
                            ),
                          ),
                        );
                      }
                      final stackUsersRecord = snapshot.data!;
                      return Stack(
                        children: [
                          StreamBuilder<List<PostsRecord>>(
                            stream: queryPostsRecord(
                              queryBuilder: (postsRecord) => postsRecord.where(
                                  'post_user',
                                  isEqualTo: currentUserReference),
                              singleRecord: true,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: CircularProgressIndicator(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                    ),
                                  ),
                                );
                              }
                              List<PostsRecord> stackPostsRecordList =
                                  snapshot.data!;
                              final stackPostsRecord =
                                  stackPostsRecordList.isNotEmpty
                                      ? stackPostsRecordList.first
                                      : null;
                              return Stack(
                                children: [
                                  if (stackPostsRecord != null)
                                    StreamBuilder<List<PostsRecord>>(
                                      stream: queryPostsRecord(
                                        queryBuilder: (postsRecord) =>
                                            postsRecord.where('post_user',
                                                isEqualTo:
                                                    currentUserReference),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50,
                                              height: 50,
                                              child: CircularProgressIndicator(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                              ),
                                            ),
                                          );
                                        }
                                        List<PostsRecord>
                                            columnPostsRecordList =
                                            snapshot.data!;
                                        if (columnPostsRecordList.isEmpty) {
                                          return Center(
                                            child: Image.asset(
                                              'assets/images/noFriends@2x.png',
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.9,
                                            ),
                                          );
                                        }
                                        return SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: List.generate(
                                                columnPostsRecordList.length,
                                                (columnIndex) {
                                              final columnPostsRecord =
                                                  columnPostsRecordList[
                                                      columnIndex];
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 12, 0, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8, 0, 8, 0),
                                                      child: Material(
                                                        color:
                                                            Colors.transparent,
                                                        elevation: 2,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                        ),
                                                        child: Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.95,
                                                          height: 250,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .lineColor,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .dark900,
                                                                offset: Offset(
                                                                    0, 1),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                            border: Border.all(
                                                              color: Colors
                                                                  .transparent,
                                                              width: 0,
                                                            ),
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12,
                                                                            20,
                                                                            12,
                                                                            0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Container(
                                                                      width: 24,
                                                                      height:
                                                                          32,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .lineColor,
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              10,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Icon(
                                                                            Icons.location_on_sharp,
                                                                            color:
                                                                                Colors.black,
                                                                            size:
                                                                                27,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              10,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Icon(
                                                                            Icons.date_range_outlined,
                                                                            color:
                                                                                Colors.black,
                                                                            size:
                                                                                27,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              10,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Icon(
                                                                            Icons.access_time,
                                                                            color:
                                                                                Colors.black,
                                                                            size:
                                                                                27,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          20,
                                                                          0,
                                                                          0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            columnPostsRecord.postTitle!,
                                                                            style:
                                                                                FlutterFlowTheme.of(context).title1,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0,
                                                                            10,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 4, 4, 0),
                                                                                child: Text(
                                                                                  'Location : ${columnPostsRecord.location}',
                                                                                  style: FlutterFlowTheme.of(context).subtitle1,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0,
                                                                            10,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 4, 4, 0),
                                                                                child: Text(
                                                                                  'Date : ${dateTimeFormat('d/M/y', columnPostsRecord.startTime)}',
                                                                                  style: FlutterFlowTheme.of(context).subtitle1,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0,
                                                                            10,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 4, 4, 0),
                                                                                child: Text(
                                                                                  'Time : ${dateTimeFormat('jm', columnPostsRecord.startTime)}',
                                                                                  style: FlutterFlowTheme.of(context).subtitle1,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceEvenly,
                                                                        children: [
                                                                          Text(
                                                                            'Status',
                                                                            style:
                                                                                FlutterFlowTheme.of(context).title1,
                                                                          ),
                                                                          Stack(
                                                                            children: [
                                                                              if (columnPostsRecord.status == true)
                                                                                Container(
                                                                                  width: 150,
                                                                                  height: 60,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0xAB5AEF39),
                                                                                    borderRadius: BorderRadius.circular(40),
                                                                                  ),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 4, 4, 0),
                                                                                          child: Text(
                                                                                            columnPostsRecord.status == false
                                                                                                ? valueOrDefault<String>(
                                                                                                    '',
                                                                                                    'Ongoing',
                                                                                                  )
                                                                                                : valueOrDefault<String>(
                                                                                                    '',
                                                                                                    'Complete',
                                                                                                  ),
                                                                                            textAlign: TextAlign.center,
                                                                                            style: FlutterFlowTheme.of(context).title2,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              if (columnPostsRecord.status == false)
                                                                                Container(
                                                                                  width: 150,
                                                                                  height: 60,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0xFFA1ABFF),
                                                                                    borderRadius: BorderRadius.circular(40),
                                                                                  ),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 4, 4, 0),
                                                                                          child: Text(
                                                                                            columnPostsRecord.status == false
                                                                                                ? valueOrDefault<String>(
                                                                                                    '',
                                                                                                    'Ongoing',
                                                                                                  )
                                                                                                : valueOrDefault<String>(
                                                                                                    '',
                                                                                                    'Complete',
                                                                                                  ),
                                                                                            textAlign: TextAlign.center,
                                                                                            style: FlutterFlowTheme.of(context).title2,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }),
                                          ),
                                        );
                                      },
                                    ),
                                  if (!(stackPostsRecord != null))
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: EmptyMatches2Widget(),
                                        ),
                                      ],
                                    ),
                                  if (stackPostsRecord != null)
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 20, 0, 20),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  await Navigator.push(
                                                    context,
                                                    PageTransition(
                                                      type: PageTransitionType
                                                          .fade,
                                                      duration: Duration(
                                                          milliseconds: 0),
                                                      reverseDuration: Duration(
                                                          milliseconds: 0),
                                                      child:
                                                          CreateEventPageWidget(),
                                                    ),
                                                  );
                                                },
                                                text: 'Create Event',
                                                icon: Icon(
                                                  Icons
                                                      .create_new_folder_outlined,
                                                  size: 15,
                                                ),
                                                options: FFButtonOptions(
                                                  width: 300,
                                                  height: 55,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .title1
                                                          .override(
                                                            fontFamily:
                                                                'Lexend Deca',
                                                            color: Colors.white,
                                                          ),
                                                  elevation: 3,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(40),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                ],
                              );
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
