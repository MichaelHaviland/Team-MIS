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

## 1. Table: MealPlan

| Column Name   | Data Type   | Description                     | Constraints   |
|---------------|-------------|---------------------------------|---------------|
| idMealPlan    | INT         | Unique identifier for each meal plan | Primary Key   |
| mealPlanType  | VARCHAR(45) | Type of meal plan (e.g., Regular, Premium) | Nullable      |
| planCost      | VARCHAR(45) | Cost of the meal plan            | Nullable      |

---

## 2. Table: Student

| Column Name       | Data Type   | Description                                 | Constraints        |
|-------------------|-------------|---------------------------------------------|--------------------|
| idStudent         | INT         | Unique identifier for each student          | Primary Key        |
| studentFName      | VARCHAR(45) | First name of the student                   | Nullable           |
| studentLName      | VARCHAR(45) | Last name of the student                    | Nullable           |
| studentEmail      | VARCHAR(45) | Email of the student                        | Nullable           |
| studentYear       | VARCHAR(45) | Academic year of the student (e.g., Freshman, Sophomore) | Nullable           |
| studentGpa        | VARCHAR(45) | GPA of the student                          | Nullable           |
| studentType       | VARCHAR(45) | Type of student (e.g., full-time, part-time) | Nullable           |
| studentHomeState  | VARCHAR(45) | Home state of the student                   | Nullable           |
| idMealPlan        | INT         | Foreign key referencing `MealPlan.idMealPlan` | Not Null, Foreign Key |

---

## 3. Table: Classes

| Column Name   | Data Type   | Description                         | Constraints   |
|---------------|-------------|-------------------------------------|---------------|
| idClasses     | INT         | Unique identifier for each class    | Primary Key   |
| className     | VARCHAR(45) | Name of the class                   | Nullable      |

---

## 4. Table: Enrollment

| Column Name   | Data Type   | Description                         | Constraints   |
|---------------|-------------|-------------------------------------|---------------|
| idStudent     | INT         | Foreign key referencing `Student.idStudent` | Primary Key, Foreign Key |
| idClasses     | INT         | Foreign key referencing `Classes.idClasses` | Primary Key, Foreign Key |

---

## 5. Table: Organizations

| Column Name         | Data Type   | Description                             | Constraints   |
|---------------------|-------------|-----------------------------------------|---------------|
| idOrganizations     | INT         | Unique identifier for each organization | Primary Key   |
| organizationName    | VARCHAR(45) | Name of the organization                | Nullable      |
| OrganizationType    | VARCHAR(45) | Type of the organization (e.g., club, society) | Nullable      |

---

## 6. Table: Parking

| Column Name     | Data Type   | Description                            | Constraints   |
|-----------------|-------------|----------------------------------------|---------------|
| idParking       | INT         | Unique identifier for each parking lot | Primary Key   |
| parkingLocation | VARCHAR(45) | Location of the parking lot            | Nullable      |
| parkingType     | VARCHAR(45) | Type of parking (e.g., student, visitor) | Nullable      |

---

## 7. Table: ResidenceHalls

| Column Name          | Data Type   | Description                                      | Constraints   |
|----------------------|-------------|--------------------------------------------------|---------------|
| idResidenceHall       | INT         | Unique identifier for each residence hall        | Primary Key   |
| residenceHallName     | VARCHAR(45) | Name of the residence hall                       | Nullable      |
| residenceHallOccupancy| VARCHAR(45) | Maximum occupancy of the residence hall          | Nullable      |

---

## 8. Table: ParkingAssignment

| Column Name                 | Data Type   | Description                            | Constraints   |
|-----------------------------|-------------|----------------------------------------|---------------|
| idParkingAssignment          | INT         | Unique identifier for each parking assignment | Primary Key   |
| idParking                   | INT         | Foreign key referencing `Parking.idParking` | Foreign Key   |
| idStudent                   | INT         | Foreign key referencing `Student.idStudent` | Foreign Key   |
| parkingAssignmentStartDate   | VARCHAR(45) | Start date of the parking assignment   | Nullable      |
| parkingAssignmentEndDate     | VARCHAR(45) | End date of the parking assignment     | Nullable      |

---

## 9. Table: StudentInvolvement

| Column Name           | Data Type   | Description                                       | Constraints   |
|-----------------------|-------------|---------------------------------------------------|---------------|
| idStudentInvolvement   | INT         | Unique identifier for each involvement record     | Primary Key   |
| idOrganizations        | INT         | Foreign key referencing `Organizations.idOrganizations` | Foreign Key   |
| idStudent              | INT         | Foreign key referencing `Student.idStudent`       | Foreign Key   |

---

## 10. Table: DormRoom

| Column Name        | Data Type   | Description                                 | Constraints        |
|--------------------|-------------|---------------------------------------------|--------------------|
| idDormRoom         | INT         | Unique identifier for each dorm room        | Primary Key        |
| idResidenceHall    | INT         | Foreign key referencing `ResidenceHalls.idResidenceHall` | Primary Key, Foreign Key |
| dormRoomType       | VARCHAR(45) | Type of dorm room (e.g., single, double)    | Nullable           |

---

## 11. Table: RoomAssignment

| Column Name            | Data Type   | Description                                  | Constraints   |
|------------------------|-------------|----------------------------------------------|---------------|
| idRoomAssignment        | INT         | Unique identifier for each room assignment   | Primary Key   |
| idDormRoom              | INT         | Foreign key referencing `DormRoom.idDormRoom` | Foreign Key   |
| idStudent               | INT         | Foreign key referencing `Student.idStudent`   | Foreign Key   |
| roomAssignmentStartDate | VARCHAR(45) | Start date of the room assignment            | Nullable      |
| roomAssignmentEndDate   | VARCHAR(45) | End date of the room assignment              | Nullable      |

---

## 12. Table: Programs

| Column Name   | Data Type   | Description                             | Constraints   |
|---------------|-------------|-----------------------------------------|---------------|
| idPrograms    | INT         | Unique identifier for each program      | Primary Key   |
| programName   | VARCHAR(45) | Name of the program                     | Nullable      |
| programType   | VARCHAR(45) | Type of the program (e.g., degree, certificate) | Nullable      |

---

## 13. Table: StudentPrograms

| Column Name                | Data Type   | Description                                    | Constraints   |
|----------------------------|-------------|------------------------------------------------|---------------|
| idStudent                  | INT         | Foreign key referencing `Student.idStudent`     | Primary Key, Foreign Key |
| idPrograms                 | INT         | Foreign key referencing `Programs.idPrograms`   | Primary Key, Foreign Key |
| admitTerm                  | VARCHAR(45) | The term in which the student was admitted      | Nullable      |
| expectedGraduationTerm     | VARCHAR(45) | The term in which the student is expected to graduate | Nullable      |

---
