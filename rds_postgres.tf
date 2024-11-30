resource "aws_db_instance" "postgres" {
  allocated_storage       = 20
  engine                  = "postgres"
  engine_version          = "16.3"
  instance_class          = "db.t4g.micro"
  db_name                 = "challenge"
  username                = "postgres"
  password                = "Localhost1988!"
  parameter_group_name    = "default.postgres14"
  publicly_accessible     = false
  skip_final_snapshot     = true
  storage_type            = "gp2"
  backup_retention_period = 0

  tags = {
    Name = "EcommerceRDS"
  }
}

resource "null_resource" "create_tables" {
  provisioner "local-exec" {
    command = <<EOT
      export PGPASSWORD=${aws_db_instance.postgres.password} && \
      psql -h ${aws_db_instance.postgres.address} \
           -U ${aws_db_instance.postgres.username} \
           -d ${aws_db_instance.postgres.db_name} \
           -c "
              CREATE TABLE IF NOT EXISTS customers (
                id SERIAL PRIMARY KEY,
                name VARCHAR(255) NOT NULL,
                email VARCHAR(255) UNIQUE NOT NULL,
                cpf VARCHAR(14) UNIQUE NOT NULL,
                hashed_password VARCHAR(255) NOT NULL
              );

              CREATE TABLE IF NOT EXISTS products (
                id SERIAL PRIMARY KEY,
                name VARCHAR(255) NOT NULL,
                description TEXT,
                price DECIMAL(10, 2) NOT NULL,
                category_id INT REFERENCES categories(id)
              );

              CREATE TABLE IF NOT EXISTS categories (
                id SERIAL PRIMARY KEY,
                name VARCHAR(255) UNIQUE NOT NULL
              );

              CREATE TABLE IF NOT EXISTS orders (
                id SERIAL PRIMARY KEY,
                status VARCHAR(50) DEFAULT 'created',
                payment_status VARCHAR(50) DEFAULT 'pendente',
                user_agent TEXT,
                ip_address TEXT,
                os VARCHAR(50),
                browser VARCHAR(50),
                device VARCHAR(50),
                comments TEXT,
                created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                customer_id INT REFERENCES customers(id)
              );

              CREATE TABLE IF NOT EXISTS order_items (
                id SERIAL PRIMARY KEY,
                order_id INT REFERENCES orders(id),
                product_id INT REFERENCES products(id),
                comment TEXT
              );

              CREATE TABLE IF NOT EXISTS order_products (
                id SERIAL PRIMARY KEY,
                order_id INT REFERENCES orders(id),
                product_id INT REFERENCES products(id),
                comment TEXT
              );

              CREATE TABLE IF NOT EXISTS tracking (
                id SERIAL PRIMARY KEY,
                order_id INT REFERENCES orders(id),
                status VARCHAR(50),
                created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
              );

              CREATE TABLE IF NOT EXISTS tokens (
                id SERIAL PRIMARY KEY,
                token VARCHAR(255) UNIQUE NOT NULL,
                is_used BOOLEAN DEFAULT FALSE,
                user_id INT REFERENCES customers(id)
              );

              CREATE TABLE IF NOT EXISTS webhook (
                id SERIAL PRIMARY KEY,
                order_id INT REFERENCES orders(id),
                status VARCHAR(50),
                payment_status VARCHAR(50),
                received_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                customer_id INT
              );
           "
    EOT
  }

  depends_on = [aws_db_instance.postgres]
}
