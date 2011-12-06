module QueryParameters :
sig
  type t = {
    fields : string;
    prettyPrint : bool;
    quotaUser : string;
    userIp : string;
    maxAttendees : int;
    maxResults : int;
    minAccessRole : string;
    orderBy : string;
    originalStart : GapiDate.t;
    pageToken : string;
    q : string;
    sendNotifications : bool;
    singleEvents : bool;
    showDeleted : bool;
    showHidden : bool;
    showHiddenInvitations : bool;
    timeMax : GapiDate.t;
    timeMin : GapiDate.t;
    timeZone : string;
    updatedMin : GapiDate.t;
  }

  val default : t

  val to_key_value_list : t -> (string * string) list

end

module AclResource :
  GapiService.SERVICE with
    type resource_list_t = GapiCalendar.Acl.t
      and type resource_t = GapiCalendar.AclRule.t
      and type query_parameters_t = GapiService.StandardParameters.t

module CalendarListResource :
  GapiService.SERVICE with
    type resource_list_t = GapiCalendar.CalendarList.t
      and type resource_t = GapiCalendar.CalendarListEntry.t
      and type query_parameters_t = QueryParameters.t

module CalendarsResource :
sig
  val get :
    ?url:string ->
    ?container_id:string ->
    string ->
    GapiConversation.Session.t ->
    (GapiCalendar.Calendar.t * GapiConversation.Session.t)

  val refresh :
    ?url:string ->
    ?container_id:string ->
    GapiCalendar.Calendar.t ->
    GapiConversation.Session.t ->
    (GapiCalendar.Calendar.t * GapiConversation.Session.t)

  val insert :
    ?url:string ->
    ?container_id:string ->
    GapiCalendar.Calendar.t ->
    GapiConversation.Session.t ->
    (GapiCalendar.Calendar.t * GapiConversation.Session.t)

  val update :
    ?url:string ->
    ?container_id:string ->
    GapiCalendar.Calendar.t ->
    GapiConversation.Session.t ->
    (GapiCalendar.Calendar.t * GapiConversation.Session.t)

  val patch :
    ?url:string ->
    ?container_id:string ->
    GapiCalendar.Calendar.t ->
    GapiConversation.Session.t ->
    (GapiCalendar.Calendar.t * GapiConversation.Session.t)

  val delete :
    ?url:string ->
    ?container_id:string ->
    GapiCalendar.Calendar.t ->
    GapiConversation.Session.t ->
    (unit * GapiConversation.Session.t)

  val clear :
    ?url:string ->
    GapiConversation.Session.t ->
    (unit * GapiConversation.Session.t)

end

module ColorsResource :
sig
  val get :
    ?url:string ->
    GapiConversation.Session.t ->
    (GapiCalendar.Colors.t * GapiConversation.Session.t)

end

module EventsResource :
sig
  val list :
    ?url:string ->
    ?etag:string ->
    ?parameters:QueryParameters.t ->
    ?container_id:string ->
    GapiConversation.Session.t ->
    (GapiCalendar.Events.t * GapiConversation.Session.t)

  val get :
    ?url:string ->
    ?container_id:string ->
    string ->
    GapiConversation.Session.t ->
    (GapiCalendar.Event.t * GapiConversation.Session.t)

  val refresh :
    ?url:string ->
    ?container_id:string ->
    GapiCalendar.Event.t ->
    GapiConversation.Session.t ->
    (GapiCalendar.Event.t * GapiConversation.Session.t)

  val insert :
    ?url:string ->
    ?container_id:string ->
    GapiCalendar.Event.t ->
    GapiConversation.Session.t ->
    (GapiCalendar.Event.t * GapiConversation.Session.t)

  val update :
    ?url:string ->
    ?container_id:string ->
    GapiCalendar.Event.t ->
    GapiConversation.Session.t ->
    (GapiCalendar.Event.t * GapiConversation.Session.t)

  val patch :
    ?url:string ->
    ?container_id:string ->
    GapiCalendar.Event.t ->
    GapiConversation.Session.t ->
    (GapiCalendar.Event.t * GapiConversation.Session.t)

  val delete :
    ?url:string ->
    ?container_id:string ->
    GapiCalendar.Event.t ->
    GapiConversation.Session.t ->
    (unit * GapiConversation.Session.t)

  val instances :
    ?url:string ->
    ?container_id:string ->
    string ->
    GapiConversation.Session.t ->
    (GapiCalendar.Events.t * GapiConversation.Session.t)

  val import :
    ?url:string ->
    ?container_id:string ->
    GapiCalendar.Event.t ->
    GapiConversation.Session.t ->
    (GapiCalendar.Event.t * GapiConversation.Session.t)

  val quickAdd :
    ?url:string ->
    ?container_id:string ->
    string ->
    GapiConversation.Session.t ->
    (GapiCalendar.Event.t * GapiConversation.Session.t)

  val move :
    ?url:string ->
    ?container_id:string ->
    string ->
    string ->
    GapiConversation.Session.t ->
    (GapiCalendar.Event.t * GapiConversation.Session.t)

  val reset :
    ?url:string ->
    ?container_id:string ->
    string ->
    GapiConversation.Session.t ->
    (GapiCalendar.Event.t * GapiConversation.Session.t)

end

module FreebusyResource :
sig
  val query :
    ?url:string ->
    GapiCalendar.FreeBusyRequest.t ->
    GapiConversation.Session.t ->
    (GapiCalendar.FreeBusyResource.t * GapiConversation.Session.t)

end

module SettingsResource :
sig
  val list :
    ?url:string ->
    ?etag:string ->
    ?parameters:GapiService.StandardParameters.t ->
    ?container_id:string ->
    GapiConversation.Session.t ->
    (GapiCalendar.Settings.t * GapiConversation.Session.t)

  val get :
    ?url:string ->
    ?container_id:string ->
    string ->
    GapiConversation.Session.t ->
    (GapiCalendar.Setting.t * GapiConversation.Session.t)

end

