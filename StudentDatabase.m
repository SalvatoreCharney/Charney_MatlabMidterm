classdef StudentDatabase
    properties
        Students  % Array to store Student objects
    end

    methods
        % Constructor to initialize the Students array
        function obj = StudentDatabase()
            obj.Students = Student.empty;  % Initialize as an empty array of Student objects
        end

        % Add new student
        function obj = addStudent(obj, student)
            obj.Students(end+1) = student;  % Append new student to the array
        end

        % Find student by ID
        function student = findStudentByID(obj, id)
            index = find(strcmp({obj.Students.ID}, id), 1);  % Find the index of the matching student
            if ~isempty(index)
                student = obj.Students(index);
            else
                fprintf('Student with ID %s not found.\n', id);
                student = [];  % Return an empty array if not found
            end
        end

        % Get list of students by major
        function students = getStudentsByMajor(obj, major)
            indices = find(strcmp({obj.Students.Major}, major));  % Get indices of students in the major
            if ~isempty(indices)
                students = obj.Students(indices);
            else
                fprintf('No students found in %s.\n', major);
                students = [];  % Return empty array if no students found in the major
            end
        end

        % Save to file
        function saveToFile(obj, filename)
            try
                save(filename, 'obj');
            catch
                error('Error saving file.');
            end
        end
    end

    % Static method for loading from file
    methods (Static)
        function obj = loadFromFile(filename)
            try
                loadedData = load(filename, 'obj');
                obj = loadedData.obj;
            catch
                error('Error loading file.');
            end
        end
    end
end
