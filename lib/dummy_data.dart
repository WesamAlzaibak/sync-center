import 'package:sync_center_mobile/features/companies/domain/entities/company.dart';

import 'features/files/domain/entities/project_file.dart';
import 'features/projects/domain/entities/project.dart';
import 'features/projects/domain/entities/user_projects.dart';
import 'features/tasks/domain/entities/task.dart';
import 'features/tasks/domain/enums/task_type.dart';

List<UserProjects> userProjectList = [
  UserProjects(
    name: "Moushref Project",
    id: 1,
    createdDate: DateTime(2024, 6, 3),
    logo:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8kjNASp-t4VymZrnRo9hIMRSeTcWNarxbJw&s',
  ),
  UserProjects(
    name: "Moushref Project",
    id: 1,
    createdDate: DateTime(2024, 6, 3),
    logo:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8kjNASp-t4VymZrnRo9hIMRSeTcWNarxbJw&s',
  ),
  UserProjects(
    name: "Moushref Project",
    id: 1,
    createdDate: DateTime(2024, 6, 3),
    logo:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8kjNASp-t4VymZrnRo9hIMRSeTcWNarxbJw&s',
  ),
];

List<Project> projectList = [
  Project(
    name: "Moushref Project",
    id: 1,
    logo:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8kjNASp-t4VymZrnRo9hIMRSeTcWNarxbJw&s',
    todoCount: 15,
    inProgressCount: 10,
    toReviewCount: 20,
    doneCount: 18,
    createdDate: DateTime(2024, 6, 3),
    description:
        "Moushref Project \nIt is a post-oil plan for the Kingdom of Saudi Arabia that was announced on April 25, 2016 AD\ncoincides with the date specified for announcing the completion of the delivery of 80 giant government projects\nthe cost of each of which is no less than 3.7 billion riyals and up to 20 billion riyals, as in the Riyadh Metro project.\nThe plan was organized by the Council of Economic and Development Affairs\nheaded by Prince Mohammed bin Salman\nAnd was presented to the Council of Ministers headed by King Salman bin Abdulaziz Al Saud for approval\nThe public, private and non-profit sectors participate in achieving it.",
  ),
  Project(
    name: "Moushref Project",
    id: 1,
    logo:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8kjNASp-t4VymZrnRo9hIMRSeTcWNarxbJw&s',
    todoCount: 15,
    inProgressCount: 10,
    toReviewCount: 20,
    doneCount: 18,
    createdDate: DateTime(2024, 6, 3),
    description:
        "Moushref Project \nIt is a post-oil plan for the Kingdom of Saudi Arabia that was announced on April 25, 2016 AD\ncoincides with the date specified for announcing the completion of the delivery of 80 giant government projects\nthe cost of each of which is no less than 3.7 billion riyals and up to 20 billion riyals, as in the Riyadh Metro project.\nThe plan was organized by the Council of Economic and Development Affairs\nheaded by Prince Mohammed bin Salman\nAnd was presented to the Council of Ministers headed by King Salman bin Abdulaziz Al Saud for approval\nThe public, private and non-profit sectors participate in achieving it.",
  ),
  Project(
    name: "Moushref Project",
    id: 1,
    logo:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8kjNASp-t4VymZrnRo9hIMRSeTcWNarxbJw&s',
    todoCount: 15,
    inProgressCount: 10,
    toReviewCount: 20,
    doneCount: 18,
    createdDate: DateTime(2024, 6, 3),
    description:
        "Moushref Project \nIt is a post-oil plan for the Kingdom of Saudi Arabia that was announced on April 25, 2016 AD\ncoincides with the date specified for announcing the completion of the delivery of 80 giant government projects\nthe cost of each of which is no less than 3.7 billion riyals and up to 20 billion riyals, as in the Riyadh Metro project.\nThe plan was organized by the Council of Economic and Development Affairs\nheaded by Prince Mohammed bin Salman\nAnd was presented to the Council of Ministers headed by King Salman bin Abdulaziz Al Saud for approval\nThe public, private and non-profit sectors participate in achieving it.",
  ),
];

Company rLinkCompany = const Company(
  name: "R-link Company",
  id: 1,
  // description:
  //     "The R-Link team designs websites and applications focused on elevating the user experience and promoting growth.\nNo alternative text description for this image.",
  //
  imageUrl:
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRkaJyTKoMqTVDv0kBA6HXUtx576cyuhaPcA&s",
  //location: "Damascus-Free Area",
  projectsNumber: 14,
  //employeesNumber: 25,
  phoneNumber: "+963995967227",
  email: "R-Link_company@gmail.com",
);

