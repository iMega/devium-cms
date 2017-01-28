unit PageMangerLib;

interface

uses ComCtrls;

type
{
  id int(10) unsigned NOT NULL auto_increment,
  parent_id int(10) unsigned NOT NULL default '1',
  name varchar(50) NOT NULL default '',
  title varchar(255) NOT NULL default '',
  text text,
  description text,
  visible tinyint(1) NOT NULL default '0',
  folder tinyint(1) NOT NULL default '0',
  language_id tinyint(3) unsigned NOT NULL default '1',
  keywords text,
  date datetime NOT NULL default '2004-01-01 00:00:00',
  sort_order tinyint(3) unsigned NOT NULL default '10',
  readonly tinyint(1) NOT NULL default '0',
  template_id tinyint(3) unsigned NOT NULL default '0',
  is_default tinyint(1) unsigned NOT NULL default '0',
  dinamic tinyint(1) unsigned NOT NULL default '0',
  dont_click tinyint(1) unsigned NOT NULL default '0',
  link_image varchar(50) default NULL,
  parent_data tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  UNIQUE KEY mod_rewrite (name,folder,parent_id,language_id),
  KEY parent_id (parent_id)
}
  TFolderFormData = record
    id: Integer;
    parent_id: Integer;
    name: String;
    title: String;
    text: String;
    description: String;
    dont_visible: Boolean;
    folder: Boolean;
    language_id: Integer;
    keywords: String;
    sort_order: Integer;
    template_id: Integer;
    is_default: Boolean;
    is_dynamic: Boolean;
    dont_click: Boolean;
    link_image: String;
    parent_data: Boolean;
    //
    Templates: String;
    Template: String;
  end;

  TNC = class(TTreeNode)
  private
    FID: Integer;
    FParentID: Integer;
    FSortOrder: Integer;
    FIsDefault: Boolean;
    FIsDynamic: Boolean;
    FDontVisible: Boolean;
    FDontClick: Boolean;
    FFolder: Boolean;
  public
    property ID: Integer read FID write FID;
    property ParentID: Integer read FParentID write FParentID;
    property SortOrder: Integer read FSortOrder write FSortOrder;
    property IsDefault: Boolean read FIsDefault write FIsDefault;
    property DontClick: Boolean read FDontClick write FDontClick;
    property IsDynamic: Boolean read FIsDynamic write FIsDynamic;
    property DontVisible: Boolean read FDontVisible write FDontVisible;
    property Folder: Boolean read FFolder write FFolder;
  end;

implementation

end.
