-- Calculate topology
ALTER TABLE ways ADD COLUMN "source" integer;
ALTER TABLE ways ADD COLUMN "target" integer;

-- Run topology function
SELECT assign_vertex_id('ways', 0.00001, 'the_geom', 'gid');
CREATE INDEX ways_class_idx ON ways (class_id);
CREATE INDEX classes_idx ON classes (id);

-- Dijkstra
ALTER TABLE ways ADD COLUMN reverse_cost double precision;
UPDATE ways SET reverse_cost = length;

-- A-star
ALTER TABLE ways ADD COLUMN x1 double precision;
ALTER TABLE ways ADD COLUMN y1 double precision;
ALTER TABLE ways ADD COLUMN x2 double precision;
ALTER TABLE ways ADD COLUMN y2 double precision;

UPDATE ways SET x1 = x(ST_startpoint(the_geom));
UPDATE ways SET y1 = y(ST_startpoint(the_geom));

UPDATE ways SET x2 = x(ST_endpoint(the_geom));
UPDATE ways SET y2 = y(ST_endpoint(the_geom));

UPDATE ways SET x1 = x(ST_PointN(the_geom, 1));
UPDATE ways SET y1 = y(ST_PointN(the_geom, 1));

UPDATE ways SET x2 = x(ST_PointN(the_geom, ST_NumPoints(the_geom)));
UPDATE ways SET y2 = y(ST_PointN(the_geom, ST_NumPoints(the_geom)));

-- Shooting-Star
ALTER TABLE ways ADD COLUMN to_cost double precision;
ALTER TABLE ways ADD COLUMN rule text;
