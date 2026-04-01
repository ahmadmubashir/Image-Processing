% Load the text file
fid = fopen('text_file.txt');
text = fscanf(fid,'%c');
fclose(fid);

% Define the number of questions to generate
num_questions = 10;

% Define the number of answer choices for each question
num_choices = 5;

% Split the text into sentences
sentences = splitSentences(text);

% Remove sentences that are too short or too long
min_length = 50; % minimum sentence length
max_length = 150; % maximum sentence length
sentences = sentences(cellfun(@(x) length(x)>=min_length && length(x)<=max_length, sentences));

% Select random sentences to use as question stems
question_stems = datasample(sentences, num_questions);

% Generate answer choices for each question stem
answer_choices = cell(num_questions, num_choices);
for i = 1:num_questions
    % Split the question stem into words
    words = split(question_stems{i});

    % Remove common words and punctuation
    common_words = {'a', 'an', 'the', 'is', 'are', 'was', 'were', 'has', 'have', 'had', 'of', 'in', 'on', 'at', 'to', 'for', 'with', 'by', 'from', 'as', 'that', 'which', 'who', 'whom', 'whose', 'where', 'when', 'why', 'how'};
    punctuation = {'.', ',', ';', ':', '!', '?'};
    words = setdiff(words, common_words);
    words = regexprep(words, ['[' char(join(punctuation)) ']'], '');

    % Select random words to use as answer choices
    answer_words = datasample(words, num_choices-1, 'Replace', false);

    % Add the correct answer to the list of choices
    answer = words{randi(length(words))};
    answer_choices(i,:) = [{answer} answer_words];
end

% Print the questions and answer choices
for i = 1:num_questions
    fprintf('Q%d: %s\n', i, question_stems{i});
    for j = 1:num_choices
        fprintf('%c. %s\n', char('A'+j-1), answer_choices{i,j});
    end
    fprintf('\n');
end
