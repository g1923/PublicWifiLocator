create table if not exists bookmark_group
(
    id            int          not null primary key,
    name          varchar(255) null,
    order_no      int          null,
    register_dttm timestamp    null,
    update_dttm   timestamp    null
)
    collate = utf8mb4_unicode_ci;

create table if not exists public_wifi
(
    id                  int          not null primary key,
    x_swifi_mgr_no      varchar(255) null,
    x_swifi_wrdofc      varchar(255) null,
    x_swifi_main_nm     varchar(255) null,
    x_swifi_adres1      varchar(255) null,
    x_swifi_adres2      varchar(255) null,
    x_swifi_instl_floor varchar(255) null,
    x_swifi_instl_mby   varchar(255) null,
    x_swifi_instl_ty    varchar(255) null,
    x_swifi_svc_se      varchar(255) null,
    x_swifi_cmcwr       varchar(255) null,
    x_swifi_cnstc_year  varchar(255) null,
    x_swifi_inout_door  varchar(255) null,
    x_swifi_remars3     varchar(255) null,
    lat                 varchar(255) null,
    lnt                 varchar(255) null,
    work_dttm           timestamp    null,
    constraint x_swifi_mgr_no
        unique (x_swifi_mgr_no)
)
    collate = utf8mb4_unicode_ci;

create table if not exists bookmark_list
(
    id            int          not null
        primary key,
    group_no      int          null,
    mgr_no        varchar(255) null,
    register_dttm timestamp    null,
    constraint group_fk
        foreign key (group_no) references bookmark_group (id)
            on update cascade on delete cascade,
    constraint mgr_fk
        foreign key (mgr_no) references public_wifi (x_swifi_mgr_no)
            on update cascade on delete cascade
)
    collate = utf8mb4_unicode_ci;

create table if not exists search_wifi
(
    id          int          not null
        primary key,
    lat         varchar(255) null,
    lnt         varchar(255) null,
    search_dttm timestamp    null
)
    collate = utf8mb4_unicode_ci;