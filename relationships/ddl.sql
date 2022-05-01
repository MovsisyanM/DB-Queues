drop table if exists branch_open_interval_, final_status_, user_book_ticket_, employee_works_at_;

-- final_status relationship:
-- (#12)

create table final_status_ (
    ticket_id_ int references ticket_(id) primary key,
    ticket_log_id_ int references ticket_log_(id)
);


-- user_book_ticket relationship:
-- (#13)

create table user_book_ticket_ (
    ticket_id_ int references ticket_(id) primary key,
    user_id_ int references user_(id)
);


-- employee_works_schedule and employee_is_in_branch relationship:
-- (#17, #18, #20)

create table employee_works_at_ (
    employee_id_ int references employee_(id),
    schedule_id_ int references schedule_(id),
    branch_id_ int references branch_(id),
    primary key (employee_id_, schedule_id_)
);


-- branch_open_interval relationship:
-- (#21)

create table branch_open_interval_ (
    branch_id_ int references branch_(id),
    interval_id_ int references interval_(id),
    primary key (branch_id_, interval_id_)
);


-- ticket_located_in_branch 
-- (#22)

create table ticket_located_in_branch_ (
    ticket_id_ int references ticket_(id) primary key,
    branch_id_ int references branch_(id)
);