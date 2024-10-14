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
![Alt text](https://github.com/MichaelHaviland/Team-MIS/blob/main/mist%204610%20FINAL%20data%20model.jpeg "Data Model")

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

## Query 1:
![Alt text](https://github.com/MichaelHaviland/Team-MIS/blob/main/query1.jpg "Query 1")
###  Show all students who do not live on campus, but do have parking
This question is useful in finding out how many students have parking on campus and need to drive to campus. This information could be useful in finding out how much parking will be available for events. Combine this question with its inverse (how many live on campus and have parking) and you have a good estimate for how many cars the school will have to deal with at any given time.

## Query 2: 
![Alt text](https://github.com/MichaelHaviland/Team-MIS/blob/main/query2.jpg "Query 2")
### Count how many freshmen are in each organization at UGA.
This question is useful in finding out which organizations at UGA are most appealing to incoming students. The data could be used to allocate funding to different organizations based on the amount of incoming freshmen applying. It can also be used to help figure out which organizations are struggling to obtain new applicants.

## Query 3: 
![Alt text](https://github.com/MichaelHaviland/Team-MIS/blob/main/query3.jpg "Query 3")
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
![Alt text](https://github.com/MichaelHaviland/Team-MIS/blob/main/query6.jpg "Query 6")
### List the students with a GPA greater than 3.5, who are classified as juniors and greater, currently enrolled in MARK 3000, and actively participating in the American Marketing Association (AMA) club.​
This question helps UGA identify high-achieving students who are excelling academically and engaged in extracurricular activities outside of academics alone. It provides insights into how involvement in extracurriculars, such as in AMA, correlates with strong academic performance. This can also potentially help guide scholarship and award opportunities. Additionally, it helps the university understand which courses and clubs attract top students, which helps with resource allocation and promoting these extracurriculars.

## Query 7:
![Alt text](https://github.com/MichaelHaviland/Team-MIS/blob/main/query7.jpg "Query 7")
### Retrieve a list of home states that have at least 1 student who is enrolled in STEM programs and is expected to graduate in Spring 2027.
This question is important as it helps UGA understand the geographic distribution of STEM students, which can help with resource allocation and can lead to the implication of targeted support services. By identifying home states, the university can create personalized outreach initiatives to enhance academic success. This information aids in evaluating the effectiveness of the STEM programs and can guide recruitment to attract more students from those regions. Overall, it supports UGA's goal of optimizing student experiences.

## Query 8:
![Alt text](https://github.com/MichaelHaviland/Team-MIS/blob/main/query8.jpg "Query 8")
### List the students who are actively involved in extracurricular activities but are currently not enrolled in any courses.
This question is significant to UGA because it identifies students who are engaged in campus life yet may be struggling academically. Understanding this allows the university to tailor support services, such as academic advising or tutoring, to encourage these students. Additionally, it provides insights into the balance between student involvement and academic engagement. By addressing the needs of these students, UGA can improve the educational experience and foster a more supportive academic environment.
