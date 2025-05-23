**Step 1**: Setting up the infrastructure (Cassandara and NIFI)`docker-compose up -d`

**Step 2**: Create Cassandra initialization script `cassandra_model.sql`

**Step 3**: Initial Cassandra Database by running these commands
- First: Copy the model script to Cassandra container 
`docker cp cassandra_model.sql cassandra_db_test:/cassandra_model.sql`
- Second: Execute that script 
`docker exec -it cassandra_db_test cqlsh -f /cassandra_model.sql`

**Step 4**: Access NIFI Web UI https://localhost:8443

**Step 5**: Configure Database Connection Pool in Nifi 

**Step 6**: Create ETL flow in NIFI 
