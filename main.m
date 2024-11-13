% Initialize database
db = StudentDatabase();

% Add sample students
db = db.addStudent(Student('S001', 'Alice', 20, 3.8, 'Computer Science'));
db = db.addStudent(Student('S002', 'Bob', 22, 3.5, 'Mathematics'));
db = db.addStudent(Student('S003', 'Charlie', 21, 3.9, 'Physics'));

% Perform searches
disp('Searching for student with ID S001:');
student = db.findStudentByID('S001');
if ~isempty(student)
    student.displayInfo();
end

disp('Listing students in Computer Science:');
studentsInCS = db.getStudentsByMajor('Computer Science');
if ~isempty(studentsInCS)
    for i = 1:length(studentsInCS)
        studentsInCS(i).displayInfo();
    end
end

visualizeData(db);
