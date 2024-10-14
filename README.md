# Team MIS MIST 4610 Group Project 1
# Team Members
1. Jack Gust [@jackgust1](https://github.com/jackgust1)
2. Katie Lee [@kel64913](https://github.com/kel64913)
3. Jolina Dorgan [@jolinadorgan](https://github.com/jolinadorgan)
4. Emil Kali [@emk19648](https://github.com/emk19648)
5. Michael Haviland [@MichaelHaviland](https://github.com/MichaelHaviland)

# Problem Description
The task at hand is to design and build a relational database that captures the core operations of the University of Georgia (UGA). At the heart of this model is the Student entity, which represents the main focus of the university’s academic and extracurricular activities. Each student is enrolled in courses, taught by faculty across various departments, while utilizing a wide range of university resources such as libraries, classrooms, and dining facilities. Beyond academics, students also participate in events and clubs, further enriching their experience.

This project aims to accurately represent the relationships between students, faculty, courses, departments, and campus facilities, along with activities like events and clubs. We will create sample data to populate the database, ensuring it reflects realistic scenarios. Once the database is built, we will run meaningful queries to extract valuable insights about university operations—such as tracking student performance, analyzing course demand, managing faculty workloads, and optimizing resource use.

The goal is to provide UGA with a comprehensive system that helps administrators make informed, data-driven decisions, ultimately improving efficiency and enhancing the student experience across the university.

# Data Model & Description
The provided database model supports the storage of student-related data for a university system, including meal plans, classes, residence halls, parking assignments, and student involvement in organizations. The core entity, Students, holds information about the student's names, GPA, year, type, and home state. Students is connected to a variety of entities. 

MealPlan has a one to one relationship with students, as one student can only have one meal plan. MealPlan also tracks the type and cost of the meal plan. The Student entity is also related to the Classes entity via the Enrollment associative table. This many-to-many relationship allows students to enroll in multiple classes, and each class can have many students.

The ResidenceHalls and DormRoom entities are tied to the Student through room assignments. A student can have a room in a dorm (via the RoomAssignment table), and each residence hall has multiple rooms. The RoomAssignment table serves as a weak entity that tracks which students are assigned to which rooms, including details such as check-in and check-out dates.

The database also supports extracurricular tracking via the StudentInvolvement table, which manages the many-to-many relationship between students and organizations. A student can join multiple organizations, and each organization can have many students. Similarly, the ParkingAssignment table manages student parking, connecting the Parking entity with the Student entity to track assigned parking spots and the duration of assignments.

Additionally, the StudentPrograms table captures the relationship between students and academic programs. Each student can be enrolled in multiple programs, and each program can have many students.
![Alt text](https://github.com/MichaelHaviland/Team-MIS/blob/main/datamodelagainfinalhopefully.jpeg "Data Model")

# Data Dictionary: University Database

---
## Table: MealPlan

| Column Name   | Description                              | Data Type | Size | Format | Key? |
|---------------|------------------------------------------|-----------|------|--------|------|
| idMealPlan    | PK, unique identifier for each meal plan | INT       |      |        | PK   |
| mealPlanType  | Type of meal plan                        | VARCHAR   | 45   |        |      |
| planCost      | Cost of the meal plan                    | VARCHAR   | 45   |        |      |

---

## Table: Student

| Column Name       | Description                                 | Data Type | Size | Format | Key? |
|-------------------|---------------------------------------------|-----------|------|--------|------|
| idStudent         | PK, unique identifier for each student      | INT       |      |        | PK   |
| studentFName      | First name of the student                   | VARCHAR   | 45   |        |      |
| studentLName      | Last name of the student                    | VARCHAR   | 45   |        |      |
| studentEmail      | Email of the student                        | VARCHAR   | 45   |        |      |
| studentYear       | Academic year of the student                | VARCHAR   | 45   |        |      |
| studentGpa        | GPA of the student                          | VARCHAR   | 45   |        |      |
| studentType       | Type of student (e.g., full-time, part-time) | VARCHAR   | 45   |        |      |
| studentHomeState  | Home state of the student                   | VARCHAR   | 45   |        |      |
| idMealPlan        | FK, references `MealPlan.idMealPlan`        | INT       |      |        | FK   |

---

## Table: Classes

| Column Name   | Description                         | Data Type | Size | Format | Key? |
|---------------|-------------------------------------|-----------|------|--------|------|
| idClasses     | PK, unique identifier for each class | INT       |      |        | PK   |
| className     | Name of the class                   | VARCHAR   | 45   |        |      |

---

## Table: Enrollment

| Column Name   | Description                                    | Data Type | Size | Format | Key? |
|---------------|------------------------------------------------|-----------|------|--------|------|
| idStudent     | FK, references `Student.idStudent`             | INT       |      |        | PK, FK |
| idClasses     | FK, references `Classes.idClasses`             | INT       |      |        | PK, FK |

---

## Table: Organizations

| Column Name         | Description                                  | Data Type | Size | Format | Key? |
|---------------------|----------------------------------------------|-----------|------|--------|------|
| idOrganizations     | PK, unique identifier for each organization  | INT       |      |        | PK   |
| organizationName    | Name of the organization                     | VARCHAR   | 45   |        |      |
| organizationType    | Type of the organization (e.g., club, society) | VARCHAR   | 45   |        |      |

---

## Table: Parking

| Column Name     | Description                           | Data Type | Size | Format | Key? |
|-----------------|---------------------------------------|-----------|------|--------|------|
| idParking       | PK, unique number identifying parking | INT       | 3    |        | PK   |
| parkingLocation | Name of location for parking          | VARCHAR   | 45   |        |      |
| parkingType     | Identifies the type of parking        | VARCHAR   | 45   |        |      |

---

## Table: ResidenceHalls

| Column Name            | Description                                   | Data Type | Size | Format | Key? |
|------------------------|-----------------------------------------------|-----------|------|--------|------|
| idResidenceHall         | PK, unique identifier for each residence hall | INT       |      |        | PK   |
| residenceHallName       | Name of the residence hall                    | VARCHAR   | 45   |        |      |
| residenceHallOccupancy  | Maximum occupancy of the residence hall       | VARCHAR   | 45   |        |      |

---

## Table: ParkingAssignment

| Column Name                | Description                                | Data Type | Size | Format | Key? |
|----------------------------|--------------------------------------------|-----------|------|--------|------|
| idParkingAssignment         | PK, unique identifier for parking assignment | INT       |      |        | PK   |
| idParking                   | FK, references `Parking.idParking`         | INT       |      |        | FK   |
| idStudent                   | FK, references `Student.idStudent`         | INT       |      |        | FK   |
| parkingAssignmentStartDate  | Start date of parking assignment           | VARCHAR   | 45   |        |      |
| parkingAssignmentEndDate    | End date of parking assignment             | VARCHAR   | 45   |        |      |

---

## Table: StudentInvolvement

| Column Name           | Description                                       | Data Type | Size | Format | Key? |
|-----------------------|---------------------------------------------------|-----------|------|--------|------|
| idStudentInvolvement   | PK, unique identifier for involvement record      | INT       |      |        | PK   |
| idOrganizations        | FK, references `Organizations.idOrganizations`   | INT       |      |        | FK   |
| idStudent              | FK, references `Student.idStudent`               | INT       |      |        | FK   |

---

## Table: DormRoom

| Column Name        | Description                                  | Data Type | Size | Format | Key? |
|--------------------|----------------------------------------------|-----------|------|--------|------|
| idDormRoom         | PK, unique identifier for each dorm room     | INT       |      |        | PK   |
| idResidenceHall    | FK, references `ResidenceHalls.idResidenceHall` | INT    |      |        | PK, FK |
| dormRoomType       | Type of dorm room (e.g., single, double)     | VARCHAR   | 45   |        |      |

---

## Table: RoomAssignment

| Column Name            | Description                                  | Data Type | Size | Format | Key? |
|------------------------|----------------------------------------------|-----------|------|--------|------|
| idRoomAssignment        | PK, unique identifier for room assignment   | INT       |      |        | PK   |
| idDormRoom              | FK, references `DormRoom.idDormRoom`        | INT       |      |        | FK   |
| idStudent               | FK, references `Student.idStudent`          | INT       |      |        | FK   |
| roomAssignmentStartDate | Start date of the room assignment            | VARCHAR   | 45   |        |      |
| roomAssignmentEndDate   | End date of the room assignment              | VARCHAR   | 45   |        |      |

---

## Table: Programs

| Column Name   | Description                             | Data Type | Size | Format | Key? |
|---------------|-----------------------------------------|-----------|------|--------|------|
| idPrograms    | PK, unique identifier for each program  | INT       |      |        | PK   |
| programName   | Name of the program                     | VARCHAR   | 45   |        |      |
| programType   | Type of the program (e.g., degree, certificate) | VARCHAR | 45   |        |      |

---

## Table: StudentPrograms

| Column Name                | Description                                    | Data Type | Size | Format | Key? |
|----------------------------|------------------------------------------------|-----------|------|--------|------|
| idStudent                  | FK, references `Student.idStudent`             | INT       |      |        | PK, FK |
| idPrograms                 | FK, references `Programs.idPrograms`           | INT       |      |        | PK, FK |
| admitTerm                  | Term in which the student was admitted         | VARCHAR   | 45   |        |      |
| expectedGraduationTerm     | Term in which the student is expected to graduate | VARCHAR | 45   |        |      |

---
# Queries

| Feature                   | Query 1 | Query 2 | Query 3 | Query 4 | Query 5 | Query 6 | Query 7 | Query 8 | Query 9 | Query 10 |
|---------------------------|---------|---------|---------|---------|---------|---------|---------|---------|---------|----------|
| **Multiple Table Join**    |    X    |    X    |    X    |    X    |    X    |    X    |         |         |    X    |    X     |
| **Subquery**               |    X    |    X    |         |         |         |         |         |    X    |         |          |
| **GROUP BY**               |         |         |         |    X    |         |    X    |         |         |    X    |    X     |
| **GROUP BY with HAVING**   |         |         |         |         |         |         |         |         |    X    |          |
| **Multi condition WHERE**  |    X    |         |         |         |         |         |    X    |    X    |    X    |          |
| **Built in functions**     |    X    |         |         |         |         |         |         |         |    X    |    X     |
| **REGEXP**                 |         |         |         |         |         |         |    X    |    X    |    X    |          |
| **NOT EXISTS**             |    X    |         |         |         |         |         |         |         |    X    |          |

## Query 1:
![Alt text](https://github.com/MichaelHaviland/Team-MIS/blob/main/query1.jpg "Query 1")
###  Show all students who do not live on campus, but do have parking
This question is useful in finding out how many students have parking on campus and need to drive to campus. This information could be useful in finding out how much parking will be available for events. Combine this question with its inverse (how many live on campus and have parking) and you have a good estimate for how many cars the school will have to deal with at any given time.

## Query 2: 
![Alt text](https://github.com/MichaelHaviland/Team-MIS/blob/main/query2.png "Query 2")
### Count how many freshmen are in each organization at UGA.
This question is useful in finding out which organizations at UGA are most appealing to incoming students. The data could be used to allocate funding to different organizations based on the amount of incoming freshmen applying. It can also be used to help figure out which organizations are struggling to obtain new applicants.

## Query 3: 
![Alt text](https://github.com/MichaelHaviland/Team-MIS/blob/main/query3.png "Query 3")
### Determine how many students reside in high-rise residence halls (Brumby, Russell, Creswell, or BDM), have an active meal plan, and are registered for a university parking permit.
This question is helpful for finding out how many people utilize UGA’s resources, specifically how many students are taking advantage of multiple university resources. This is useful for the university to budget for future years as well as increase or decrease allocation sizes for dorms, parking, and meal plans based on how many students need them. In the long run, this will prevent resource shortages, ultimately increasing the quality of life for the student body as a whole.

## Query 4: 
![Alt text](https://github.com/MichaelHaviland/Team-MIS/blob/main/query4.jpg "Query 4")
### Display the GPA of Student-Athletes (students in Sports Organizations) as well as their intended majors.
This question would be helpful for Student-Athlete advisors to track the progress of Student-Athletes. The academic performance of student-athletes is essential for them to be eligible to play on the team. This query could also be a good indicator of which programs student-athletes tend to succeed in and which ones they tend to need help for. Additionally, we can see which teams tend to perform well academically. Overall, this will allow UGA to allocate tutors and other academic resources accordingly to student-athletes.

## Query 5:
![Alt text](https://github.com/MichaelHaviland/Team-MIS/blob/main/query5.jpg "Query 5")
### List the names and majors of students whose GPA is lower than the average GPA of the University
This question can be useful for the University in tracking which students are struggling, failing, or at risk of not graduating, allowing advisors of respective programs to assist the struggling students. The University can also see which programs tend to be more competitive or rigorous, and therefore diagnose whether the academic struggles are a problem of the student, the program structure, or the staff.

## Query 6:
![Alt text](https://github.com/MichaelHaviland/Team-MIS/blob/main/query6.png "Query 6")
### List the students with a GPA greater than 3.5, who are classified as juniors and greater, currently enrolled in MARK 3000, and actively participating in the American Marketing Association (AMA) club.​
This question helps UGA identify high-achieving students who are excelling academically and engaged in extracurricular activities outside of academics alone. It provides insights into how involvement in extracurriculars, such as in AMA, correlates with strong academic performance. This can also potentially help guide scholarship and award opportunities. Additionally, it helps the university understand which courses and clubs attract top students, which helps with resource allocation and promoting these extracurriculars.

## Query 7:
![Alt text](https://github.com/MichaelHaviland/Team-MIS/blob/main/query7.png "Query 7")
### Retrieve a list of home states that have at least 1 student who is enrolled in STEM programs and is expected to graduate in Spring 2027.
This question is important as it helps UGA understand the geographic distribution of STEM students, which can help with resource allocation and can lead to the implication of targeted support services. By identifying home states, the university can create personalized outreach initiatives to enhance academic success. This information aids in evaluating the effectiveness of the STEM programs and can guide recruitment to attract more students from those regions. Overall, it supports UGA's goal of optimizing student experiences.

## Query 8:
![Alt text](https://github.com/MichaelHaviland/Team-MIS/blob/main/query8.png "Query 8")
### List the students who are actively involved in extracurricular activities but are currently not enrolled in any courses.
This question is significant to UGA because it identifies students who are engaged in campus life yet may be struggling academically. Understanding this allows the university to tailor support services, such as academic advising or tutoring, to encourage these students. Additionally, it provides insights into the balance between student involvement and academic engagement. By addressing the needs of these students, UGA can improve the educational experience and foster a more supportive academic environment.

## Query 9:
![Alt text](https://github.com/MichaelHaviland/Team-MIS/blob/main/query9.png "Query 9")
### Determine the average GPA of each organization. List from highest GPA to lowest. 
This query is intended to find if certain organizations attract higher GPA students and/or if higher GPA students are associated with certain organizations. With additional data, you can add a student count and/or additional filter with a “having” clause to eliminate organizations with not a large enough sample size to ensure the data is meaningful. However, generally this query is beneficial to the university to see whether students’ academic success aligns with involvement in specific organizations, helping the university better understand the extent of extracurricular engagement on student success.

## Query 10:
![Alt text](https://github.com/MichaelHaviland/Team-MIS/blob/main/query10.png "Query 10")
### Determine the average GPA (from highest to lowest), the total number of students, and the number of distinct programs for each home state which attending students are from. 
This question intends to evaluate how students from different states perform academically and the diversity of programs they are enrolled in. It helps the university identify regional strengths and weaknesses as well as improve program-based recruitment to cater towards specific states. 