List<Task> tasks = [
  Task(
    title: "Creating Home Screen",
    type: TaskType.toDo,
    description: "this task should make the ",
    id: 0,
    employeeName: 'Wesam Alzaibak',
    finishDate: DateTime(2024, 5, 23),
  ),
  Task(
    title: "Creating Home Screen",
    type: TaskType.inProgress,
    description: "this task should make the ",
    id: 1,
    employeeName: 'Wesam Alzaibak',
    finishDate: DateTime(2024, 5, 23),
  ),
  Task(
    title: "Creating Home Screen",
    type: TaskType.toReview,
    description: "this task should make the ",
    id: 2,
    employeeName: 'Wesam Alzaibak',
    finishDate: DateTime(2024, 5, 23),
  ),
  Task(
    title: "Creating Home Screen",
    type: TaskType.done,
    description: "this task should make the ",
    id: 3,
    employeeName: 'Wesam Alzaibak',
    finishDate: DateTime(2024, 5, 23),
  ),
  Task(
    title: "Creating Home Screen",
    type: TaskType.toDo,
    description: "this task should make the ",
    id: 4,
    employeeName: 'Wesam Alzaibak',
    finishDate: DateTime(2024, 5, 23),
  ),
  Task(
    title: "Creating Home Screen",
    type: TaskType.inProgress,
    description: "this task should make the ",
    id: 5,
    employeeName: 'Wesam Alzaibak',
    finishDate: DateTime(2024, 5, 23),
  ),
  Task(
    title: "Creating Home Screen",
    type: TaskType.toReview,
    description: "this task should make the ",
    id: 6,
    employeeName: 'Wesam Alzaibak',
    finishDate: DateTime(2024, 5, 23),
  ),
  Task(
    title: "Creating Home Screen",
    type: TaskType.done,
    description: "this task should make the ",
    id: 7,
    employeeName: 'Wesam Alzaibak',
    finishDate: DateTime(2024, 5, 23),
  ),
  Task(
    title: "Creating Home Screen",
    type: TaskType.toDo,
    description: "this task should make the ",
    id: 8,
    employeeName: 'Wesam Alzaibak',
    finishDate: DateTime(2024, 5, 23),
  ),
  Task(
    title: "Creating Home Screen",
    type: TaskType.inProgress,
    description: "this task should make the ",
    id: 9,
    employeeName: 'Wesam Alzaibak',
    finishDate: DateTime(2024, 5, 23),
  ),
  Task(
    title: "Creating Home Screen",
    type: TaskType.toReview,
    description: "this task should make the ",
    id: 10,
    employeeName: 'Wesam Alzaibak',
    finishDate: DateTime(2024, 5, 23),
  ),
  Task(
    title: "Creating Home Screen",
    type: TaskType.done,
    description:
        "this task should make the this task should make the this task should make the this task should make the this task should make the this task should make the this task should make the this task should make the this task should make the this task should make the ",
    id: 11,
    employeeName: 'Wesam Alzaibak',
    finishDate: DateTime(2024, 5, 23),
  ),
];

List<ProjectFile> projectFilesList = [
  ProjectFile(
    url:
        "http://192.168.1.8:8000/storage/5/[EgyBest].Avengers.Endgame.2019.BluRay.1080p.x264.mp4_snapshot_00.52.58.585.jpg",
    userName: "R-Link",
    userPicture: "http://192.168.1.8:8000/storage/1/08ian-nepomniachtchi.jpg",
    id: 1,
    date: DateTime(2024, 6, 7),
  ),
  ProjectFile(
    url: "http://192.168.1.8:8000/storage/2/منصة-التأشيرات.pdf",
    userName: "R-Link",
    userPicture: "http://192.168.1.8:8000/storage/1/08ian-nepomniachtchi.jpg",
    id: 1,
    date: DateTime(2024, 3, 23),
  ),
  ProjectFile(
    url: "http://192.168.1.8:8000/storage/3/text_for_testing.txt",
    userName: "R-Link",
    userPicture: "http://192.168.1.8:8000/storage/1/08ian-nepomniachtchi.jpg",
    id: 1,
    date: DateTime(2023, 8, 20),
  ),
  ProjectFile(
    url: "http://192.168.1.8:8000/storage/4/الفرونت-النقاقين.docx",
    userName: "R-Link",
    userPicture: "http://192.168.1.8:8000/storage/1/08ian-nepomniachtchi.jpg",
    id: 1,
    date: DateTime(2023, 6, 9),
  ),
];
