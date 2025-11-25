1. cd frontend 
npm run dev
http://localhost:8080

2. cd backend 
./mvnw spring-boot:run
http://localhost:5173

https://static.topmate.io/jDjgxJGrqUBD6AveSywBVp.json

https://schema.getpostman.com/json/collection/v2.1.0/collection.json

## Steps to run the project

1. Opend the backend project (billingsoftware) in your favorite IDE (preferrably IntelliJ IDEA)
2. Open application.properties file, add your aws, razorpay access key and secret key (Don't use mine, it won't work)
3. Create the database with name billing_app
4. Start the application
    It will automatically create the tables. Now we need to insert admin record
    --
    SQL query
    --
    INSERT INTO tbl_users (
        name,
        email,
        password,
        role,
        created_at,
        updated_at,
        user_id
    )
    VALUES (
        'admin',
        'admin@example.com',
        '$2a$10$Jv28cuVrSxzPsZeujtM8F.aqV7aSlUDu05GhYzG/cbd1gtTNurQRe',
        'ROLE_ADMIN',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP,
        gen_random_uuid()
    );
    Password: 123456
    If you want to generate different password then from the postman collection use Encode password API
    http://localhost:8080/api/v1.0/encode
    --
5. Open freontend project (client) in your favorite code editor (preferrably VCS or WebStorm)
6. Open contants.js file, add your razorpay access key
7. ## Start the application




You said:
i have one project 
in the root folder there are three folders stored in a single repository
frontend - react 
backend - java spring boot
database - postgres sql query dbscript

project running steps
cd frontend
npm run dev

in other terminal
cd backend
./mvnw spring-boot:run

in this way my project is running locally.

now i want to deploy my frontend in vercel
and backend in render

and for database storage i am using pgadmin where i am storing my tables and data

now give me steps to achieve what i want 
and tell me is this a good way to go on the project

# backend render deployment
Build Command: ./mvnw clean package -DskipTests
Start Command: java -jar target/*.jar

# frontend vercel deployment
Framework: Vite
Install Command: npm install
Build Command: npm run build
Output Directory: dist
