-- create database concert_masterlist
--USERS TABLE
CREATE TABLE
    users (
        id SERIAL PRIMARY KEY,
        email VARCHAR(60) not null,
        username VARCHAR(60) not null,
        is_admin BOOLEAN default false,
        password VARCHAR(1000) not null
    );

--CONCERTS TABLE
CREATE TABLE
    concerts (
        id SERIAL PRIMARY KEY,
        venue VARCHAR(150),
        city VARCHAR(150) NOT NULL,
        state VARCHAR(2),
        date DATE NOT NULL
    );

--BANDS TABLE
CREATE TABLE
    bands (id SERIAL PRIMARY KEY, name VARCHAR(100) NOT NULL);

--USER_CONCERTS Joiner table
CREATE TABLE
    user_concerts (
        id SERIAL PRIMARY KEY,
        user_id INTEGER REFERENCES users (id) ON DELETE CASCADE,
        concert_id INTEGER REFERENCES concerts (id) ON DELETE CASCADE,
        hidden BOOLEAN default false,
        is_deleted BOOLEAN default false,
        deleted_date DATE,
        favorite BOOLEAN default false,
        comments VARCHAR(1000),
        seat_location VARCHAR(35)
    );

--ENHANCEMENTS  // need to implement this in the future
-- type will be a dropdown menu
CREATE TABLE
    enhancements (
        id SERIAL PRIMARY KEY,
        user_concert_id INTEGER REFERENCES user_concerts (id) ON DELETE CASCADE,
        type VARCHAR(50) NOT NULL,
        description VARCHAR(1000)
        -- description is updated. was too small.
    );

-- NEW JOIN TABLE BAND_CONCERTS
CREATE TABLE
    band_concerts (
        id SERIAL PRIMARY KEY,
        band_id INTEGER REFERENCES bands (id) ON DELETE CASCADE,
        concert_id INTEGER REFERENCES concerts (id) ON DELETE CASCADE,
        concert_position INTEGER
    );

-- PICTURES TABLE
CREATE TABLE
    pictures (
        id SERIAL PRIMARY KEY,
        user_id INTEGER REFERENCES users (id),
        band_concert_id INTEGER REFERENCES band_concerts (id) ON DELETE CASCADE,
        url VARCHAR(1000) NOT NULL
    );

-- FRIENDS  // working on implementation
-- Will need to insert userA and userB as well as userB and userA for easier/better search/functionality
-- Status will be confirmed/pending/blocked
CREATE TABLE
    friends (
        id SERIAL PRIMARY KEY,
        user_1 INTEGER REFERENCES users (id) ON DELETE CASCADE,
        user_2 INTEGER REFERENCES users (id) ON DELETE CASCADE,
        status VARCHAR(10),
        met_where VARCHAR(150)
    );

-- FRIEND REQUEST table to keep Friends table cleaner
-- will need CRONJOB to clean this table out
-- Status will be accepted/pending/declined
CREATE TABLE
    friend_request (
        id SERIAL PRIMARY KEY,
        sender_id INTEGER REFERENCES users (id) ON DELETE CASCADE,
        receiver_id INTEGER REFERENCES users (id) ON DELETE CASCADE,
        status VARCHAR(10),
        sent_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
    )