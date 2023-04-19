
INSERT INTO users VALUES ('user1','pbkdf2:sha256:260000$UEV4fnkO1Mtr5EBq$4624e65fae621ec38b6e6c47f49642a120dd91e2dc8c10477b5128b8de4b14dc','Foo',20);
INSERT INTO users VALUES ('user2','pbkdf2:sha256:260000$UEV4fnkO1Mtr5EBq$4624e65fae621ec38b6e6c47f49642a120dd91e2dc8c10477b5128b8de4b14dc','Bar',20);
INSERT INTO users VALUES ('user3','pbkdf2:sha256:260000$UEV4fnkO1Mtr5EBq$4624e65fae621ec38b6e6c47f49642a120dd91e2dc8c10477b5128b8de4b14dc','Baz',20);

INSERT INTO zone (id,zone_group,name) VALUES (1,1,'Zone 1A');
INSERT INTO zone (id,zone_group,name) VALUES (2,1,'Zone 1B');
INSERT INTO zone (id,zone_group,name) VALUES (3,2,'Parking');
INSERT INTO zone (id,zone_group,name) VALUES (4,3,'Zone 2A');
INSERT INTO zone (id,zone_group,name) VALUES (5,3,'Zone 2B');

-- fix PK sequence
SELECT pg_catalog.setval(pg_get_serial_sequence('zone', 'id'), (SELECT MAX(id) FROM zone));

INSERT INTO users VALUES ('group_1a',NULL,'Group 1A',100);
INSERT INTO users VALUES ('group_1b',NULL,'Group 1B',100);
INSERT INTO users VALUES ('group_parking',NULL,'Group Parking',100);
INSERT INTO users VALUES ('group_2a',NULL,'Group 2a',100);
INSERT INTO users VALUES ('group_2b',NULL,'Group 2b',100);

--INSERT INTO groups VALUES ('group_1a','user1');
INSERT INTO groups VALUES ('group_1b','user1');
INSERT INTO groups VALUES ('group_1a','user2');

INSERT INTO zone_assign VALUES (1,'user1',10);
INSERT INTO zone_assign VALUES (1,'group_1a',20);
INSERT INTO zone_assign VALUES (2,'group_1b',20);
INSERT INTO zone_assign VALUES (3,'group_parking',30);
INSERT INTO zone_assign VALUES (1,'admin',10);
INSERT INTO zone_assign VALUES (2,'admin',10);
INSERT INTO zone_assign VALUES (3,'admin',10);
INSERT INTO zone_assign VALUES (4,'admin',10);
INSERT INTO zone_assign VALUES (5,'admin',10);

-- fix PK sequence
SELECT pg_catalog.setval(pg_get_serial_sequence('blobs', 'id'), (SELECT MAX(id)+1 FROM blobs));

UPDATE zone SET iid = 1 WHERE id = 1;
UPDATE zone SET iid = 2 WHERE id = 2;
UPDATE zone SET iid = 3 WHERE id = 3;
UPDATE zone SET iid = 4 WHERE id = 4;
UPDATE zone SET iid = 5 WHERE id = 5;
