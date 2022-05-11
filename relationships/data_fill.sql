truncate table final_status_ cascade;

insert into final_status_ (ticket_id_, ticket_log_id_)
select tm.ticket_id_, tm.ticket_log_id_
from (
    select t.id as ticket_id_, tl.id as ticket_log_id_, max(tl.change_date_) as mcd, tl.change_date_ as change_date_
    from ticket_ t
    join ticket_log_ tl on t.id = tl.ticket_id_
    where tl.status_id_ = 2
    group by t.id, tl.id) tm
where tm.mcd = tm.change_date_;


select * from final_status_;

truncate table user_book_ticket_ cascade;

insert into user_book_ticket_ (ticket_id_, user_id_)
values (0, 0),
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (10, 10),
    (11, 11),
    (12, 12),
    (13, 13),
    (14, 14),
    (15, 1),
    (16, 2),
    (17, 3),
    (18, 4);


select * from user_book_ticket_;

truncate table employee_works_at_ cascade;

insert into employee_works_at_ (employee_id_, schedule_id_, branch_id_)
values (0, 0, 2),
    (1, 0, 2),
    (2, 0, 3),
    (3, 0, 3),
    (4, 0, 4),
    (5, 0, 5),
    (6, 0, 1),
    (0, 1, 2),
    (1, 1, 2),
    (2, 1, 3),
    (3, 1, 3),
    (4, 1, 4),
    (5, 1, 5),
    (6, 1, 1),
    (0, 2, 2),
    (1, 2, 2),
    (2, 2, 3),
    (3, 2, 3),
    (4, 2, 4),
    (5, 2, 5),
    (6, 2, 1),
    (0, 3, 2),
    (1, 3, 2),
    (2, 3, 3),
    (3, 3, 3),
    (4, 3, 4),
    (5, 3, 5),
    (6, 3, 1),
    (0, 4, 2),
    (1, 4, 2),
    (2, 4, 3),
    (3, 4, 3),
    (4, 4, 4),
    (5, 4, 5),
    (6, 4, 1),
    (0, 5, 2),
    (1, 5, 2),
    (2, 5, 3),
    (3, 5, 3),
    (4, 5, 4),
    (5, 5, 5),
    (6, 5, 1),
    (0, 6, 2),
    (1, 6, 2),
    (0, 7, 2),
    (1, 7, 2),
    (0, 8, 2),
    (1, 8, 2),
    (0, 9, 2),
    (1, 9, 2),
    (0, 10, 2),
    (1, 10, 2);


select * from employee_works_at_;

select * from branch_;
select * from interval_;

truncate table branch_open_interval_ cascade;

insert into branch_open_interval_ (branch_id_, interval_id_)
values (0, 0),
    (1, 0),
    (2, 0),
    (3, 0),
    (4, 0),
    (5, 0),
    (0, 1),
    (1, 1),
    (2, 1),
    (3, 1),
    (4, 1),
    (5, 1),
    (0, 2),
    (1, 2),
    (2, 2),
    (3, 2),
    (4, 2),
    (5, 2),
    (0, 3),
    (1, 3),
    (2, 3),
    (3, 3),
    (4, 3),
    (5, 3),
    (0, 4),
    (1, 4),
    (2, 4),
    (3, 4),
    (4, 4),
    (5, 4),
    (2, 5),
    (2, 6);



select * from branch_open_interval_;

truncate table ticket_located_in_branch_ cascade;

insert into ticket_located_in_branch_ (ticket_id_, branch_id_)
select id as ticket_id_, service_type_id_ as branch_id_ from ticket_;


select * from ticket_located_in_branch_;

truncate table company_provides_service_type_ cascade;

insert into company_provides_service_type_ (company_id_, service_type_id_)
values (0, 0),
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4);


select * from company_provides_service_type_;

truncate table company_specializes_in_field_ cascade;

insert into company_specializes_in_field_ (company_id_, field_id_)
values (0, 0),
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4);

select * from company_specializes_in_field_;