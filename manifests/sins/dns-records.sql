-- DNS Records for all ingress hosts
-- Pointing to HAProxy IP: 10.11.2.17

-- Add A records for all ingress hosts
INSERT INTO records (name, type, value, ttl) VALUES ('sonar.prod.net', 'A', '10.11.2.17', 300) ON CONFLICT DO NOTHING;
INSERT INTO records (name, type, value, ttl) VALUES ('pgadmin.prod.net', 'A', '10.11.2.17', 300) ON CONFLICT DO NOTHING;
INSERT INTO records (name, type, value, ttl) VALUES ('pgsql.prod.net', 'A', '10.11.2.17', 300) ON CONFLICT DO NOTHING;
INSERT INTO records (name, type, value, ttl) VALUES ('rancher.prod.net', 'A', '10.11.2.17', 300) ON CONFLICT DO NOTHING;
INSERT INTO records (name, type, value, ttl) VALUES ('ollama.prod.net', 'A', '10.11.2.17', 300) ON CONFLICT DO NOTHING;
INSERT INTO records (name, type, value, ttl) VALUES ('ns.prod.net', 'A', '10.11.2.17', 300) ON CONFLICT DO NOTHING;
INSERT INTO records (name, type, value, ttl) VALUES ('certa.prod.net', 'A', '10.11.2.17', 300) ON CONFLICT DO NOTHING;
