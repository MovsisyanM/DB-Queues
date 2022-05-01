drop table if exists final_status_;

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