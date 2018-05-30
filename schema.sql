/******************************************************************************
**  Data Base Name: ssidb
**  Desc: Table for Incident_type
** 
**  Called by: ssi
**
**  Author: Franz A. Lopez Choque
**
**  Date: 05/29/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/28/2018 Franz A. Lopez Choque   Initial version (ORM)
*******************************************************************************/
create table accident_types
(
  accident_type_id   bigint    not null primary key,
  created_on         datetime2 not null,
  updated_on         datetime2,
  accident_type_name varchar(255)
)
go

create table areas
(
  area_id          bigint identity primary key,
  created_on       datetime2 not null,
  updated_on       datetime2,
  area_description varchar(200),
  area_name        varchar(50)
)
go

create table assign_equipament
(
  assign_id     bigint identity primary key,
  created_on    datetime2 not null,
  updated_on    datetime2,
  assign_date   datetime2,
  assign_number int
)
go

create table causing_agents
(
  ausing_agent_id   bigint    not null primary key,
  created_on        datetime2 not null,
  updated_on        datetime2,
  ausing_agent_name varchar(255)
)
go

create table accidents
(
  accident_id                    bigint    not null primary key,
  created_on                     datetime2 not null,
  updated_on                     datetime2,
  bajamedica                     bigint,
  date_at                        datetime2,
  description                    varchar(255),
  lugaratencion                  varchar(255),
  personal                       varbinary(255),
  report_by                      varbinary(255),
  accident_type_accident_type_id bigint
    constraint FKeb7ouqi6cox1mh8j9hb9o49cq
    references accident_types,
  causing_agent_ausing_agent_id  bigint
    constraint FKe5qmlibj35euj5wl1p41q2v12
    references causing_agents
)
go

create table contracts
(
  contract_id          bigint identity primary key,
  created_on           datetime2 not null,
  updated_on           datetime2,
  contract_city        varchar(100),
  contract_code        varchar(50),
  contract_date        datetime2,
  contract_description varchar(100),
  contract_salary      float,
  contract_type        varchar(100)
)
go

create table department
(
  department_id          bigint identity primary key,
  created_on             datetime2 not null,
  updated_on             datetime2,
  department_description varchar(100),
  department_name        varchar(50)
)
go

create table enterprise
(
  enterprise_id          bigint identity primary key,
  created_on             datetime2 not null,
  updated_on             datetime2,
  enterprise_description varchar(50),
  enterprise_name        varchar(50)
)
go

create table equipaments
(
  equipament_id          bigint identity primary key,
  created_on             datetime2 not null,
  updated_on             datetime2,
  equipament_description varchar(200),
  equipament_image       varbinary(max),
  equipament_name        varchar(200),
  equipament_type        int
)
go

create table incident_detail
(
  incident_detail_id      bigint not null primary key,
  incident_detail_name    varchar(255),
  incident_detail_status  varchar(255),
  incident_detail_subtype varchar(255),
  incident_detail_type    varchar(255)
)
go

create table incident_type
(
  incident_type_id          bigint not null primary key,
  incident_sub_type         varchar(255),
  incident_type             varchar(255),
  incident_type_description varchar(255),
  incident_type_name        varchar(255)
)
go

create table kardex_equipaments
(
  equipament_kardex_id     bigint identity primary key,
  created_on               datetime2 not null,
  updated_on               datetime2,
  balance_kardex           int,
  date_kardex              datetime2,
  entry_kardex             int,
  outlay_kardex            int,
  equipament_equipament_id bigint
    constraint FK3v3egsvd44jw0dp81g8954jor
    references equipaments
)
go

create table personals
(
  personal_id        bigint identity primary key,
  created_on         datetime2 not null,
  updated_on         datetime2,
  personal_active    bit,
  personal_direction varchar(200),
  personal_cellphone varchar(100),
  personal_email     varchar(200),
  personal_last_name varchar(100),
  personal_name      varchar(100),
  personal_photo     varbinary(max),
  personal_telephone varchar(100),
  area_area_id       bigint
    constraint FKr40p11udq7743dyk91c6q0gee
    references areas
)
go

