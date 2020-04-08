- 1. **Create table city**
CREATE TABLE city(
id NUMBER(11),
name VARCHAR(50)NOT NULL,
CONSTRAINT city PRIMARY KEY(id)
);
-- 2. **Create table referee**
CREATE TABLE referee(
id NUMBER(11),
name VARCHAR(50)NOT NULL,
CONSTRAINT referee PRIMARY KEY(id)
);

-- 3. **Create table innings**
CREATE TABLE innings(
id NUMBER(11),
innings_number NUMBER(11)NOT NULL,
CONSTRAINT innings PRIMARY KEY(id)
);

-- 4. **Create table extra_type**
CREATE TABLE extra_type(
id NUMBER(11),
name VARCHAR(50)NOT NULL,
CONSTRAINT extra_type PRIMARY KEY(id)
);

-- 5. **Create table skill**
CREATE TABLE skill(
id NUMBER(11),
CONSTRAINT skill PRIMARY KEY(id),
name VARCHAR(50)NOT NULL
);

-- 6. **Create table team**
CREATE TABLE team(
id NUMBER(11),
name VARCHAR(50) NOT NULL,
coach VARCHAR(50) NOT NULL,
home_city NUMBER(11),
captain NUMBER(11) NOT NULL,
CONSTRAINT fk_CITY
FOREIGN KEY (HOME_CITY)
REFERENCES CITY(ID),
CONSTRAINT team PRIMARY KEY(id)
);

-- 7. **Create table player**
CREATE TABLE player(
id NUMBER(11),
name VARCHAR(50) NOT NULL,
country VARCHAR(50) NOT NULL,
skill_id NUMBER(11) NOT Null,
team_id NUMBER(11) NOT NULL,
CONSTRAINT fk_SKILL
FOREIGN KEY (SKILL_ID)
REFERENCES SKILL(ID),
CONSTRAINT fk_TEAM
FOREIGN KEY (TEAM_ID)
REFERENCES TEAM(ID),
CONSTRAINT player PRIMARY KEY(id)
);

-- 8. **Create table venue**
CREATE TABLE venue(
id NUMBER(11),
stadium_name VARCHAR(50) NOT NULL,
CONSTRAINT venue PRIMARY KEY(id),
city_id NUMBER(11) NOT NULL,
CONSTRAINT fk_CITY1
FOREIGN KEY (CITY_ID)
REFERENCES CITY(ID)
);

-- 9. **Create table event**
CREATE TABLE event(
id NUMBER(11),
CONSTRAINT event PRIMARY KEY(id),
innings_id NUMBER(11)NOT NULL,
CONSTRAINT fk_INNINGS
FOREIGN KEY (INNINGS_ID)
REFERENCES INNINGS(ID),
events_no NUMBER(11)NOT NULL,
raider_id NUMBER(11)NOT NULL,
CONSTRAINT fk_PLAYER
FOREIGN KEY (RAIDER_ID)
REFERENCES PLAYER(ID),
raider_points NUMBER(11)NOT NULL,
defending_points NUMBER(11)NOT NULL,
clock_in_seconds NUMBER(11)NOT NULL,
team_one_score NUMBER(11)NOT NULL,
team_two_score NUMBER(11)NOT NULL
);

-- 10. **Create table extra_event**
CREATE TABLE extra_event(
id NUMBER(11),
CONSTRAINT extra_event PRIMARY KEY(id),
event_id NUMBER(11) NOT NULL,
CONSTRAINT fk_EVENT
FOREIGN KEY (EVENT_ID)
REFERENCES EVENT(ID),
extra_type_id NUMBER(11) NOT NULL,
CONSTRAINT fk_EXTRA_TYPE
FOREIGN KEY (EXTRA_TYPE_ID)
REFERENCES EXTRA_TYPE(ID),
points NUMBER(11) NOT NULL,
scoring_team_id NUMBER(11) NOT NULL,
CONSTRAINT fk_TEAMS
FOREIGN KEY (SCORING_TEAM_ID)
REFERENCES TEAM(ID)
);

-- 11. **Create table outcome**
CREATE TABLE outcome(
id NUMBER(11),
CONSTRAINT outcome PRIMARY KEY(id),
status VARCHAR(100) NOT NULL,
winner_team_id NUMBER(11),
CONSTRAINT FK_WINNER
FOREIGN KEY (WINNER_TEAM_ID)
REFERENCES TEAM(ID),
score NUMBER(11) NULL,
player_of_match NUMBER(11),
CONSTRAINT fk_PLAYER1
FOREIGN KEY (PLAYER_OF_MATCH)
REFERENCES PLAYER(ID)
);
-- 12. **Create table game**
CREATE TABLE game(
id NUMBER(11),
CONSTRAINT game PRIMARY KEY(id),
game_date DATE NOT NULL,
team_id_1 NUMBER(11),
CONSTRAINT FK_TEAM_ID_1
FOREIGN KEY (TEAM_ID_1)
REFERENCES TEAM(ID),
team_id_2 NUMBER(11),
CONSTRAINT FK_TEAM_ID_2
FOREIGN KEY (TEAM_ID_2)
REFERENCES TEAM(ID),
venue_id NUMBER(11),
CONSTRAINT FK_VENUE_ID
FOREIGN KEY (VENUE_ID)
REFERENCES VENUE(ID),
outcome_id NUMBER(11),
CONSTRAINT FK_OUTCOME_ID
FOREIGN KEY (OUTCOME_ID)
REFERENCES OUTCOME(ID),
referee_id_1 NUMBER(11),
CONSTRAINT FK_TEAM_ID_1
FOREIGN KEY (TEAM_ID_1)
REFERENCES TEAM(ID),
CONSTRAINT FK_REFEREE_ID_1
FOREIGN KEY (REFEREE_ID_1)
REFERENCES REFEREE(ID),
referee_id_2 NUMBER(11),
CONSTRAINT FK_REFEREE_ID_2
FOREIGN KEY (REFEREE_ID_2)
REFERENCES REFEREE(ID),
first_innings_id NUMBER(11),
CONSTRAINT FK_FIRST_INNINGS_ID
FOREIGN KEY (FIRST_INNINGS_ID)
REFERENCES INNINGS(ID),
second_innings_id NUMBER(11),
CONSTRAINT FK_SECOND_INNINGS_ID
FOREIGN KEY (SECOND_INNINGS_ID)
REFERENCES INNINGS(ID)
);
-- 13. **Drop table city**
DROP TABLE city;

-- 14. **Drop table innings**
DROP TABLE innings;

-- 15. **Drop table skill**
DROP TABLE skill;

-- 16. **Drop table extra_type**
DROP TABLE extra_type;