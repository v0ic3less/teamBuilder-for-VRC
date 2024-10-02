import '/components/event_details/event_details_widget.dart';
import '/components/events/events_widget.dart';
import '/components/followed_teams_widget.dart';
import '/components/meeting_cards/meeting_cards_widget.dart';
import '/components/nav_bar_b_g_widget.dart';
import '/components/world_skills_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for EventDetails component.
  late EventDetailsModel eventDetailsModel;
  // Model for MeetingCards component.
  late MeetingCardsModel meetingCardsModel;
  // Model for UpcomingEvents.
  late EventsModel upcomingEventsModel1;
  // Model for WorldSkills component.
  late WorldSkillsModel worldSkillsModel1;
  // Model for FollowedTeams component.
  late FollowedTeamsModel followedTeamsModel1;
  // Model for UpcomingEvents.
  late EventsModel upcomingEventsModel2;
  // Model for WorldSkills component.
  late WorldSkillsModel worldSkillsModel2;
  // Model for FollowedTeams component.
  late FollowedTeamsModel followedTeamsModel2;
  // Model for UpcomingEvents.
  late EventsModel upcomingEventsModel3;
  // Model for WorldSkills component.
  late WorldSkillsModel worldSkillsModel3;
  // Model for FollowedTeams component.
  late FollowedTeamsModel followedTeamsModel3;
  // Model for NavBarSchedule.
  late NavBarBGModel navBarScheduleModel;
  // Model for NavBarMessages.
  late NavBarBGModel navBarMessagesModel;
  // Model for NavBarHome.
  late NavBarBGModel navBarHomeModel;
  // Model for NavBarExplore.
  late NavBarBGModel navBarExploreModel;
  // Model for NavBarMore.
  late NavBarBGModel navBarMoreModel;
  // Model for NavBarOther.
  late NavBarBGModel navBarOtherModel;

  @override
  void initState(BuildContext context) {
    eventDetailsModel = createModel(context, () => EventDetailsModel());
    meetingCardsModel = createModel(context, () => MeetingCardsModel());
    upcomingEventsModel1 = createModel(context, () => EventsModel());
    worldSkillsModel1 = createModel(context, () => WorldSkillsModel());
    followedTeamsModel1 = createModel(context, () => FollowedTeamsModel());
    upcomingEventsModel2 = createModel(context, () => EventsModel());
    worldSkillsModel2 = createModel(context, () => WorldSkillsModel());
    followedTeamsModel2 = createModel(context, () => FollowedTeamsModel());
    upcomingEventsModel3 = createModel(context, () => EventsModel());
    worldSkillsModel3 = createModel(context, () => WorldSkillsModel());
    followedTeamsModel3 = createModel(context, () => FollowedTeamsModel());
    navBarScheduleModel = createModel(context, () => NavBarBGModel());
    navBarMessagesModel = createModel(context, () => NavBarBGModel());
    navBarHomeModel = createModel(context, () => NavBarBGModel());
    navBarExploreModel = createModel(context, () => NavBarBGModel());
    navBarMoreModel = createModel(context, () => NavBarBGModel());
    navBarOtherModel = createModel(context, () => NavBarBGModel());
  }

  @override
  void dispose() {
    eventDetailsModel.dispose();
    meetingCardsModel.dispose();
    upcomingEventsModel1.dispose();
    worldSkillsModel1.dispose();
    followedTeamsModel1.dispose();
    upcomingEventsModel2.dispose();
    worldSkillsModel2.dispose();
    followedTeamsModel2.dispose();
    upcomingEventsModel3.dispose();
    worldSkillsModel3.dispose();
    followedTeamsModel3.dispose();
    navBarScheduleModel.dispose();
    navBarMessagesModel.dispose();
    navBarHomeModel.dispose();
    navBarExploreModel.dispose();
    navBarMoreModel.dispose();
    navBarOtherModel.dispose();
  }
}