create table history_area_personal
(
  hap_id               bigint    not null primary key,
  created_on           datetime2 not null,
  updated_on           datetime2,
  hap_datea_fin        datetime2,
  hap_date_ini         datetime2,
  hap_status           bit,
  personal_personal_id bigint
    constraint FKkkvnxq7mfl47qxo2evd1w4wtp
    references personals
)
go

create table incident
(
  incident_id          bigint not null primary key,
  code                 varchar(255),
  date_at              datetime2,
  incident_number      int,
  recurrence           int,
  reincident           bit,
  reported_by          varchar(255),
  severity             varchar(255),
  treatment            bit,
  incident_detail_id   bigint
    constraint FK3ssgpjp6c7a1xboiyqgw96p25
    references incident_detail,
  incident_type_id     bigint
    constraint FKj8ceq1dm9co96dtaa5fbr5kqh
    references incident_type,
  personal_personal_id bigint
    constraint FKmcpah0lc6drhh07mgdbfxqu3h
    references personals
)
go

create table inventory
(
  inventory_id             bigint identity primary key,
  created_on               datetime2 not null,
  updated_on               datetime2,
  active_asignament        bit,
  date_asignament          datetime2,
  status_asignament        varchar(50),
  equipament_equipament_id bigint
    constraint FKkaqggai798ea5a5sr469i3727
    references equipaments,
  personal_personal_id     bigint
    constraint FKdxucqq9robwa2q10w5u5l0cc0
    references personals
)
go

create table position
(
  position_id                 bigint    not null primary key,
  created_on                  datetime2 not null,
  updated_on                  datetime2,
  position_description        varchar(800),
  position_level              int,
  position_name               varchar(300),
  parent_position_position_id bigint
    constraint FKj8epftod79hlqlf99k70lv374
    references position
)
go

create table department_position
(
  department_id bigint not null
    constraint FKmqxa31b65gsvwrevblkvym9cw
    references department,
  position_id   bigint not null
    constraint FK61w0h5n878sm9unf02bsdmjj9
    references position,
  primary key (department_id, position_id)
)
go

create table functions
(
  func_id              bigint    not null primary key,
  created_on           datetime2 not null,
  updated_on           datetime2,
  func_description     varchar(200),
  func_name            varchar(50),
  position_position_id bigint    not null
    constraint FKqc1lhol60bais6wg6rhwokkct
    references position
)
go

create table personal_position_contract
(
  pers_pos_contract_id        bigint    not null primary key,
  created_on                  datetime2 not null,
  updated_on                  datetime2,
  pers_pos_contract_end_date  datetime2,
  pers_pos_contract_init_date datetime2,
  pers_pos_contract_status    bit,
  pers_pos_contract_turno     varchar(255),
  contract_id                 bigint
    constraint FKnvsnfummqa3rg4n9u0ywelf7u
    references contracts,
  personal_id                 bigint
    constraint FKcakiev54vc4912s2ia5msw834
    references personals,
  position_id                 bigint
    constraint FK615ofvt01j9bjwnvx51hsi6y
    references position
)
go

create table program_sso
(
  sso_id             bigint identity primary key,
  created_on         datetime2 not null,
  updated_on         datetime2,
  sso_execution_time varchar(250),
  sso_goal           varchar(250),
  sso_indicator      varchar(250),
  sso_objetive       varchar(250),
  sso_responsable    varchar(250),
  sso_total_cost     float
)
go

create table program_sso_trainer
(
  sso_trainer_id        bigint identity primary key,
  created_on            datetime2 not null,
  updated_on            datetime2,
  sso_trainer_skills    varchar(255),
  sso_trainer_ci        varchar(10),
  sso_trainer_image     varbinary(max),
  sso_trainer_name      varchar(100),
  sso_trainer_specialty varchar(255)
)
go

