CREATE  TYPE genders_enum AS ENUM ('male', 'female', 'other');
CREATE TABLE students (
                          id INT GENERATED ALWAYS AS IDENTITY,
                          name VARCHAR (255) NOT NULL,
                          gender genders_enum NOT NULL,
                          dob DATE NULL DEFAULT NULL,
                          admission_date DATE NULL DEFAULT NULL,
                          roll_no SMALLINT NOT NULL,
                          unique_id VARCHAR (15) NOT NULL,
                          father_name VARCHAR (255) NOT NULL DEFAULT '',
                          mother_name VARCHAR (255) NOT NULL DEFAULT '',
                          grade SMALLINT NOT NULL,
                          section CHAR NOT NULL DEFAULT '',
                          udise BIGINT NOT NULL,
                          created_at        timestamp with time zone default now() not null,
                          updated_at        timestamp with time zone default now() not null,
                          CONSTRAINT unique_id_unique UNIQUE (unique_id),
                          PRIMARY KEY (id)
);

CREATE INDEX students_udise_idx ON students (udise);
CREATE INDEX students_udise_grade_idx ON students (udise, grade);