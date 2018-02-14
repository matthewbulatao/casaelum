INSERT INTO APPLICATION_PROPERTIES(max_children_per_booking,max_adult_per_booking,entrance_fee_child,entrance_fee_adult,down_payment_percentage) VALUES(10,10,150,300,20);

INSERT INTO ROLE(code,name) VALUES('ROLE_ADMIN','ADMIN');
INSERT INTO ROLE(code,name) VALUES('ROLE_STAFF','STAFF');

INSERT INTO USER(first_name,last_name,user_name,password,status) VALUES('Default ADMIN','ADMIN','admin','$2a$11$AZq/jKbivgqMyAgw9tvHZewCDQroopork6SgrE/UFfaOYtmIH.iCS','A');
INSERT INTO USER(first_name,last_name,user_name,password,status) VALUES('Default STAFF','STAFF','staff','$2a$11$CktRdgq67Idvpryu1wW.sekjo4e2aUbUPxUmaISVnF1JGKiSKLZNO','A');

INSERT INTO USER_ROLES(user_id,roles_id) VALUES(1,1);
INSERT INTO USER_ROLES(user_id,roles_id) VALUES(2,2);

INSERT INTO ROOM(name,type,code,capacity,rate,status,description) VALUES('Cabana','STANDARD','2STA1',2,500.00,'A','Cozy room for 2 people (couple or partners), with super single bed and air-conditioning');
INSERT INTO ROOM(name,type,code,capacity,rate,status,description) VALUES('Kalayaan','DELUXE','5DEL1',5,1500.00,'A','Nice room for 5 people, good for family, with 2 super single bed and air-conditioning with 1 bathroom');
INSERT INTO ROOM(name,type,code,capacity,rate,status,description) VALUES('Villa Casa','SUITE','10SUI1',10,3000.00,'A','A big room good for 10 people, good for a big family or group or friends, with 2 queen-sized beds, air-conditioning with 2 bathrooms');

INSERT INTO ROOM_TYPE(name) VALUES('STANDARD');
INSERT INTO ROOM_TYPE(name) VALUES('DELUXE');
INSERT INTO ROOM_TYPE(name) VALUES('SUITE');

INSERT INTO MISCELLANEOUS(code,name,rate) VALUES('MISC_KARA','Karaoke',300);
INSERT INTO MISCELLANEOUS(code,name,rate) VALUES('MISC_BASK','Basketball Court',100);
INSERT INTO MISCELLANEOUS(code,name,rate) VALUES('MISC_EXTR','Extra Matress',100);
INSERT INTO MISCELLANEOUS(code,name,rate) VALUES('MISC_BARB','Barbeque Grill',0);
INSERT INTO MISCELLANEOUS(code,name,rate) VALUES('MISC_CHAR','Charcoal',20);