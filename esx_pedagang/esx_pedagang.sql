INSERT INTO `addon_account` (name, label, shared) VALUES
  ('society_pedagang', 'pedagang', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
  ('society_pedagang', 'pedagang', 1),
  ('society_pedagang_fridge', 'pedagang (frigorifico)', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES 
    ('society_pedagang', 'pedagang', 1)
;

INSERT INTO `jobs` (name, label, whitelisted) VALUES
  ('pedagang', 'pedagang', 1)
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  ('pedagang', 0, 'pedagang', 'pedagang', 800, '{}', '{}')
;