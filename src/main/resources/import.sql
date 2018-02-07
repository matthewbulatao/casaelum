INSERT INTO APPLICATION_PROPERTIES(max_children_per_booking,max_adult_per_booking,entrance_fee_child,entrance_fee_adult,down_payment_percentage) VALUES(10,10,150,300,20);

INSERT INTO ROOM(name,type,code,capacity,rate,status) VALUES('Cabana','STANDARD','2STA1',2,500.00,'A');
INSERT INTO ROOM(name,type,code,capacity,rate,status) VALUES('Kalayaan','DELUXE','5DEL1',5,1500.00,'A');
INSERT INTO ROOM(name,type,code,capacity,rate,status) VALUES('Bongga','SUITE','10SUI1',10,3000.00,'A');

INSERT INTO ROOM_TYPE(name) VALUES('STANDARD');
INSERT INTO ROOM_TYPE(name) VALUES('DELUXE');
INSERT INTO ROOM_TYPE(name) VALUES('SUITE');

INSERT INTO MISCELLANEOUS(code,name,rate) VALUES('MISC_KARA','Karaoke',300);
INSERT INTO MISCELLANEOUS(code,name,rate) VALUES('MISC_BASK','Basketball Court',100);
INSERT INTO MISCELLANEOUS(code,name,rate) VALUES('MISC_EXTR','Extra Matress',100);
INSERT INTO MISCELLANEOUS(code,name,rate) VALUES('MISC_BARB','Barbeque Grill',0);
INSERT INTO MISCELLANEOUS(code,name,rate) VALUES('MISC_CHAR','Charcoal',20);