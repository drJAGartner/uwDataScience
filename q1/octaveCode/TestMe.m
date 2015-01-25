function b = TestMe(f)
% This is a comment
'The following line has no semicolon. You will see the result of b:' 
b = 17 + 29
'The following line has a semicolon. You will see no output for c:' 
c = b + 31;
'The following line executes simpleKMeans.m and outputs centroids:'
centroids = simpleKMeans(simplePoints, [0, 0; -1, 0; 0, 1])
'The following line presents slightly different centroids:'
centroids = simpleKMeans(simplePoints, [1, 1; -1, -1; -1, 1])
'The following line can be calculated if f is defined.'
d = c + f;
'This text and the following calculations are executed if there is no error'
b = [1, b, c] + 5
return