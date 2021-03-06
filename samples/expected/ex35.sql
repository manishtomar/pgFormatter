CREATE TABLE kbln (
    id integer NOT NULL,
    blank_series varchar(50) NOT NULL,
    company_id varchar(8)
)
PARTITION BY RANGE (id);

CREATE TABLE kbln_p0 PARTITION OF kbln
FOR VALUES FROM (MINVALUE) TO (500000)
PARTITION BY HASH (blank_series);

CREATE TABLE kbln_p0_1 PARTITION OF kbln_p0
FOR VALUES WITH (MODULUS 2, REMAINDER 0);

CREATE TABLE kbln_p0_2 PARTITION OF kbln_p0
FOR VALUES WITH (MODULUS 2, REMAINDER 1);

ALTER TABLE t1 DETACH PARTITION t1_a;

ALTER TABLE t1 ATTACH PARTITION t1_a
FOR VALUES IN (1, 2, 3);

CREATE TABLE kbln (
    id integer NOT NULL,
    blank_series varchar(50) NOT NULL,
    company_id varchar(8)
)
PARTITION BY LIST (id);

