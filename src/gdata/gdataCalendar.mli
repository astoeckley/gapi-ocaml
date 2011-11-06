val ns_gCal : string

type calendar_accessLevelProperty = string

type calendar_webContentGadgetPref = {
  wcgp_name : string;
  wcgp_value : string
}

val empty_webContentGadgetPref : calendar_webContentGadgetPref

type calendar_webContent = {
  wc_height : int;
  wc_url : string;
  wc_width : int;
  wc_webContentGadgetPrefs : calendar_webContentGadgetPref list
}

val empty_webContent : calendar_webContent

type calendar_calendarWhere = string

type calendar_colorProperty = string

type calendar_hiddenProperty = bool

type calendar_overrideNameProperty = string

type calendar_selectedProperty = bool

type calendar_timeZoneProperty = string

type calendar_timesCleanedProperty = int

type gdata_attendeeStatus = string

type calendar_resourceProperty = {
  rp_id : string;
  rp_value : bool
}

val empty_resourceProperty : calendar_resourceProperty

type calendar_calendarWho = {
  cw_email : string;
  cw_rel : string;
  cw_value : string;
  cw_resource : calendar_resourceProperty;
  cw_attendeeStatus : gdata_attendeeStatus
}

val empty_who : calendar_calendarWho

type gdata_kind = {
  k_scheme : string;
  k_term : string
}

val eventKind : gdata_kind

type gdata_eventStatus = string

type calendar_icalUIDProperty = string

type gdata_reminder = {
  r_absoluteTime : GdataDate.t;
  r_days : int;
  r_hours : int;
  r_method : string;
  r_minutes : int
}

val empty_reminder : gdata_reminder

type gdata_when = {
  w_endTime : GdataDate.t;
  w_startTime : GdataDate.t;
  w_value : string;
  w_reminders : gdata_reminder list
}

val empty_when : gdata_when

type gdata_originalEvent = {
  oe_href : string;
  oe_id : string;
  oe_when : gdata_when
}

val empty_originalEvent : gdata_originalEvent

type calendar_privateCopyProperty = bool

type calendar_quickAddProperty = bool

type gdata_recurrence = string

type calendar_sendEventNotificationsProperty = bool

type calendar_sequenceNumberProperty = int

type calendar_syncEventProperty = bool

type gdata_transparency = string

type gdata_visibility = string

type calendar_calendarExtendedProperty = {
  cep_name : string;
  cep_realm : string;
  cep_value : string
}

val empty_extendedProperty : calendar_calendarExtendedProperty

val parse_where :
  calendar_calendarWhere ->
  GdataCore.xml_data_model ->
  calendar_calendarWhere

val parse_extendedProperty :
  calendar_calendarExtendedProperty ->
  GdataCore.xml_data_model ->
  calendar_calendarExtendedProperty

val parse_resourceProperty :
  calendar_resourceProperty ->
  GdataCore.xml_data_model ->
  calendar_resourceProperty

val parse_attendeeStatus :
  gdata_attendeeStatus ->
  GdataCore.xml_data_model ->
  gdata_attendeeStatus

val parse_who :
  calendar_calendarWho ->
  GdataCore.xml_data_model ->
  calendar_calendarWho

val parse_reminder :
  gdata_reminder ->
  GdataCore.xml_data_model ->
  gdata_reminder

val parse_when :
  gdata_when ->
  GdataCore.xml_data_model ->
  gdata_when

val parse_originalEvent :
  gdata_originalEvent ->
  GdataCore.xml_data_model ->
  gdata_originalEvent

val get_calendar_prefix : string -> string

val render_where :
  calendar_calendarWhere ->
  GdataCore.xml_data_model list

val render_extendedProperty :
  calendar_calendarExtendedProperty ->
  GdataCore.xml_data_model list

val render_resourceProperty :
  calendar_resourceProperty ->
  GdataCore.xml_data_model list

val render_attendeeStatus :
  gdata_attendeeStatus ->
  GdataCore.xml_data_model list

val render_who :
  calendar_calendarWho ->
  GdataCore.xml_data_model list

val render_reminder :
  gdata_reminder ->
  GdataCore.xml_data_model list

val render_when :
  gdata_when ->
  GdataCore.xml_data_model list

val render_originalEvent :
  gdata_originalEvent ->
  GdataCore.xml_data_model list

module Link :
sig
  type t = {
    href : string;
    length : Int64.t;
    rel : string;
    title : string;
    ltype : string;
    webContent : calendar_webContent
  }

  val empty : t

  val to_xml_data_model : t -> GdataCore.xml_data_model list

  val of_xml_data_model : t -> GdataCore.xml_data_model -> t

end

module Entry :
sig
  type t = {
    ce_etag : string;
    ce_kind : string;
    ce_authors : GdataAtom.Author.t list;
    ce_categories : GdataAtom.Category.t list;
    ce_contributors : GdataAtom.Contributor.t list;
    ce_id : GdataAtom.atom_id;
    ce_content : GdataAtom.Content.t;
    ce_published : GdataAtom.atom_published;
    ce_updated : GdataAtom.atom_updated;
    ce_edited : GdataAtom.app_edited;
    ce_accesslevel : calendar_accessLevelProperty;
    ce_links : Link.t list;
    ce_where : calendar_calendarWhere list;
    ce_color : calendar_colorProperty;
    ce_hidden : calendar_hiddenProperty;
    ce_overridename : calendar_overrideNameProperty;
    ce_selected : calendar_selectedProperty;
    ce_timezone : calendar_timeZoneProperty;
    ce_timesCleaned : calendar_timesCleanedProperty;
    ce_summary : GdataAtom.Summary.t;
    ce_title : GdataAtom.Title.t;
    ce_extensions : GdataCore.xml_data_model list
  }

  val empty : t

  val to_xml_data_model : t -> GdataCore.xml_data_model list

  val of_xml_data_model : t -> GdataCore.xml_data_model -> t

end

val parse_calendar_entry :
  GdataCore.xml_data_model ->
  Entry.t

val calendar_entry_to_data_model :
  Entry.t ->
  GdataCore.xml_data_model

module Feed :
  GdataAtom.FEED
    with type entry_t = Entry.t
      and type link_t = Link.t

module Comments :
  GdataComments.COMMENTS
    with type link_t = Link.t

val parse_personal_settings :
  GdataCore.xml_data_model ->
  (string, string) Hashtbl.t

module Rel :
sig
  type t =
    [ `EventFeed
    | GdataACL.Rel.t ]

  val to_string : t -> string

end

val find_url : Rel.t -> Link.t list -> string

