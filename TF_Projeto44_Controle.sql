CREATE USER IF NOT EXISTS analista IDENTIFIED BY 'pronatec';

GRANT ALL PRIVILEGES ON tf_pronatec.* TO analista;