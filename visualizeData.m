function visualizeData(database)
    % GPA distribution histogram
    gpas = [database.Students.GPA];
    figure('Position', [100, 100, 600, 400]);  % Set a fixed size for the figure
    histogram(gpas, 10);  % Set number of bins to 10 for better visualization
    title('GPA Distribution');
    xlabel('GPA');
    ylabel('Frequency');
    grid on;  % Add grid for better readability
    xlim([min(gpas) - 0.1, max(gpas) + 0.1]);  % Set limits to fit data range better

    % Average GPA by major
    majors = unique({database.Students.Major});
    avgGPAs = arrayfun(@(m) mean([database.getStudentsByMajor(m{1}).GPA]), majors);
    figure('Position', [100, 100, 600, 400]);  % Set a fixed size for the figure
    bar(categorical(majors), avgGPAs);
    title('Average GPA by Major');
    xlabel('Major');
    ylabel('Average GPA');
    grid on;  % Add grid for better readability

    % Age distribution
    ages = [database.Students.Age];
    figure('Position', [100, 100, 600, 400]);  % Set a fixed size for the figure
    histogram(ages, 10);  % Set number of bins to 10 for better visualization
    title('Age Distribution');
    xlabel('Age');
    ylabel('Frequency');
    grid on;  % Add grid for better readability
    xlim([min(ages) - 1, max(ages) + 1]);  % Set limits to fit age range better
end