create table program_sso_activities
(
  sso_detail_id         bigint    not null primary key,
  created_on            datetime2 not null,
  updated_on            datetime2,
  sso_detail_activities varchar(250),
  sso_detail_goal       varchar(200),
  so_detail_number      int,
  sso_detail_time       varchar(255),
  soo_detail_type       varchar(250),
  sso_id                bigint
    constraint FKdrvu25rlenaxc5jup4ev9yvnd
    references program_sso,
  sso_trainer_id        bigint
    constraint FK28kch4yp01y877k2v6ooxm0d6
    references program_sso_trainer
)
go

create table detail_personal_sso
(
  sso_detail_id bigint not null
    constraint FKlhl8ajdhkxgyoqep303eemluf
    references program_sso_activities,
  personal_id   bigint not null
    constraint FKii9654rjgyi33ct548gn35x2b
    references personals,
  primary key (sso_detail_id, personal_id)
)
go

create table program_sso_resource
(
  sso_resource_id     bigint identity primary key,
  created_on          datetime2 not null,
  updated_on          datetime2,
  sso_resource_cost   float,
  sso_resource_detail varchar(200),
  sso_detail_id       bigint
    constraint FKbjuj8exq5ov0yfvrydq9krkgg
    references program_sso_activities
)
go

create table requirements
(
  requiriment_id          bigint    not null primary key,
  created_on              datetime2 not null,
  updated_on              datetime2,
  requiriment_description varchar(200),
  requiriment_name        varchar(50),
  position_position_id    bigint    not null
    constraint FK9f0uko7hvg58q7ugquljjnn3e
    references position
)
go

create table risk_iperc
(
  risk_iperc_id   bigint identity primary key,
  created_on      datetime2 not null,
  updated_on      datetime2,
  risk_iperc_area varchar(50),
  risk_iperc_date datetime2,
  risk_iperc_goal varchar(50),
  risk_iperc_resp varchar(50),
  enterprise_id   bigint
    constraint FK45820ndcuyn6v32dxcoquxdi6
    references enterprise
)
go

create table risk_iperc_detail
(
  risk_iperc_det_id       bigint identity primary key,
  created_on              datetime2 not null,
  updated_on              datetime2,
  risk_iperc_det_ide_act  varchar(50),
  risk_iperc_det_ide_acti varchar(50),
  risk_iperc_det_ide_cond varchar(50),
  risk_iperc_det_ide_cons varchar(50),
  risk_iperc_det_eva_adm  varchar(50),
  risk_iperc_det_eva_ing  varchar(50),
  risk_iperc_det_eva_insp varchar(50),
  risk_iperc_det_ide_dan  varchar(50),
  risk_iperc_det_eva_c    int,
  risk_iperc_det_eva_desc varchar(200),
  risk_iperc_det_eva_e    int,
  risk_iperc_det_eva_lev  varchar(50),
  risk_iperc_det_eva_p    int,
  risk_iperc_det_eva_type varchar(10),
  risk_iperc_det_eva_val  int,
  risk_iperc_det_ide_risk varchar(50),
  risk_iperc_id           bigint
    constraint FKg56dso6340harwg5wyuyyrx9f
    references risk_iperc
)
go

create table roles
(
  role_id    bigint identity primary key,
  created_on datetime2 not null,
  updated_on datetime2,
  role_name  varchar(200)
    constraint UK_716hgxp60ym1lifrdgp67xt5k
    unique
)
go

create table users
(
  user_id       bigint identity primary key,
  created_on    datetime2 not null,
  updated_on    datetime2,
  user_password varchar(200),
  user_active   int,
  user_name     varchar(50)
    constraint UK_k8d0f2n7n88w1a16yhua64onx
    unique
)
go

create table user_role
(
  user_id bigint not null
    constraint FKj345gk1bovqvfame88rcx7yyx
    references users,
  role_id bigint not null
    constraint FKt7e7djp752sqn6w22i6ocqy6q
    references roles,
  primary key (user_id, role_id)
)
go


