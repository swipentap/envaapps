-- DNS Records for all ingress hosts
-- Prod: 10.11.2.17, Test: 10.11.3.17, Dev: 10.11.4.17

-- Prod
INSERT INTO records (name, type, value, ttl) VALUES ('sonar.prod.net', 'A', '10.11.2.17', 300) ON CONFLICT DO NOTHING;
INSERT INTO records (name, type, value, ttl) VALUES ('pgadmin.prod.net', 'A', '10.11.2.17', 300) ON CONFLICT DO NOTHING;
INSERT INTO records (name, type, value, ttl) VALUES ('pgsql.prod.net', 'A', '10.11.2.17', 300) ON CONFLICT DO NOTHING;
INSERT INTO records (name, type, value, ttl) VALUES ('rancher.prod.net', 'A', '10.11.2.17', 300) ON CONFLICT DO NOTHING;
INSERT INTO records (name, type, value, ttl) VALUES ('ollama.prod.net', 'A', '10.11.2.17', 300) ON CONFLICT DO NOTHING;
INSERT INTO records (name, type, value, ttl) VALUES ('ns.prod.net', 'A', '10.11.2.17', 300) ON CONFLICT DO NOTHING;
INSERT INTO records (name, type, value, ttl) VALUES ('certa.prod.net', 'A', '10.11.2.17', 300) ON CONFLICT DO NOTHING;

-- Test
INSERT INTO records (name, type, value, ttl) VALUES ('sonar.test.net', 'A', '10.11.3.17', 300) ON CONFLICT DO NOTHING;
INSERT INTO records (name, type, value, ttl) VALUES ('pgadmin.test.net', 'A', '10.11.3.17', 300) ON CONFLICT DO NOTHING;
INSERT INTO records (name, type, value, ttl) VALUES ('pgsql.test.net', 'A', '10.11.3.17', 300) ON CONFLICT DO NOTHING;
INSERT INTO records (name, type, value, ttl) VALUES ('rancher.test.net', 'A', '10.11.3.17', 300) ON CONFLICT DO NOTHING;
INSERT INTO records (name, type, value, ttl) VALUES ('ollama.test.net', 'A', '10.11.3.17', 300) ON CONFLICT DO NOTHING;
INSERT INTO records (name, type, value, ttl) VALUES ('ns.test.net', 'A', '10.11.3.17', 300) ON CONFLICT DO NOTHING;
INSERT INTO records (name, type, value, ttl) VALUES ('certa.test.net', 'A', '10.11.3.17', 300) ON CONFLICT DO NOTHING;

-- Dev
INSERT INTO records (name, type, value, ttl) VALUES ('sonar.dev.net', 'A', '10.11.4.17', 300) ON CONFLICT DO NOTHING;
INSERT INTO records (name, type, value, ttl) VALUES ('pgadmin.dev.net', 'A', '10.11.4.17', 300) ON CONFLICT DO NOTHING;
INSERT INTO records (name, type, value, ttl) VALUES ('pgsql.dev.net', 'A', '10.11.4.17', 300) ON CONFLICT DO NOTHING;
INSERT INTO records (name, type, value, ttl) VALUES ('rancher.dev.net', 'A', '10.11.4.17', 300) ON CONFLICT DO NOTHING;
INSERT INTO records (name, type, value, ttl) VALUES ('ollama.dev.net', 'A', '10.11.4.17', 300) ON CONFLICT DO NOTHING;
INSERT INTO records (name, type, value, ttl) VALUES ('ns.dev.net', 'A', '10.11.4.17', 300) ON CONFLICT DO NOTHING;
INSERT INTO records (name, type, value, ttl) VALUES ('certa.dev.net', 'A', '10.11.4.17', 300) ON CONFLICT DO NOTHING;
